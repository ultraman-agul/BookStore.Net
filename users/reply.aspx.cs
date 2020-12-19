using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDbook
{
    public partial class reply : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["USERID"] == null)
            {
                Response.Write("<script>alert('您尚未登录，请登录');window.location='/users/login.aspx'</script>");
            }
            else
            {
                if(!IsPostBack)
                {
                    GetData();
                    GetDataReply();
                }
                
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
            //string bid = Request.QueryString["Id"];
            string lid = Request.QueryString["Lid"]; // 用户id
            string date = DateTime.Now.ToString("yyyy-MM-dd") + " " + DateTime.Now.ToString("hh:mm:ss");
            string sql = "insert into Reply values('"+lid+"','"+ Session["USERID"].ToString() +"','"+TextBox1.Text.Trim() +"','"+date+"')";
            DB db = new DB();
            db.ExecuteNonQuery(sql);
            GetDataReply();
            db.OffData();
            TextBox1.Text = "";
            Response.Write("<script>alert('回复成功');</script>");
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
    }
}