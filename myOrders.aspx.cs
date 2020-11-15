﻿using System;
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
            if(Session["USERName"] != null)
            {
                GetData();
            }
            else
            {
                Response.Write("<script>alert('您还没登录，请先登录');window.location='index.aspx';</script>");
            }
        }

        protected void GetData()
        {
            DB db = new DB();
            string sql = "select * from Torder where CustomerID = " + Session["USERID"] + "order by BuyDate desc";
            db.LoadExecuteData(sql);
            DataList2.DataKeyField = "Id";
            DataList2.DataSource = db.MyDataSet.Tables[0].DefaultView;
            DataList2.DataBind();
            db.OffData();
        }

        protected void GetData(string id)
        {
            DB db = new DB();
            string sql = "select * from Torder where Id =" + id;
            db.LoadExecuteData(sql);
            DataList2.DataKeyField = "Id";
            DataList2.DataSource = db.MyDataSet.Tables[0].DefaultView;
            DataList2.DataBind();
            db.OffData();
        }

        protected DataTable BookDetail(string oid)
        {
            DB db = new DB();
            string sql = "select Book.*, BookNum from Book, Torder where  BookID = Book.Id and Torder.Id = " + oid;
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
                totalMoney += int.Parse(sdr["BookNum"].ToString()) * Convert.ToDouble(sdr["Price"].ToString());
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
    }
}