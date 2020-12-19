using System;
using System.Collections;
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

            //模糊搜索功能，禁用分类排序功能
            if (typeid == "search")
            {
                LinkButton1.Enabled = false;
                LinkButton2.Enabled = false;
                LinkButton3.Enabled = false;
                LinkButton4.Enabled = false;
                ArrayList allId = (ArrayList)Session["result"];
                string pinjie = "";
                foreach(object o in allId)
                {
                    pinjie += o.ToString() + ",";
                }
                pinjie = pinjie.Substring(0, pinjie.Length - 1);
                string pinjieSql = "select * from Book where Id in (" + pinjie + ")";

                DB db = new DB();
                db.LoadExecuteData(pinjieSql);
                PackageDataList.DataSource = db.MyDataSet.Tables[0].DefaultView;
                PackageDataList.DataKeyField = "Id";
                PackageDataList.DataBind();
                db.OffData();
            }
            else 
            {
                if(!IsPostBack)
                {
                    FillPackageData(typeid, " order by Sales");
                }
            }
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

        //根据分类填充数据
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
                Response.Redirect("~/users/bookDetail.aspx?Id=" + e.CommandArgument.ToString());
            }
        }

        protected void forClass(LinkButton lkbt)
        {
            LinkButton1.Attributes.Remove("class");
            LinkButton2.Attributes.Remove("class");
            LinkButton3.Attributes.Remove("class");
            LinkButton4.Attributes.Remove("class");
            lkbt.Attributes.Add("class", "active");
        }

        // 销量排序
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            forClass(LinkButton1);
            string typeids = Request.QueryString["Id"].ToString().Trim();
            if (flagSale)
            {
                flagSale = false;
                FillPackageData(typeids, " order by Sales desc");
                Image1.Attributes.Remove("class");
            }
            else
            {
                flagSale = true;
                FillPackageData(typeids, " order by Sales asc");
                Image1.Attributes.Add("class", "rotate");
            }
        }

        //好评填充
        protected void FillGoodComment(int id, string sortText)
        {
            DB db = new DB();
            string sql = "SELECT b.*, CommentLevel FROM(select * from Book where BookTypeID = " + id + ") as b LEFT JOIN LeaveWord ON b.Id = BookID order by CommentLevel " + sortText;
            if (id == 0)
            {
                sql = "select s.* from(select *, row_number() over(partition by Id order by Id) as group_idx from(SELECT top 1000 Book.*, CommentLevel, ReplyNumber FROM Book LEFT JOIN LeaveWord ON Book.Id = LeaveWord.BookID order by CommentLevel "+sortText+", ReplyNumber "+sortText+") ta) s where s.group_idx = 1 order by CommentLevel "+sortText+", ReplyNumber " + sortText;
            }
            if (id > 0 && id < 10)
            {
                sql = "SELECT b.*, CommentLevel FROM(select * from Book where BookTypeID in (select Id from BookType where ParentID = "+id+")) as b left join LeaveWord on b.Id = BookId order by LeaveWord.CommentLevel " + sortText;
            }
            db.LoadExecuteData(sql);
            PackageDataList.DataSource = db.MyDataSet.Tables[0].DefaultView;
            PackageDataList.DataKeyField = "Id";
            PackageDataList.DataBind();
            db.OffData();
        }

        // 好评
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            forClass(LinkButton2);
            int id = Convert.ToInt32(Request.QueryString["Id"].ToString().Trim());
            if (flagComment)
            {
                flagComment = false;
                FillGoodComment(id, "desc");
                Image2.Attributes.Remove("class");

            }
            else
            {
                flagComment = true;
                FillGoodComment(id, "asc");
                Image2.Attributes.Add("class", "rotate");
            }
        }

        // 最新
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            forClass(LinkButton3);
            string typeids = Request.QueryString["Id"].ToString().Trim();
            if (flagNew)
            {
                flagNew = false;
                FillPackageData(typeids, " order by PublishDate desc");
                Image3.Attributes.Remove("class");
            }
            else
            {
                flagNew = true;
                FillPackageData(typeids, " order by PublishDate asc");
                Image3.Attributes.Add("class", "rotate");
            }
        }

        // 价格
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            forClass(LinkButton4);
            string typeids = Request.QueryString["Id"].ToString().Trim(); ;
            if (flagPrice)
            {
                flagPrice = false;
                FillPackageData(typeids, " order by SpecialPrice asc");
                Image4.Attributes.Remove("class");
            }
            else
            {
                flagPrice = true;
                FillPackageData(typeids, " order by SpecialPrice desc");
                Image4.Attributes.Add("class", "rotate");
            }
        }
    }
}