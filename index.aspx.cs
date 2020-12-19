using System;
using System.Collections.Generic;
using System.Drawing;
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
            FillData1();//秒杀
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
           
            SalesData(); //销售榜
            if(!IsPostBack)
            {
                CommendData(0);//推荐分类
            }
            forClass(LinkButton4);
            rightCommendData();// 右侧推荐
            newBookData();//新书推荐
            newBookRankData();//新书排行榜
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
            if (e.CommandName == "describe")
            {
                string id = e.CommandArgument.ToString();
                Response.Redirect("~/users/BookDetail.aspx?Id=" + id);
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
                Response.Redirect("/users/bookPackage.aspx?Id=" + id);
            }
        }
        #endregion 分类结束

        // 畅销榜
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


        // 推荐
        protected void CommendData(int typeId)
        {
            DB db = new DB();
            
            string sql = "";
            if(typeId == 0)
            {
                sql = "select top 10 * from Book where IsCommend = 1 order by PublishDate desc";
            }
            else
            {
                sql = "select top 10 * from Book where BookTypeID in (select Id from BookType where ParentID ="+typeId+")";
            }
            db.LoadExecuteData(sql);
            CommendDataList.DataSource = db.MyDataSet.Tables[0].DefaultView;
            CommendDataList.DataKeyField = "Id";
            CommendDataList.DataBind();
            db.OffData();
        }

        // 改变按钮样式
        protected void forClass(LinkButton lkbt)
        {
            LinkButton4.Attributes.Remove("class");
            LinkButton5.Attributes.Remove("class");
            LinkButton6.Attributes.Remove("class");
            LinkButton7.Attributes.Remove("class");
            LinkButton8.Attributes.Remove("class");
            LinkButton9.Attributes.Remove("class");
            LinkButton10.Attributes.Remove("class");
            lkbt.Attributes.Add("class", "active");

        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            CommendData(0);
            forClass(LinkButton4);
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            CommendData(1);
            forClass(LinkButton5);
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            CommendData(3);
            forClass(LinkButton7);
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            CommendData(4);
            forClass(LinkButton8);
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            CommendData(5);
            forClass(LinkButton9);
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            CommendData(8);
            forClass(LinkButton10);
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            CommendData(2);
            forClass(LinkButton6);
        }

        //右侧推荐
        protected void rightCommendData()
        {
            DB db = new DB();
            string sql = "select top 3 s.* from( select *, row_number() over(partition by Id order by Id) as group_idx from(SELECT distinct top 10 b.*, CommentLevel, ReplyNumber FROM(select * from Book) as b LEFT JOIN LeaveWord ON b.Id = BookID order by CommentLevel desc, ReplyNumber desc) ta) s where s.group_idx = 1 order by CommentLevel desc, ReplyNumber desc";
            db.LoadExecuteData(sql);
            rightCommendDataList.DataSource = db.MyDataSet.Tables[0].DefaultView;
            rightCommendDataList.DataKeyField = "Id";
            rightCommendDataList.DataBind();
            db.OffData();
        }

        // 新书推荐
        protected void newBookData()
        {
            DB db = new DB();
            string sql = "select top 10 * from Book order by PublishDate desc";
            db.LoadExecuteData(sql);
            newBookDataList.DataSource = db.MyDataSet.Tables[0].DefaultView;
            newBookDataList.DataKeyField = "Id";
            newBookDataList.DataBind();
            db.OffData();
        }

        // 新书榜
        protected void newBookRankData()
        {
            DB db = new DB();
            string sql = "select top 10 序号 = row_number() over(order by PublishDate desc), Id, Name, Price from Book";
            db.LoadExecuteData(sql);
            newBookRankDataList.DataSource = db.MyDataSet.Tables[0].DefaultView;
            newBookRankDataList.DataKeyField = "Id";
            newBookRankDataList.DataBind();
            db.OffData();
        }
    }
}