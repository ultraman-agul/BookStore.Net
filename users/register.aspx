<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="DDbook.register" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" href="/css/register.css">
    </asp:Content>
    <%-- <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>--%>
        <asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
        </asp:Content>
        <asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
            <div class="mainContainer">
                <asp:SiteMapPath ID="SiteMapPath1" runat="server" Font-Size="Medium"></asp:SiteMapPath>
                <h1>用户注册</h1>
                <div class="leftImg">
                    <img src="/images/register.jpg" alt="">
                </div>
                <div class="registerBox">
                    <table>
                        <tbody>
                            <tr>
                                <td class="left">用户名</td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server" TabIndex="1"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="left">真实姓名</td>
                                <td>
                                    <asp:TextBox ID="TextBox2" runat="server" TabIndex="2"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="left">手机号码</td>
                                <td>
                                    <asp:TextBox ID="TextBox3" runat="server" TabIndex="3"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="left">邮政编码</td>
                                <td>
                                    <asp:TextBox ID="TextBox7" runat="server" TabIndex="5"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="left">密码</td>
                                <td>
                                    <asp:TextBox ID="TextBox4" runat="server" ControlToCompare="TextBox4" TextMode="Password" TabIndex="6"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="left">确认密码</td>
                                <td>
                                    <asp:TextBox ID="TextBox5" runat="server" TextMode="Password" TabIndex="7"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="密码不一致" ControlToValidate="TextBox5" ControlToCompare="TextBox4"></asp:CompareValidator>
                                </td>       
                            </tr>
                            <tr> 
                                <td  class="left"> 
                            <asp:Image ID="ibtn_yzm"  src="./ImageCode.aspx"  runat="server" Width="70px" Height="40px" />

                             <script>
                                function changeCode() 
                                {
                                    location.reload();
                                }
                              </script></td>
                                <td>
                            <a href="javascript:changeCode()"style="text-decoration: underline; font-size:16px;">换一张</a>
                                </td>
                        </tr>
                        <tr>
                            <td class="left"><asp:Label ID="Label1" runat="server" Text="验证码"></asp:Label></td>
                            <td> <asp:TextBox ID="tbx_yzm" runat="server" TabIndex="8"></asp:TextBox></td>
                        </tr>
                        <tr><td colspan="2"><asp:Button ID="Button1" runat="server" OnClick="Button1_Click" CssClass="registerbtn" Text="注册" TabIndex="9" /></td></tr>
                        </tbody>
                    </table>    
                </div>
            </div>

        </asp:Content>
        <asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
        </asp:Content>
        <%-- <asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
</asp:Content>--%>
