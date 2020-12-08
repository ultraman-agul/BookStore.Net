using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDbook
{
    public partial class bookManage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Adminame"] == null)
            {
                Response.Write("<script>alert('您还没登录，请先登录');window.location='/users/login.aspx';</script>");
            }
            if (!IsPostBack)
            {
                GetData();
            }
        }

        protected void GetData()
        {
            DB db = new DB();
            db.LoadExecuteData("select Book.*, BookType.Name as btname from Book,BookType where Book.BookTypeID = BookType.Id");
            GridView1.DataSource = db.MyDataSet.Tables[0].DefaultView;
            GridView1.DataKeyNames = new string[] { "Id" };
            GridView1.DataBind();
            db.OffData();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;//实现取消编辑功能
            GetData();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;  //实现编辑功能
            GetData();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetData();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string id = GridView1.DataKeys[e.RowIndex][0].ToString();//取出修改行的主键值
                                                                       //取出修改后各字段的值
                                                                       //展示图地址
            string pic = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[0].Controls[0])).Text.ToString().Trim();
            string booktype = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[1].Controls[0])).Text.ToString().Trim();  
            string name = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[2].Controls[0])).Text.ToString().Trim();
            string description = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[3].Controls[0])).Text.ToString().Trim();
            string author = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[4].Controls[0])).Text.ToString().Trim();
            string company = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[5].Controls[0])).Text.ToString().Trim();
            string publishdate = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[6].Controls[0])).Text.ToString().Trim().Substring(0,10);
            string words = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[7].Controls[0])).Text.ToString().Trim();
            string price = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[8].Controls[0])).Text.ToString().Trim();
            string specialPrice = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[9].Controls[0])).Text.ToString().Trim();
            string stock = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[10].Controls[0])).Text.ToString().Trim();
            string sale = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[11].Controls[0])).Text.ToString().Trim();
            int commend = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[12].Controls[0])).Text.ToString().Trim() == "True" ? 1 : 0;
            int special = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[13].Controls[0])).Text.ToString().Trim() == "True" ? 1 : 0;
            

            //将用户更新的数据修改数据库
            //连接数据库
            string sql = "update Book set Pic='" + pic + "', BookTypeID=(select Id from BookType where Name='" + booktype + "'),Name='" + name +"', Author='" +author+  "', Description='" + description + "', PublishCompany='" + company + "', PublishDate='" + publishdate + "', StockNum=" + Convert.ToInt32(stock) +  ", Sales=" + Convert.ToInt32(sale) + ", Price=" + Convert.ToDouble(price)+ ", IsCommend=" + commend +",IsSpecial="+special+ ",WordsCount='"+ words +"' where Id=" + id;
            DB db = new DB();
            db.ExecuteNonQuery(sql);
            db.OffData();


            GridView1.EditIndex = -1;
            GetData();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = GridView1.DataKeys[e.RowIndex][0].ToString();//取出修改行的主键值
            DB db = new DB();
            db.ExecuteNonQuery("delete from Book where Id=" + id);
            db.OffData();
            GetData();
        }
    }
}