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
    public partial class addBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Adminame"] == null)
            {
                Response.Write("<script>alert('您还没登录，请先登录');window.location='/users/login.aspx';</script>");
            }
            else if (!IsPostBack)
            {
                //填充选择分类的dropdownlist
                DB db = new DB();
                SqlDataReader parent = db.DataReader("select top 9* from BookType");
                this.DropDownList1.DataSource = parent;
                //需要显示的数据表中的内容
                this.DropDownList1.DataTextField = "Name";
                //需要显示的数据表的主键
                this.DropDownList1.DataValueField = "Id";
                this.DropDownList1.DataBind();
                parent.Close();

                SqlDataReader child = db.DataReader("select * from BookType where ParentID =" + DropDownList1.SelectedValue);
                this.DropDownList2.DataSource = child;
                this.DropDownList2.DataTextField = "Name";
                this.DropDownList2.DataValueField = "Id";
                this.DropDownList2.DataBind();
                child.Close();
                //关闭数据库连接
                db.OffData();
            }
        }

        // 点击添加按钮
        protected void Button1_Click(object sender, EventArgs e)
        {
            //判断是否上传了 展示图片
            if (FileUpload1.HasFile)
            {
                //指定上传文件在服务器上的保存路径
                string savePath = Server.MapPath("~/images/img/");
                if (!System.IO.Directory.Exists(savePath))
                {
                    System.IO.Directory.CreateDirectory(savePath);
                }
                //获取上传名字
                string filename1 = FileUpload1.FileName;
                //返回指定图片的后缀
                string fileext1 = System.IO.Path.GetExtension(filename1);
                //获取当前时间
                string filenamaes1 = DateTime.Now.ToString("yyyyMMddHHffss") + fileext1;
                //上传到此项目根目录的images/img/文件夹
                string savePath1 = savePath + "\\" + filenamaes1;

                DB dB = new DB();
                if (!dB.Fault)//判断是否成功连接数据库
                {
                    dB.LoadData("Book");//本地加载数据库
                    if (!dB.QueryValue(TextBox1.Text.Trim(), 1))//查询本地数据库，判断是否存在
                    {
                        DataRow dr = dB.MyDataSet.Tables[0].NewRow();//根据本地数据库中，表的结构，复制一条空行，效果和直接insert一致
                        dr.BeginEdit();//开始编辑行
                        dr["Name"] = TextBox1.Text.Trim(); //书名
                        dr["author"] = TextBox10.Text.Trim(); //作者
                        dr["Description"] = TextBox2.Text.Trim(); // 简介
                        dr["BookTypeID"] = DropDownList2.SelectedValue.Trim(); // 类型
                        dr["Price"] = Convert.ToDouble(TextBox4.Text.Trim()); // 单价
                        if(TextBox5.Text.Trim() == "")
                        {
                            dr["SpecialPrice"] = Convert.ToDouble(TextBox4.Text.Trim());
                        }
                        else
                        {
                            dr["SpecialPrice"] = Convert.ToDouble(TextBox5.Text.Trim()); // 特价
                        }
                        dr["StockNum"] = TextBox6.Text; // 销售数量
                        dr["Pic"] = filenamaes1; // 展示图片地址
                        dr["PublishCompany"] = TextBox7.Text;
                        dr["PublishDate"] = Convert.ToDateTime(Calendar1.SelectedDate.Date);
                        dr["StockNum"] = TextBox6.Text;
                        dr["IsCommend"] = RadioButton1.Checked ? 1 : 0;
                        dr["IsSpecial"] = RadioButton3.Checked ? 1 : 0;
                        dr["Sales"] = 0;
                        dr["WordsCount"] = TextBox8.Text;
                        dB.MyDataSet.Tables[0].Rows.Add(dr); //将编辑的行添加到本地数据库中
                        dr.EndEdit();//结束编辑行
                        dB.UploadData();//上传本地数据库
                        if (dB.Fault)
                        {
                            Label1.Text = "添加失败！！";
                            Label1.Visible = true;
                        }
                        else
                        {
                            FileUpload1.SaveAs(savePath1);//保存展示图
                            Label1.Text = "添加成功！";
                            Label1.Visible = true;

                            TextBox1.Text = TextBox10.Text = TextBox2.Text = TextBox4.Text = TextBox5.Text = TextBox7.Text = TextBox6.Text = TextBox8.Text = "";
                        }
                        dB.OffData();
                        dB.Empty();
                    }
                    else
                    {
                        dB.OffData();
                        dB.Empty();
                        Label1.Visible = true;
                        Label1.Text = "添加失败！！该商品已存在！";
                    }
                }
                else
                {
                    Label1.Visible = true;
                    Label1.Text = "添加失败！！数据库连接失败！";
                }
            }
            else
            {
                Label1.Visible = true;
                Label1.Text = "添加失败！！";
            }
        }

        // 一二级dropdownlist联动
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DB db = new DB();
            SqlDataReader childs = db.DataReader("select * from BookType where ParentID =" + DropDownList1.SelectedValue);
            this.DropDownList2.DataSource = childs;
            this.DropDownList2.DataTextField = "Name";
            this.DropDownList2.DataValueField = "Id";
            this.DropDownList2.DataBind();
            childs.Close();
            //关闭数据库连接
            db.OffData();
        }
    }
}
