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
        // 是否支付
        protected static bool flag = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USERName"] == null)
            {
                Response.Write("<script>alert('您尚未登录，请登录');window.location='login.aspx';</script>");
            }
            else
            {
                if (!IsPostBack)
                {
                    GetData();
                }

            }

        }

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

            // 将当前的地址表填充到dropdownlist中
            DB db1 = new DB();
            string sql1 = "select distinct * from Address where CustomerID=" + Session["USERID"];
            db1.LoadExecuteData(sql1, "Address");
            for (int i = 0; i < db1.MyDataSet.Tables["Address"].Rows.Count; i++)
            {
                DropDownList1.Items.Add(db1.MyDataSet.Tables["Address"].Rows[i]["CustomerName"].ToString());
                DropDownList2.Items.Add(db1.MyDataSet.Tables["Address"].Rows[i]["Phone"].ToString());
                DropDownList3.Items.Add(db1.MyDataSet.Tables["Address"].Rows[i]["Address"].ToString());
                DropDownList4.Items.Add(db1.MyDataSet.Tables["Address"].Rows[i]["PostCode"].ToString());
            }
            db1.OffData();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if(flag)
            {
                flag = false;
                AddOrder(1);
                Response.Write("<script>alert('购买成功！');window.location='myOrders.aspx';</script>");
            }
            else
            {
                AddOrder(0);
                Response.Write("<script>alert('尚未付款！');window.location='myOrders.aspx';</script>");
            }
        }

        private void AddOrder(int f)
        {
            DB db = new DB();

            //用户ID
            int customerid = Convert.ToInt32(Session["USERID"].ToString());
            //收货人
            //优先选取文本框内容，为空则选取下拉表选中内容
            string name = TextBox1.Text.Trim() != "" ? TextBox1.Text.Trim() : DropDownList1.SelectedValue.ToString().Trim();
            //收货电话
            string phone = TextBox2.Text.Trim() != "" ? TextBox2.Text.Trim() : DropDownList2.SelectedValue.ToString().Trim();
            //收货地址
            string address = TextBox3.Text.Trim() != "" ? TextBox3.Text.Trim() : DropDownList3.SelectedValue.ToString().Trim(); 
            //邮编
            string postcode = TextBox4.Text.Trim() != "" ? TextBox4.Text.Trim() : DropDownList4.SelectedValue.ToString().Trim();
            // 配送方式
            string delivery = DropDownList5.SelectedValue.ToString().Trim();
            // 生成18位的订单编号
            Random rd = new Random();
            int id1 = rd.Next(1000, 9999);
            string id = DateTime.Now.ToString("yyyyMMddHHffss") + Convert.ToString(id1);
            // 下单时间
            //string date = DateTime.Now.ToString("yyyy-MM-dd");
            string date = DateTime.Now.ToString("yyyy-MM-dd") + " " + DateTime.Now.ToString("hh:mm:ss");

            ArrayList BookID = new ArrayList();
            string sql = "select BookID,BookNum from ShoppingCart where CustomerID=" + Session["USERID"] + " and State=1 order by  BookID";
            db.LoadExecuteData(sql, "ShoppingCart");//本地加载购物车表
            string insertSQL = "";
            string message = "";
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
                insertSQL = "insert into Torder values('"+ id +"','"+ customerid+"','"+bookid+"','"+postcode+"','"+address+"','"+name+"','"+phone+"','"+message+"','"+date+"','"+delivery+"','"+booknum+"','"+f+"')";
                db.ExecuteNonQuery(insertSQL);
                
                if(f == 1)
                {
                    // 修改商品表的销量和库存
                    string sql2 = "update Book set Sales+="
                    + Convert.ToInt32(db.MyDataSet.Tables["ShoppingCart"].Rows[i]["BookNum"].ToString().Trim()) + ",StockNum-=" + Convert.ToInt32(db.MyDataSet.Tables["ShoppingCart"].Rows[i]["BookNum"].ToString().Trim()) + " where Id=" + Convert.ToInt32(db.MyDataSet.Tables["ShoppingCart"].Rows[i]["BookID"].ToString().Trim());
                       db.ExecuteNonQuery(sql2);
                }
            }
            db.OffData();
            db.Empty();
            DB db3 = new DB();
            for (int j = 0; j < BookID.Count; j++)
            {
                // 删除购物车记录
                string sql3 = "delete from ShoppingCart where  CustomerID=" + Session["USERID"] + " and BookID=" + BookID[j];
                db3.ExecuteNonQuery(sql3);
            }
            db3.OffData();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            flag = true;
            Response.Write("<script>alert('支付成功！');</script>");
        }
    }
}