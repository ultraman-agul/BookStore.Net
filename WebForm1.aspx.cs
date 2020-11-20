using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDbook
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string date = DateTime.Now.ToLocalTime().ToString();
            string date = DateTime.Now.ToString("yyyy-MM-dd")+ " " + DateTime.Now.ToString("hh:mm:ss");

            Response.Write(date);
        }
    }
}