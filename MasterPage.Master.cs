using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDbook
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //顶栏链接 是否登录状态
            if (Session["USERName"] != null && Session["USERPWD"] != null)
            {
                HyperLink1.Text = Session["USERName"].ToString();
                HyperLink2.Text = "退出";
                HyperLink2.NavigateUrl = "~/login.aspx";
                HyperLink1.NavigateUrl = "#";
            }
            else if (Session["Adminame"] != null && Session["AdminPWD"] != null)
            {
                HyperLink1.Text = Session["Adminame"].ToString();
                HyperLink2.Text = "退出";
                HyperLink2.NavigateUrl = "~/login.aspx";
            }
            else
            {
                HyperLink1.Text = "你好，请登录";
                HyperLink1.NavigateUrl = "~/login.aspx";
                HyperLink2.Text = "注册";
                HyperLink2.NavigateUrl = "~/register.aspx";
            }

            if (Session["USERName"] != null && Session["USERPWD"] != null)
            {   //购物车显示数量
                DB db = new DB();
                int mm = 0;
                SqlDataReader sdr2 = db.DataReader("select BookNum from ShoppingCart where CustomerId=" + Session["USERID"]);
                // 每本书的数量相加
                while (sdr2.Read())
                {
                    mm++;
                }
                CartLabel1.Text = Convert.ToString(mm);
                sdr2.Close();
                db.OffData();
            }

        }
    }
}