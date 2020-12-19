using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDbook
{
    public partial class myOrders : System.Web.UI.Page
    {

            protected void Page_Load(object sender, EventArgs e)
            {
                if (Session["USERName"] != null)
                {
                    GetData();
                }
                else
                {
                    Response.Write("<script>alert('您还没登录，请先登录');window.location='/users/login.aspx';</script>");
                }
            }

            protected void GetData()
            {
                DB db = new DB();
                string sql = "select s.* from ( select *, row_number() over (partition by Id order by BuyDate) as group_idx from Torder) s where s.group_idx = 1 and CustomerID = " + Session["USERID"] + "order by BuyDate desc";
                db.LoadExecuteData(sql);
                DataList2.DataKeyField = "Id";
                DataList2.DataSource = db.MyDataSet.Tables[0].DefaultView;
                DataList2.DataBind();
                db.OffData();
            }

            protected void GetData(string id)
            {
                DB db = new DB();
                string sql = "select s.* from(select *, row_number() over(partition by Id order by BuyDate)as group_idx from Torder) s where s.group_idx = 1 and Id = " + id;
                db.LoadExecuteData(sql);
                DataList2.DataKeyField = "Id";
                DataList2.DataSource = db.MyDataSet.Tables[0].DefaultView;
                DataList2.DataBind();
                db.OffData();
            }

            protected DataTable BookDetail(string oid)
            {
                DB db = new DB();
                string sql = "select distinct Book.Id as cId, Book.Name,Book.Pic,Book.SpecialPrice, BookNum from Book, Torder where  BookID = Book.Id and Torder.Id = " + oid;
                db.LoadExecuteData(sql);
                db.OffData();
                return db.MyDataSet.Tables[0];
            }

            protected string GetPrice(string oid)
            {
                DB db = new DB();
                string sql = "select * from Book, Torder where Torder.Id = " + oid + "and Torder.BookID = Book.Id and Torder.CustomerID = " + Session["USERID"];
                SqlDataReader sdr = db.DataReader(sql);
                double totalMoney = 0.0;
                while (sdr.Read())
                {
                    totalMoney += int.Parse(sdr["BookNum"].ToString()) * Convert.ToDouble(sdr["SpecialPrice"].ToString());
                }
                sdr.Close();
                db.OffData();
                return totalMoney.ToString();
            }

            protected void LinkButton1_Click(object sender, EventArgs e)
            {
                try
                {
                    GetData(TextBox1.Text.Trim());
                }
                catch
                {
                    Response.Write("<script>alert('查无此单');</script>");
                }
            }

            protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
            {
                if (e.CommandName == "redirect")
                {
                    Response.Redirect("/users/bookDetail.aspx?Id=" + e.CommandArgument.ToString());
                }
            }
        }
}