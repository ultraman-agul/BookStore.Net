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
        protected static int commentNum = 5;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                changeCss(5);
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
                CommentNumber(); // 获取评论数量
                commentData(0); // 评论
            }
        }

        // 点击加入购物车
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            if (Session["USERName"] != null && Session["USERPWD"] != null)
            {
                string bookid = Request.QueryString["Id"].ToString().Trim();
                AddData(bookid);
                Response.Redirect("~/users/shoppingCart.aspx");
            }
            else
            {
                Response.Write("<script>alert('您尚未登陆，请登录');window.location='/users/Login.aspx';</script>");
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
                SqlDataReader sdr = db.DataReader("select Name,SpecialPrice,Pic from Book where Id=" + id);
                string name = null;
                double price = 0.0;
                string pic = null;
                //数据库存在该商品
                while (sdr.Read())
                {
                    name = sdr["Name"].ToString().Trim();
                    price = Convert.ToDouble(sdr["SpecialPrice"].ToString().Trim());
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
                Response.Redirect("~/users/Orders.aspx?");
            }
            else
            {
                Response.Write("<script>alert('您还没登录，请先登录！');window.location='/users/Login.aspx';</script>");
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
            if (db.Query("select * from ShoppingCart where BookID=" + Convert.ToInt32(id) + " and CustomerID=" + Session["USERID"]))//判断该商品在购物车中是否存在
            {
                db.ExecuteNonQuery("update ShoppingCart set BookNum=1,State=1 where CustomerID=" + Session["USERID"] + " and BookID=" + id);//数量=1
            }
            else
            {
                SqlDataReader sdr = db.DataReader("select Name,SpecialPrice,Pic from Book where Id=" + id);
                string name = null;
                double price = 0.0;
                string pic = null;
                while (sdr.Read())
                {
                    name = sdr["Name"].ToString().Trim();
                    price = Convert.ToDouble(sdr["SpecialPrice"].ToString().Trim());
                    pic = sdr["Pic"].ToString().Trim();
                }
                sdr.Close();
                //添加商品到购物车
                db.ExecuteNonQuery("insert into ShoppingCart values(" + Session["USERID"] + "," + id + ",'" + name + "'," + price + ",'" + pic + "',1,1)");
            }
            db.OffData();
        }

        // 发表评论
        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            if(Session["USERID"] == null)
            {
                Response.Write("<script>alert('您尚未登录，请登录');window.location='/users/login.aspx'</script>");
            }
            else
            {
                if (TextBox1.Text.Trim() != null)
                {
                    DB db = new DB();
                    string bid = Request.QueryString["Id"].ToString().Trim();
                    int commentlevel = commentNum;
                    string date = DateTime.Now.ToString("yyyy-MM-dd") + " " + DateTime.Now.ToString("hh:mm:ss");
                    string sql = "insert into LeaveWord(BookID,CustomerID,CommentLevel,LeaveContent,LeaveDate) values('"+ bid +"','"+Session["USERID"]+"','"+commentlevel+"','"+TextBox1.Text.Trim()+"','"+date+"')";
                    db.ExecuteNonQuery(sql);
                    TextBox1.Text = "";
                    commentData(0);
                    CommentNumber(); // 获取评论数量
                    Response.Write("<script>alert('评论成功');</script>");

                }
                else
                {
                    Response.Write("<script>alert('评论内容不能为空');</script>");
                }
                
            }
        }
        
        // 评论数据
        protected void commentData(int flag)
        {
            string selectNum = flag == 0 ? "top 5" : "";
            DB db = new DB();
            string bid = Request.QueryString["Id"].ToString().Trim();
            string sql = "select "+ selectNum + " LoginName,Pic,lw.* from Customer as ct,LeaveWord as lw where ct.Id in (select CustomerID from LeaveWord where BookID = "+bid+ ") and lw.BookID = " +bid + "order by CommentLevel desc, ReplyNumber desc";
            db.LoadExecuteData(sql);
            CommentDataList.DataSource = db.MyDataSet.Tables[0].DefaultView;
            CommentDataList.DataKeyField = "Id";
            CommentDataList.DataBind();
            db.OffData();
        }

        // 点击回复跳转回复页
        protected void CommentCommand(object source, DataListCommandEventArgs e)
        {
            Response.Redirect("~/users/reply.aspx?Id=" + Request.QueryString["Id"].ToString().Trim() + "&Lid=" + e.CommandArgument.ToString());
        }

        // 总的评论条数
        protected void CommentNumber()
        {
            string sql = "select count(*) as number from LeaveWord where BookID=" + Request.QueryString["Id"].ToString();
            DB db = new DB();
            Label16.Text = "累计评论(" + db.DataReader(sql,"number")[0].ToString() + ")条";
        }
        
        protected void changeCss(int num)
        {
            commentNum = num;
            LinkButton8.Attributes.Remove("class");
            LinkButton9.Attributes.Remove("class");
            LinkButton10.Attributes.Remove("class");
            LinkButton11.Attributes.Remove("class");
            LinkButton12.Attributes.Remove("class");
            switch (num)
            {
                case 5:
                    LinkButton12.Attributes.Add("class", "active");
                    LinkButton11.Attributes.Add("class", "active"); 
                    LinkButton10.Attributes.Add("class", "active");
                    LinkButton9.Attributes.Add("class", "active");
                    LinkButton8.Attributes.Add("class", "active"); break;
                case 4:
                    LinkButton11.Attributes.Add("class", "active");
                    LinkButton10.Attributes.Add("class", "active");
                    LinkButton9.Attributes.Add("class", "active");
                    LinkButton8.Attributes.Add("class", "active"); break;
                case 3:
                    LinkButton10.Attributes.Add("class", "active");
                    LinkButton9.Attributes.Add("class", "active"); 
                    LinkButton8.Attributes.Add("class", "active"); break;
                case 2:
                    LinkButton9.Attributes.Add("class", "active");
                    LinkButton8.Attributes.Add("class", "active"); break;
                case 1:
                    LinkButton8.Attributes.Add("class", "active"); break;
            }
        }

        // 多少星评论
        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            changeCss(1);
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            changeCss(2);

        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            changeCss(3);

        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            changeCss(4);

        }

        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            changeCss(5);

        }

        // 查看更多
        protected void LinkButton13_Click(object sender, EventArgs e)
        {
            commentData(1);
        }
    }
}