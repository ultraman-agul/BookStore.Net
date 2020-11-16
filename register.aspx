<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="DDbook.register" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" href="./css/register.css">
    </asp:Content>
    <%-- <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>--%>
        <asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
        </asp:Content>
        <asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
            <div class="mainContainer">
                <div class="registerBox">
                    <table>
                        <tbody>
                            <tr>
                                <td class="left">用户名</td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="left">真实姓名</td>
                                <td>
                                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="left">手机号码</td>
                                <td>
                                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="left">地址</td>
                                <td>

                                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>

                                </td>
                            </tr>
                            <tr>
                                <td class="left">邮政编码</td>
                                <td>
                                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="left">密码</td>
                                <td>
                                    <asp:TextBox ID="TextBox4" runat="server" ControlToCompare="TextBox4" TextMode="Password"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="left">确认密码</td>
                                <td>
                                    <asp:TextBox ID="TextBox5" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="密码不一致" ControlToValidate="TextBox5" ControlToCompare="TextBox4"></asp:CompareValidator>
                                </td>       
                            </tr>
                        </tbody>
                    </table>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="注册" />
                </div>
            </div>

        </asp:Content>
        <asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
        </asp:Content>
        <%-- <asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
</asp:Content>--%>
