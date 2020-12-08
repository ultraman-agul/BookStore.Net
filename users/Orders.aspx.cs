using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDbook
{
    public partial class Orders : System.Web.UI.Page
    {
        protected bool errFlag = false;
        public static string addressInfo = null;
        public static string name = null;
        public static string phone = null;
        public static string postcode = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USERName"] == null)
            {
                Response.Write("<script>alert('您尚未登录，请登录');window.location='/users/login.aspx';</script>");
            }
            else
            {
                if (!IsPostBack)
                {
                    GetData();
                    // 默认线上支付
                    LinkButton3.Style.Add("background-color", "#ff6666");
                    LinkButton3.Style.Add("color", "#ffffff");

                    Button2.Style.Add("visibility", "hidden;");

                    // 清空用户选择的地址
                    addressInfo = null;
                    name = null;
                    phone = null;
                    postcode = null;
                }
            }

        }

        // 填充上方书籍内容 和 用户地址表
        private void GetData()
        {
            DB dB = new DB();
            string sql = "select distinct * from ShoppingCart where State = 1 and CustomerID=" + Session["USERID"] + "order by BookID";
            dB.LoadExecuteData(sql);
            DataList1.DataSource = dB.MyDataSet.Tables[0].DefaultView;
            DataList1.DataKeyField = "BookID";
            DataList1.DataBind();

            // 总价格
            double totalPrice = 0;
            int count = 0;
            SqlDataReader sdr = dB.DataReader("select * from ShoppingCart where State = 1 and CustomerID=" + Session["USERID"]);
            while (sdr.Read())
            {
                totalPrice += Convert.ToInt32(sdr["BookNum"].ToString()) * Convert.ToDouble(sdr["Price"].ToString().Trim());
                count += Convert.ToInt32(sdr["BookNum"]);
            }
            Label3.Text = count.ToString().Trim();
            Label4.Text = "￥" + totalPrice.ToString("0.00");
            Label6.Text = "￥" + totalPrice.ToString("0.00");
            dB.OffData();

            // 地址表
            DB db1 = new DB();
            string sql1 = "select  * from Address where CustomerID=" + Session["USERID"];
            db1.LoadExecuteData(sql1, "Address");
            addressDL.DataSource = db1.MyDataSet.Tables[0].DefaultView;
            addressDL.DataKeyField = "Id";
            addressDL.DataBind();
            db1.OffData();
        }

        // 获取地址表选择内容
        protected void CheckedChanged(object sender, EventArgs e)
        {
            CheckBox myT = (CheckBox)sender;
            int index = ((DataListItem)myT.NamingContainer).ItemIndex;
            string id = addressDL.DataKeys[index].ToString();
            // 获取当前行的CheckBox控件，并取值
            CheckBox cbox = (CheckBox)addressDL.Items[index].FindControl("CheckBox1");
            // 修改数据库的值
            if(cbox.Checked)
            {
                DB db = new DB();
                string sql = "select * from Address where Id="+Convert.ToInt32(id);
                db.LoadExecuteData(sql);
                name = db.GetValue("CustomerName");
                phone = db.GetValue("Phone");
                addressInfo = db.GetValue("AddressName");
                postcode = db.GetValue("PostCode");
                db.OffData();
            }
        }

        // 货到付款，下单按钮
        protected void Button2_Click(object sender, EventArgs e)
        {
            errFlag = false;
            AddOrder(0);
            if(!errFlag)
            {
                Response.Write("<script>alert('下单成功！');window.location='/users/myOrders.aspx';</script>");
            }
        }

        // 添加订单
        private void AddOrder(int f)
        {
            DB db = new DB();
            //用户ID
            int customerid = Convert.ToInt32(Session["USERID"].ToString());
            // 生成18位的订单编号
            Random rd = new Random();
            int id1 = rd.Next(1000, 9999);
            string id = DateTime.Now.ToString("yyyyMMddHHffss") + Convert.ToString(id1);
            // 下单时间
            string date = DateTime.Now.ToString("yyyy-MM-dd") + " " + DateTime.Now.ToString("hh:mm:ss");

            ArrayList BookID = new ArrayList();
            string sql = "select BookID,BookNum from ShoppingCart where CustomerID=" + Session["USERID"] + " and State=1 order by  BookID";
            db.LoadExecuteData(sql, "ShoppingCart");//本地加载购物车表
            string insertSQL = null;
            string message = null;
            string delivery = DropDownList1.SelectedValue;
            // 逐行添加进订单表，并修改Book表的库存和销量
            for (int i = 0; i < db.MyDataSet.Tables["ShoppingCart"].Rows.Count; i++)
            {
                //保存BookID到ArraryList 为了删除购物车的记录
                BookID.Add(Convert.ToInt32(db.MyDataSet.Tables["ShoppingCart"].Rows[i]["BookID"].ToString().Trim()));

                int bookid = Convert.ToInt32(db.MyDataSet.Tables["ShoppingCart"].Rows[i]["BookID"].ToString().Trim()); // 商品id
                int booknum = Convert.ToInt32(db.MyDataSet.Tables["ShoppingCart"].Rows[i]["BookNum"].ToString().Trim()); // 商品数量
                if (TextBox5.Text.Trim() != "")
                {
                    message = TextBox5.Text.Trim(); // 留言
                }
                // 尝试添加到订单表
                try
                { 
                    insertSQL = "insert into Torder values("+ id +","+ customerid+","+bookid+","+postcode+",'"+addressInfo+"','"+name+"','"+phone+"','"+message+"','"+date+"','"+delivery+"','"+booknum+"','"+f+"')";
                    db.ExecuteNonQuery(insertSQL);
                }
                catch
                {
                    Response.Write("<script>alert('请认真填写信息!')</script>");
                    errFlag = true;
                    break;
                }

                if (f == 1)
                {
                    // 修改商品表的销量和库存
                    string sql2 = "update Book set Sales+="
                    + Convert.ToInt32(db.MyDataSet.Tables["ShoppingCart"].Rows[i]["BookNum"].ToString().Trim()) + ",StockNum-=" + Convert.ToInt32(db.MyDataSet.Tables["ShoppingCart"].Rows[i]["BookNum"].ToString().Trim()) + " where Id=" + Convert.ToInt32(db.MyDataSet.Tables["ShoppingCart"].Rows[i]["BookID"].ToString().Trim());
                       db.ExecuteNonQuery(sql2);
                }
            }
            db.OffData();
            db.Empty();
            if(!errFlag)
            {   // 删除购物车记录
                DB db3 = new DB();
                for (int j = 0; j < BookID.Count; j++)
                {
                    string sql3 = "delete from ShoppingCart where  CustomerID=" + Session["USERID"] + " and BookID=" + BookID[j];
                    db3.ExecuteNonQuery(sql3);
                }
                db3.OffData();
            }
        }

        // 线上支付按钮
        protected void Button1_Click(object sender, EventArgs e)
        {
            errFlag = false;
            AddOrder(1);
            if(!errFlag)
            {
                Response.Write("<script>alert('支付成功！');window.location='/users/myOrders.aspx';</script>");
            }
        }
        
        // 选择货到付款
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            LinkButton2.Style.Add("background-color", "#ff6666");
            LinkButton2.Style.Add("color", "#ffffff");
            LinkButton3.Style.Remove("background-color");
            LinkButton3.Style.Remove("color");
            Button1.Enabled = false;
            Button2.Style.Remove("visibility");
        }

        // 选择线上支付
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            LinkButton3.Style.Add("background-color", "#ff6666");
            LinkButton3.Style.Add("color", "#ffffff");
            LinkButton2.Style.Remove("background-color");
            LinkButton2.Style.Remove("color");
            Button1.Enabled = true;
            Button2.Style.Add("visibility", "hidden;");
        }

        // 添加收货地址
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            DB db = new DB();
            db.ExecuteNonQuery("insert into Address values('"+Session["USERID"]+ "','" + TextBox2.Text + "','" + TextBox1.Text + "','" + TextBox3.Text + "','" + TextBox4.Text +"')");
            db.OffData();
            Response.Write("<script>alert('添加成功！');</script>");
            GetData();
        }
    }
}