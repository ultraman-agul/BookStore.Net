<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="DDbook.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" href="./css/login.css">
    </asp:Content>
    <%-- <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>--%>
        <asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
        </asp:Content>
        <asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
            <div class="login_main">
                <asp:SiteMapPath ID="SiteMapPath1" runat="server"></asp:SiteMapPath>
                <img src="./images/wuyifan.jpg " alt=" ">
                <div class="login_box">
                    <ul>
                        <li>
                            <p>密码登陆</p>
                        </li>
                        <li>
                            <asp:TextBox ID="TextBox1" runat="server">用户名</asp:TextBox>
                        </li>
                        <li>
                            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password">密码</asp:TextBox>
                        </li>
                        <li>

                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True" Value="普通会员"></asp:ListItem>
                                <asp:ListItem>管理员</asp:ListItem>
                            </asp:RadioButtonList>

                        </li>
                        <li>
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="登录" />
                        </li>
                        <li><a href="./register.aspx">立即注册</a></li>
                    </ul>
                </div>
            </div>
        </asp:Content>
        <asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
        </asp:Content>
        <%-- <asp:Content ID="Content6 " ContentPlaceHolderID="ContentPlaceHolder5 " runat="server ">
</asp:Content>--%>