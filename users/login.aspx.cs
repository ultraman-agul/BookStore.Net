using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDbook
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //清空session
            if (Session["USERName"] != null && Session["USERPWD"] != null)
            {
                Session["USERName"] = null;
                Session["USERPWD"] = null;
                Session["USERID"] = null;
            }
            else if (Session["Adminame"] != null && Session["AdminPWD"] != null)
            {
                Session["Adminame"] = null;
                Session["AdminPWD"] = null;
            }
            //判断是否输入内容
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
                tbx_yzm.Text = "";
                DB db = new DB();
                //是否连接到数据库
                if (!db.Fault)
                {
                    if (RadioButtonList1.Items[0].Selected == true)//用户登录
                    {
                        if (db.Query("SELECT * FROM  Customer  WHERE LoginName='" + TextBox1.Text.Trim() + "'"))
                        {
                            ArrayList arr = db.DataReader("SELECT * FROM Customer WHERE LoginName='" + TextBox1.Text.Trim() + "'", "Password");
                            //对比密码是否正确  如果没错将文本信息赋值将SESSION里面
                            string pwd = db.MD5Hash(TextBox2.Text.Trim());
                            if (arr[0].ToString() == pwd)
                            {
                                string sqlID = "SELECT Id FROM Customer WHERE LoginName='" + TextBox1.Text.Trim() + "'";
                                ArrayList arr1 = db.DataReader(sqlID, "Id");
                                //Session存储信息
                                Session["USERID"] = Convert.ToInt32(arr1[0]);
                                Session["USERName"] = TextBox1.Text.Trim();
                                Session["USERPWD"] = pwd;
                                // 执行完 关闭连接和 释放资源
                                db.OffData();
                                //跳转到主页
                                Response.Redirect("~/index.aspx? ");
                            }
                            else
                            {
                                db.OffData();
                                Response.Write("<script>alert('密码错误！')</script>");
                            }
                        }
                        else
                        {
                            db.OffData();
                            Response.Write("<script>alert('用户名错误！')</script>");
                        }
                    }
                    else
                    {   //管理员登录
                        if (db.Query("SELECT * FROM  SysUser  WHERE LoginName='" + TextBox1.Text.Trim() + "'"))
                        {
                            ArrayList arr = db.DataReader("SELECT * FROM SysUser WHERE LoginName='" + TextBox1.Text.Trim() + "'", "Password");
                            if (arr[0].ToString() == TextBox2.Text)
                            //对比密码是否正确  如果没错将文本信息赋值将Session里面
                            {
                                Session["Adminame"] = TextBox1.Text.Trim();
                                Session["AdminPWD"] = TextBox2.Text.Trim();
                                // 执行完 关闭连接和 释放资源
                                db.OffData();
                                //跳转到主页
                                Response.Redirect("~/admin/userInfo.aspx");
                            }
                            else
                            {
                                db.OffData();
                                Response.Write("<script>alert('密码错误！')</script>");
                            }
                        }
                        else
                        {
                            db.OffData();
                            Response.Write("<script>alert('用户名错误！')</script>");
                        }
                    }
                }
            }
        }
    }
}