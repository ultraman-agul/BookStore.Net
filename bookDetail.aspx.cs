using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDbook
{
    public partial class bookDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DB db = new DB();
                if (!db.Fault)
                {
                    string id = Request.QueryString["Id"].ToString().Trim();
                    db.LoadData("Book", "Id", Convert.ToInt32(id));
                    db.LoadExecuteData("select *  from BookType where Id in(select ParentID from BookType where Id = (select BookTypeID from Book where Id = " + id + ")) or Id = (select BookTypeID from Book where Id = " + id + ")", "bookTypeTable");
                    LinkButton1.Text = db.MyDataSet.Tables["bookTypeTable"].Rows[0][2].ToString();
                    Label1.Text = db.MyDataSet.Tables["bookTypeTable"].Rows[1][2].ToString();
                    Image1.ImageUrl = "~/images/img/" + db.GetValue("Pic");
                    Label2.Text = db.GetValue("Name");
                    Label3.Text = db.GetValue("Name");
                    Label4.Text = db.GetValue("Sales");
                    Label5.Text = db.GetValue("Author");
                    Label6.Text = db.GetValue("PublishCompany");
                    Label8.Text = db.GetValue("PublishDate").Substring(0, 10);
                    Label7.Text = db.GetValue("WordsCount");
                    LinkButton2.Text = db.MyDataSet.Tables["bookTypeTable"].Rows[0][2].ToString();
                    LinkButton3.Text = db.MyDataSet.Tables["bookTypeTable"].Rows[1][2].ToString();
                    Label9.Text += db.GetValue("SpecialPrice");
                    Label10.Text = db.GetValue("Price");
                    Label11.Text = db.GetValue("Description");
                }
                else
                {
                    db.OffData();
                    Response.Write("<script>alter('连接数据库失败')</script>");
                }
            }
        }

        // 点击加入购物车
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            if (Session["USERName"] != null && Session["USERPWD"] != null)
            {
                string bookid = Request.QueryString["Id"].ToString().Trim();
                AddData(bookid);
                Response.Redirect("~/shoppingCart.aspx");

            }
            else
            {
                Response.Write("<script>alert('您尚未登陆，请登录')</script>");
            }
        }

        // 加入到购物车，如果存在数量加一，否则插入
        private void AddData(string id)
        {
            DB db = new DB();
            if (db.Query("select * from ShoppingCart where BookID=" + id + " and CustomerID=" + Session["USERID"]))//判断该商品在购物车中是否存在
            {
                db.ExecuteNonQuery("update ShoppingCart set BookNum=BookNum+1,State=1 where BookID=" + id + " and CustomerID=" + Session["USERID"]);//数量+1
            }
            else
            {
                SqlDataReader sdr = db.DataReader("select Name,Price,Pic from Book where Id=" + id);
                string name = null;
                double price = 0.0;
                string pic = null;
                //数据库存在该商品
                while (sdr.Read())
                {
                    name = sdr["Name"].ToString().Trim();
                    price = Convert.ToDouble(sdr["Price"].ToString().Trim());
                    pic = sdr["Pic"].ToString().Trim();
                }
                sdr.Close();
                //添加商品到购物车
                db.ExecuteNonQuery("insert into ShoppingCart values(" + Session["USERID"] + "," + id + ",'" + name + "'," + price + ",'" + pic + "',1,1)");
            }
            db.OffData();
        }

        // 点击立即购买  将这一件商品插入到空的购物车，然后转到订单
        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            if (Session["USERName"] != null && Session["USERPWD"] != null)
            {
                string id = Request.QueryString["Id"].ToString().Trim();
                UpData();
                AddData2(id);
                Response.Redirect("Orders.aspx?");
            }
            else
            {
                Response.Write("<script>alert('您还没登录，请先登录！')</script>");
            }
        }

        private void UpData()
        {
            DB db = new DB();
            db.ExecuteNonQuery("update ShoppingCart set State=0 where CustomerID=" + Session["USERID"]);//设置购物车全部商品为已购买
            db.OffData();
        }

        // 如果购物车存在该商品则数量为1，如果不存在则添加1件到购物车
        private void AddData2(string id)
        {
            DB db = new DB();
            if (db.Query("select * from ShoppingCart where BookID=" + id + " and CustomerID=" + Session["USERID"]))//判断该商品在购物车中是否存在
            {
                db.ExecuteNonQuery("update ShoppingCart set BookNum=1,State=1 where CustomerID=" + id + " and BookID=" + Session["USERID"]);//数量=1
            }
            else
            {
                SqlDataReader sdr = db.DataReader("select Name,Price,Pic from Book where Id=" + id);
                string name = null;
                double price = 0.0;
                string pic = null;
                while (sdr.Read())
                {
                    name = sdr["Name"].ToString().Trim();
                    price = Convert.ToDouble(sdr["Price"].ToString().Trim());
                    pic = sdr["Pic"].ToString().Trim();
                }
                sdr.Close();
                //添加商品到购物车
                db.ExecuteNonQuery("insert into ShoppingCart values(" + Session["USERID"] + "," + id + ",'" + name + "'," + price + ",'" + pic + "',1,1)");
            }
            db.OffData();
        }
    }
}