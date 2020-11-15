using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDbook
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FillData1();
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
            //销售榜
            SalesData();
        }
        // 特价
        protected void FillData1()
        {
            DB db = new DB();
            string sql = "SELECT DISTINCT TOP 8 * FROM [Book] WHERE IsSpecial = '1' ORDER BY [Id]";
            db.LoadExecuteData(sql);
            SpecialPriceDataList1.DataSource = db.MyDataSet.Tables[0].DefaultView;//设置DataList控件的数据源为创建的数据集ds 
            SpecialPriceDataList1.DataBind(); //绑定数据库表中数据
            db.OffData();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "discribe")
            {
                string id = e.CommandArgument.ToString();
                Response.Redirect("./BookDetail.aspx?Id=" + id);
            }
        }
        // 特价结束
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

        protected void SalesData()
        {
            DB db = new DB();
            string sql = "select top 10 序号 = row_number() over(order by Sales desc), Id, Name, Price from Book";
            db.LoadExecuteData(sql);
            SalesDataList.DataSource = db.MyDataSet.Tables[0].DefaultView;
            SalesDataList.DataKeyField = "Id";
            SalesDataList.DataBind();
            db.OffData();
        }

        protected void SalesDataList_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "discribe")
            {
                string id = e.CommandArgument.ToString();
                Response.Redirect("./bookDetail.aspx?Id=" + id);
            }
        }
    }
}