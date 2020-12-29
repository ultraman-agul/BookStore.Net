using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDbook
{
    public partial class reply : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetData();
                GetDataReply();
            }
        }

        // 获取书籍留言及书本信息
        protected void GetData()
        {
            string bid = Request.QueryString["Id"];
            string lid = Request.QueryString["Lid"]; // 用户id
            string sql = "select Book.*,Customer.LoginName,Customer.Pic as cPic,LeaveWord.* from Book,LeaveWord,Customer where LeaveWord.Id= " + lid +" and Book.Id ="+bid+" and LeaveWord.CustomerID = Customer.Id";
            DB db = new DB();
            db.LoadExecuteData(sql);
            ReplyDataList.DataSource = db.MyDataSet.Tables[0].DefaultView;
            ReplyDataList.DataKeyField = "Id";
            ReplyDataList.DataBind();
            db.OffData();
        }

        //发表回复
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (Session["USERID"] == null)
            {
                Response.Write("<script>alert('您尚未登录，请登录');window.location='/users/login.aspx'</script>");
            }
            else
            {
                string lid = Request.QueryString["Lid"]; // 用户id
                string date = DateTime.Now.ToString("yyyy-MM-dd") + " " + DateTime.Now.ToString("hh:mm:ss");

                string strContent = TextBox1.Text;
                //下面使用了正则表达式Regex类下的Replace方法。
                string strResult1 = Regex.Replace(strContent, @"{!", "<img src=/images/QQmrbqb_23672/QQexpression/");
                string strResult2 = Regex.Replace(strResult1, @"!}", ".gif>");

                string sql = "insert into Reply values('" + lid + "','" + Session["USERID"].ToString() + "','" + strResult2 + "','" + date + "')";
                DB db = new DB();
                db.ExecuteNonQuery(sql);
                GetDataReply();
                db.OffData();
                TextBox1.Text = "";
                Response.Write("<script>alert('回复成功');</script>");
            }
        }

        // 获取回复数据
        protected void GetDataReply()
        {
            //string bid = Request.QueryString["Id"];
            string lid = Request.QueryString["Lid"]; // 用户id
            string sql = "select Reply.*,LoginName,Pic from Reply,Customer where Customer.Id = Reply.CustomerID and LeaveWordID= " + lid;
            DB db = new DB();
            db.LoadExecuteData(sql);
            ReplyReplyDataList.DataSource = db.MyDataSet.Tables[0].DefaultView;
            ReplyReplyDataList.DataKeyField = "Id";
            ReplyReplyDataList.DataBind();
            db.OffData();
        }

        protected void ReplyDataList_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "describe")
            {
                Response.Redirect("/users/bookDetail.aspx?Id=" + e.CommandArgument.ToString());
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            TextBox1.Text += "{!1!}";
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            TextBox1.Text += "{!2!}";
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            TextBox1.Text += "{!3!}";
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            TextBox1.Text += "{!4!}";
        }

        protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
        {
            TextBox1.Text += "{!5!}";
        }

        protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
        {
            TextBox1.Text += "{!6!}";
        }

        protected void ImageButton7_Click(object sender, ImageClickEventArgs e)
        {
            TextBox1.Text += "{!7!}";
        }

        protected void ImageButton8_Click(object sender, ImageClickEventArgs e)
        {
            TextBox1.Text += "{!8!}";
        }

        protected void ImageButton9_Click(object sender, ImageClickEventArgs e)
        {
            TextBox1.Text += "{!9!}";
        }

        protected void ImageButton10_Click(object sender, ImageClickEventArgs e)
        {
            TextBox1.Text += "{!10!}";
        }

        protected void ImageButton11_Click(object sender, ImageClickEventArgs e)
        {
            TextBox1.Text += "{!11!}";
        }

        protected void ImageButton12_Click(object sender, ImageClickEventArgs e)
        {
            TextBox1.Text += "{!12!}";
        }

        protected void ImageButton13_Click(object sender, ImageClickEventArgs e)
        {
            TextBox1.Text += "{!13!}";
        }

        protected void ImageButton14_Click(object sender, ImageClickEventArgs e)
        {
            TextBox1.Text += "{!14!}";
        }

        protected void ImageButton15_Click(object sender, ImageClickEventArgs e)
        {
            TextBox1.Text += "{!15!}";
        }
    }
}