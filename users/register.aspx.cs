using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDbook
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (TextBox1.Text == "")
            {
                TextBox1.Focus();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string code = tbx_yzm.Text;
            HttpCookie htco = Request.Cookies["ImageV"];
            string scode = htco.Value.ToString();
            if (code.ToUpper() != scode)
            {
                Response.Write("<script>alert('验证码输入不正确！')</script>");
            }
            else
            {
                this.tbx_yzm.Text = "";
                DB db = new DB();
                if (!db.Fault)//判断是否成功连接数据库
                {
                    db.LoadData("Customer");//本地加载数据库
                    if (!db.QueryValue(TextBox1.Text.Trim(), 2))//查询本地数据库，判断用户名是否存在
                    {
                        DataRow dr = db.MyDataSet.Tables[0].NewRow();//根据本地数据库中，表的结构，复制一条空行
                        dr.BeginEdit();//开始编辑行
                        dr["LoginName"] = TextBox1.Text.Trim();
                        dr["Realname"] = TextBox2.Text.Trim();
                        dr["LinkTel"] = TextBox3.Text.Trim();
                        dr["Password"] = db.MD5Hash(TextBox5.Text.Trim());
                        dr["PostCode"] = TextBox7.Text.Trim();
                        db.MyDataSet.Tables[0].Rows.Add(dr); //将编辑的行添加到本地数据库中
                        dr.EndEdit();//结束编辑行
                        db.UploadData();//上传本地数据库
                        db.OffData();
                        db.Empty();
                        Session["USERID"] = TextBox1.Text.Trim();
                        Response.Write("<script>alert('注册成功！');window.location='/users/login.aspx';</script>");
                    }
                    else
                    {
                        db.OffData();
                        db.Empty();
                        Response.Write("<script> alert('用户名已存在！')</script>");
                    }
                }
                else
                {
                    db.OffData();
                    Response.Write("<script> alert('连接数据库失败！')</script>");
                }
            }
        }
    }
}