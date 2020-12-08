using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDbook
{
    public partial class shoppingCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USERName"] != null && Session["USERPWD"] != null)
            {
                if (!IsPostBack)
                {
                    GetData();
                }
            }
            else
            {
                Response.Write("<script>alert('您还没登录，请先登录！');window.location='/users/login.aspx'</script>");
            }
        }

        // 获取数据填充到datalist1
        private void GetData()
        {
            DB db = new DB();
            string sql = "select * from ShoppingCart where CustomerID = " + Session["USERID"] + "order by CustomerID";
            db.LoadExecuteData(sql);
            DataList1.DataKeyField = "BookID";
            DataList1.DataSource = db.MyDataSet.Tables[0].DefaultView;
            DataList1.DataBind();
            db.OffData();
            GetPrice();
        }

        // 计算总金额
        private void GetPrice()
        {
            DB dB = new DB();
            double totalPrice = 0;
            int totalnum = 0;
            string sql1 = "select Price, BookNum from ShoppingCart where State = 1 and CustomerID = " + Session["USERID"];
            SqlDataReader sdr = dB.DataReader(sql1);
            while (sdr.Read())
            {
                totalPrice += Convert.ToInt32(sdr["BookNum"].ToString()) * Convert.ToDouble(sdr["Price"].ToString().Trim());
                totalnum += Convert.ToInt32(sdr["BookNum"]);
            }
            Label3.Text = totalnum.ToString();
            Label4.Text = "￥" + totalPrice.ToString();
            sdr.Close();
            dB.OffData();
        }

        // 修改单选框的状态
        protected void CheckedChanged(object sender, EventArgs e)
        {
            CheckBox myT = (CheckBox)sender;
            int index = ((DataListItem)myT.NamingContainer).ItemIndex;
            string id = DataList1.DataKeys[index].ToString();
            // 获取当前行的CheckBox控件，并取值
            CheckBox cbox = (CheckBox)this.DataList1.Items[index].FindControl("Sstate");
            bool flag = cbox.Checked;
            // 修改数据库的值
            DB db = new DB();
            string sql = "update ShoppingCart set State=" + Convert.ToInt32(flag) + " where BookID=" + Convert.ToInt32(id) + " and CustomerID=" + Session["USERID"];
            db.ExecuteNonQuery(sql);
            db.OffData();
            GetPrice();
        }

        // 编辑
        protected void DataList1_EditCommand(object source, DataListCommandEventArgs e)
        {
            int id = int.Parse(e.CommandArgument.ToString());
            DataList1.EditItemIndex = e.Item.ItemIndex;
            GetData();
        }

        // 取消
        protected void DataList1_CancelCommand(object source, DataListCommandEventArgs e)
        {
            DataList1.EditItemIndex = -1;
            GetData();
        }

        // 更新
        protected void DataList1_UpdateCommand(object source, DataListCommandEventArgs e)
        {
            DB db = new DB();
            try
            {   //只能更改商品数量
                int bookid = int.Parse(e.CommandArgument.ToString());
                int num = Convert.ToInt32((e.Item.FindControl("txt_num") as TextBox).Text.Trim());
                if (num <= 0)
                {
                    //Response.Write("<script>alert('数量不能小于等于0！')");
                    throw new Exception();
                }
                if (db.Update("BookNum", num, bookid, Convert.ToInt32(Session["USERID"])))
                {
                    //Response.Write("<script>alert('修改成功！');</script>");
                    DataList1.EditItemIndex = -1;
                    GetData();
                }
            }
            catch
            {
                //Response.Write("<script>alert('修改失败！');window.location='/users/login.aspx';</script>");
            }
            finally
            {
                db.OffData();
            }
        }

        // 删除
        protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            int bookid = int.Parse(e.CommandArgument.ToString());
            DB db = new DB();
            db.ExecuteNonQuery("delete from ShoppingCart where BookID = " + bookid + "and CustomerID = " + Session["USERID"]);
            db.OffData();
            GetData();
        }

        protected void itemcom(object source, DataListCommandEventArgs e)
        {
            if(e.CommandName == "describe")
            {
                Response.Redirect("/users/bookDetail.aspx?Id=" + e.CommandArgument.ToString()+"&comment=5");
            }
            if(e.CommandName == "sub")
            {
                int num = Convert.ToInt32((e.Item.FindControl("txt_num") as Label).Text.Trim());
                if(num != 1)
                {
                    DB db = new DB();
                    db.LoadExecuteData("update ShoppingCart set BookNum=BookNum-1 where Id="+e.CommandArgument.ToString());
                    db.OffData();
                    GetData();
                }
                
            }
            if (e.CommandName == "add")
            {
                DB db = new DB();
                db.LoadExecuteData("update ShoppingCart set BookNum=BookNum+1 where Id="+e.CommandArgument.ToString());
                db.OffData();
                GetData();
            }
        }

        public static int selectall = 0;
        protected void CheckAll_CheckedChanged(object sender, EventArgs e)
        {
            selectall = selectall == 0 ? 1 : 0;
            DB db = new DB();
            db.LoadExecuteData("update ShoppingCart set State = "+selectall+" where CustomerId=" + Session["USERID"]);
            db.OffData();
            GetData();
        }

        //去结算
        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            if(Label3.Text == "0")
            {
                Response.Redirect("javascript:void(0)");
            }
            else
            {
                Response.Redirect("~/users/Orders.aspx");
            }
        }
    }
}