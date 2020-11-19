using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDbook
{
    public partial class bookPackage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string typeid = Request.QueryString["Id"].ToString().Trim();
            //分类开始
            FillXiaoShuoData();
            FillWenYiData();
            FillLiShiData();
            FillJingJiData();
            FillXinLiData();
            FillShengHuoData();
            FillTongShuData();
            FillKeJiData();
            FillYuanBanData();
            //分类结束
            FillPackageData(typeid, " order by Sales");
        }
        #region 分类列表 开始
        protected void FillXiaoShuoData()
        {
            DB db = new DB();
            string sql = "SELECT * FROM [BookType] WHERE ParentId = '1' ORDER BY [Id]";
            db.LoadExecuteData(sql);
            xiaoShuoDataList.DataSource = db.MyDataSet.Tables[0].DefaultView;
            xiaoShuoDataList.DataBind();
            db.OffData();
        }

        protected void FillWenYiData()
        {
            DB db = new DB();
            string sql = "SELECT * FROM [BookType] WHERE ParentId = '2' ORDER BY [Id]";
            db.LoadExecuteData(sql);
            wenYiDataList.DataSource = db.MyDataSet.Tables[0].DefaultView;
            wenYiDataList.DataBind();
            db.OffData();
        }

        protected void FillLiShiData()
        {
            DB db = new DB();
            string sql = "SELECT * FROM [BookType] WHERE ParentId = '3' ORDER BY [Id]";
            db.LoadExecuteData(sql);
            liShiDataList.DataSource = db.MyDataSet.Tables[0].DefaultView;
            liShiDataList.DataBind();
            db.OffData();
        }

        protected void FillJingJiData()
        {
            DB db = new DB();
            string sql = "SELECT * FROM [BookType] WHERE ParentId = '4' ORDER BY [Id]";
            db.LoadExecuteData(sql);
            jingJiDataList.DataSource = db.MyDataSet.Tables[0].DefaultView;
            jingJiDataList.DataBind();
            db.OffData();
        }

        protected void FillXinLiData()
        {
            DB db = new DB();
            string sql = "SELECT * FROM [BookType] WHERE ParentId = '5' ORDER BY [Id]";
            db.LoadExecuteData(sql);
            xinLiDataList.DataSource = db.MyDataSet.Tables[0].DefaultView;
            xinLiDataList.DataBind();
            db.OffData();
        }

        protected void FillShengHuoData()
        {
            DB db = new DB();
            string sql = "SELECT * FROM [BookType] WHERE ParentId = '6' ORDER BY [Id]";
            db.LoadExecuteData(sql);
            shengHuoDataList.DataSource = db.MyDataSet.Tables[0].DefaultView;
            shengHuoDataList.DataBind();
            db.OffData();
        }

        protected void FillTongShuData()
        {
            DB db = new DB();
            string sql = "SELECT * FROM [BookType] WHERE ParentId = '7' ORDER BY [Id]";
            db.LoadExecuteData(sql);
            tongShuDataList.DataSource = db.MyDataSet.Tables[0].DefaultView;
            tongShuDataList.DataBind();
            db.OffData();
        }

        protected void FillKeJiData()
        {
            DB db = new DB();
            string sql = "SELECT * FROM [BookType] WHERE ParentId = '8' ORDER BY [Id]";
            db.LoadExecuteData(sql);
            keJiDataList.DataSource = db.MyDataSet.Tables[0].DefaultView;
            keJiDataList.DataBind();
            db.OffData();
        }

        protected void FillYuanBanData()
        {
            DB db = new DB();
            string sql = "SELECT * FROM [BookType] WHERE ParentId = '9' ORDER BY [Id]";
            db.LoadExecuteData(sql);
            yuanChuangDataList.DataSource = db.MyDataSet.Tables[0].DefaultView;
            yuanChuangDataList.DataBind();
            db.OffData();
        }

        protected void xiaoShuoDataList_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "discribe")
            {
                string id = e.CommandArgument.ToString();
                Response.Redirect("./BookPackage.aspx?Id=" + id);
            }
        }
        #endregion 分类结束


        protected static bool flagSale = true;
        protected static bool flagComment = true;
        protected static bool flagNew = true;
        protected static bool flagPrice = true;


        protected void FillPackageData(string typeid,string sortMethood)
        {
            DB db = new DB();
            string sql = "select * from Book where BookTypeID =" + typeid.ToString().Trim() + sortMethood;
            int id = int.Parse(typeid);
            if(id == 0)
            {
                sql = "select * from Book" + sortMethood;
            }
            if(id > 0 && id < 10)
            {
                sql = "select * from Book where BookTypeID in (select Id from BookType where ParentID = " + id + ")" + sortMethood;
            }
            db.LoadExecuteData(sql);
            PackageDataList.DataSource = db.MyDataSet.Tables[0].DefaultView;
            PackageDataList.DataKeyField = "Id";
            PackageDataList.DataBind();
            db.OffData();
        }
        protected void PackageCommand(object source, DataListCommandEventArgs e)
        {
            if(e.CommandName=="describe")
            {
                Response.Redirect("~/bookDetail.aspx?Id=" + e.CommandArgument.ToString());
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if(flagSale)
            {
                flagSale = false;
                string typeids = Request.QueryString["Id"].ToString().Trim();
                FillPackageData(typeids, " order by Sales asc");
            }
            else
            {
                flagSale = true;
                string typeids = Request.QueryString["Id"].ToString().Trim();
                FillPackageData(typeids, " order by Sales desc");
            }
        }

        // 好评
        protected void LinkButton2_Click(object sender, EventArgs e)
        {

        }
        // 最新
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            if (flagSale)
            {
                flagSale = false;
                string typeids = Request.QueryString["Id"].ToString().Trim();
                FillPackageData(typeids, " order by PublishDate asc");
            }
            else
            {
                flagSale = true;
                string typeids = Request.QueryString["Id"].ToString().Trim();
                FillPackageData(typeids, " order by PublishDate desc");
            }
        }
        // 价格
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            if (flagSale)
            {
                flagSale = false;
                string typeids = Request.QueryString["Id"].ToString().Trim();
                FillPackageData(typeids, " order by SpecialPrice asc");
            }
            else
            {
                flagSale = true;
                string typeids = Request.QueryString["Id"].ToString().Trim();
                FillPackageData(typeids, " order by SpecialPrice desc");
            }
        }
    }
}