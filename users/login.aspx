<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="DDbook.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>叮当-用户登录</title>
        <link rel="stylesheet" href="/css/login.css">
    </asp:Content>
    <%-- <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>--%>
        <asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
        </asp:Content>
        <asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
            <div class="login_main">
                <asp:SiteMapPath ID="SiteMapPath1" runat="server" Font-Size="Medium"></asp:SiteMapPath>
                <br>
                <div id="slider">
                    <img src="/images/img1/img1.jpg" alt=" " class="active">
                    <img src="/images/img1/img2.jpg" alt=" ">
                    <img src="/images/img1/img3.jpg" alt=" ">
                </div>
                
                <div class="login_box">
                    <ul>
                        <li>
                            <p>密码登陆</p>
                        </li>
                        <li>
                            <asp:TextBox ID="TextBox1" runat="server" ToolTip="账号" TabIndex="1" MaxLength="10" CssClass="tbx" placeholder="账号"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="非空" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                        </li>
                        <li>
                            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" TabIndex="2" ToolTip="密码" MaxLength="20" CssClass="tbx" placeholder="密码">密码</asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="非空" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                        </li>
                        <li>
                            <asp:Label ID="Label1" runat="server" Text="验证码" style="font-size:14px;"></asp:Label>
                            <asp:Image ID="ibtn_yzm"  src="./ImageCode.aspx"  runat="server" Width="70px" Height="40px" />
                            <a href="#" class="huan">换一张</a>
                            <asp:TextBox ID="tbx_yzm" runat="server" Width="70px" TabIndex="3" ToolTip="验证码" MaxLength="4"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="非空" ControlToValidate="tbx_yzm"></asp:RequiredFieldValidator>
                        </li>
                        <li>

                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True" Value="普通会员"></asp:ListItem>
                                <asp:ListItem Value="管理员"></asp:ListItem>
                            </asp:RadioButtonList>

                        </li>
                        <li>
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" CssClass="btn" Text="登录" TabIndex="4" />
                        </li>
                        <li><a class="zhuce" href="/users/register.aspx">立即注册</a></li>
                    </ul>
                </div>
            </div>
        <script src="/js/jquery-3.5.1.min.js"></script>
        <script src="/js/login.js"></script>
        </asp:Content>
        <asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
        </asp:Content>
        <%-- <asp:Content ID="Content6 " ContentPlaceHolderID="ContentPlaceHolder5 " runat="server ">
</asp:Content>--%>