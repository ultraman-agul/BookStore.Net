<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="addBook.aspx.cs" Inherits="DDbook.addBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <link rel="stylesheet" href="/css/userInfo.css">
    <link rel="stylesheet" href="/css/addBook.css">
</asp:Content>
<%-- <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>--%>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="connav">
        <nav>
            <ul>
                <li>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/admin/userInfo.aspx">信息中心</asp:HyperLink></li>
                <li>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/admin/addBook.aspx">新品上架</asp:HyperLink></li>
                <li>
                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/admin/bookManage.aspx">书籍管理</asp:HyperLink></li>
                <li>
                    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/admin/comment.aspx">评论管理</asp:HyperLink></li>
                <li>
                    <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/admin/orderManage.aspx">订单管理</asp:HyperLink></li>
            </ul>
        </nav>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">    
<div class="mainContainer">
   <div class="leftContain">
        <div class="tite"><h2><i class="iconfont icon-shiwuzhongxin_wangluoxinxizhongxin"></i>&nbsp;信息中心</h2></div>
        <div class="left-item">
            <span>
                <i class="iconfont icon-guanliyuan"></i>
                <asp:HyperLink ID="HyperLink5" NavigateUrl="~/admin/adminShow.aspx" runat="server">
                    管理员信息
                </asp:HyperLink>
            </span>
            <br/>
            <p>
                <asp:HyperLink ID="HyperLink12" runat="server"  NavigateUrl="adminShow.aspx">&nbsp;&nbsp;&nbsp;&nbsp;管理员管理</asp:HyperLink>
            </p>
        </div>
        <div class="left-item">
            <span>
                <i class="iconfont icon-yonghu"></i>
                <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/admin/userInfo.aspx">
                    <i class="iconfont"></i> 用户信息
                </asp:HyperLink>
            </span>
            <br/>
            <p>
                <asp:HyperLink ID="HyperLink8" runat="server"  NavigateUrl="~/admin/userInfo.aspx">&nbsp;&nbsp;&nbsp;&nbsp;用户管理</asp:HyperLink>
            </p>
        </div>
        <div class="left-item">
            <span>
                <i class="iconfont icon-pinglun"></i>
                <asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="~/admin/comment.aspx">
                    <i class="iconfont"></i> 评论管理
                </asp:HyperLink>
            </span>
            <br />
            <p>
                <asp:HyperLink ID="HyperLink13" runat="server" NavigateUrl="~/admin/comment.aspx">&nbsp;&nbsp;&nbsp;&nbsp;用户评论</asp:HyperLink>
            </p>
        </div>
        <div class="left-item">
            <span>
                <i class="iconfont icon-shuji"></i>
                <asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="~/admin/comment.aspx">
                    <i class="iconfont"></i> 书籍管理
                </asp:HyperLink>
            </span>
            <br />
            <p>
                <asp:HyperLink ID="HyperLink14" runat="server" NavigateUrl="~/admin/addBook.aspx" ForeColor="#FF6A00">&nbsp;&nbsp;&nbsp;&nbsp;添加书籍</asp:HyperLink>
            </p>
            <p>
                <asp:HyperLink ID="HyperLink15" runat="server" NavigateUrl="~/admin/bookManage.aspx">&nbsp;&nbsp;&nbsp;&nbsp;书籍信息</asp:HyperLink>
            </p>
        </div>
       <div class="left-item">
            <span>
                <i class="iconfont icon-shuji"></i>
                <asp:HyperLink ID="HyperLink16" runat="server" NavigateUrl="~/admin/orderManage.aspx">
                    <i class="iconfont"></i> 订单管理
                </asp:HyperLink>
            </span>
            <br />
            <p>
                <asp:HyperLink ID="HyperLink17" runat="server" NavigateUrl="~/admin/orderManage.aspx">&nbsp;&nbsp;&nbsp;&nbsp;订单信息</asp:HyperLink>
            </p>
        </div>
    </div>

    <div class="rightcontent">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            <table>
                <tr>
                    <td class="left">书籍名称:</td>
                    <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* 不卖无名之书" ControlToValidate="TextBox1" ForeColor="Red"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td class="left">作  者：</td>
                    <td><asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* 记得写上作者名" ControlToValidate="TextBox10" ForeColor="Red"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td class="left">一级分类：</td>
                    <td><asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        
                    </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="left">二级分类：</td>
                    <td><asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="left">简  介：</td>
                    <td> <asp:TextBox ID="TextBox2" runat="server" MaxLength="1000" TextMode="MultiLine" placeholder="写下简介吧~" Height="50"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="left">出版日期：
                    <td><asp:Calendar ID="Calendar1" runat="server" CssClass="date"></asp:Calendar></td>
                </tr>
                <tr>
                    <td class="left">字  数：</td>
                    <td><asp:TextBox ID="TextBox8" runat="server" CssClass="number"></asp:TextBox><b>万字</b>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="* 小破站卖无字天书恐怕不太好" ControlToValidate="TextBox8" ForeColor="Red"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td class="left">单  价：</td>
                    <td><asp:TextBox ID="TextBox4" runat="server" CssClass="number"></asp:TextBox>
                        <b>￥</b>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="* 整数位最多十位，小数为最多为两位，可以无小数位" ValidationExpression="^(([0-9]|([1-9][0-9]{0,9}))((\.[0-9]{1,2})?))$" ForeColor="Red"></asp:RegularExpressionValidator></td>
                </tr>
                <tr>
                    <td class="left">特  价：</td>
                    <td><asp:TextBox ID="TextBox5" runat="server" CssClass="number"></asp:TextBox>
                        <b>￥ 无特价不填</b>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox5" ErrorMessage="* 整数位最多十位，小数为最多为两位，可以无小数位" ValidationExpression="^(([0-9]|([1-9][0-9]{0,9}))((\.[0-9]{1,2})?))$" ForeColor="Red"></asp:RegularExpressionValidator></td>
                </tr>
                <tr>
                    <td class="left">数  量：</td>
                    <td><asp:TextBox ID="TextBox6" runat="server" CssClass="number"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox6" ForeColor="Red" ErrorMessage="* 正整数谢谢" ValidationExpression="[1-9]\d*"></asp:RegularExpressionValidator></td>
                </tr>
                <tr>
                    <td class="left">出版社：</td>
                    <td><asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" runat="server" ControlToValidate="TextBox7" ErrorMessage="* 必填，可以参考'弘志708出版社'"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td class="left">展示图片：</td>
                    <td><asp:FileUpload ID="FileUpload1" runat="server" /></td>
                </tr>
                <tr>
                    <td class="left">推荐首页：</td>
                    <td class="rdo"> <asp:RadioButton ID="RadioButton1" runat="server" Text="是" GroupName="shouye" />
                        <asp:RadioButton ID="RadioButton2" runat="server" Text="否" GroupName="shouye" /></td>
                </tr>
                <tr>
                    <td class="left">秒杀活动：</td>
                    <td class="rdo"> <asp:RadioButton ID="RadioButton3" runat="server" Text="是" GroupName="miaosha" />
                        <asp:RadioButton ID="RadioButton4" runat="server" Text="否" GroupName="miaosha" /></td>
                </tr>
            </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        
                <asp:Label ID="Label1" runat="server" CssClass="showResult"  Text="添加成功" Visible="False"></asp:Label>
                
                <div class="items btn">
                    <asp:Button ID="Button1" runat="server" CssClass="btnok" Text="确定添加" OnClick="Button1_Click"/>
                </div>
    </div>
</div>
</asp:Content>
<%--
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>--%>
<%--
<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
</asp:Content>--%>
