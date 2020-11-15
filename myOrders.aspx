<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="myOrders.aspx.cs" Inherits="DDbook.myOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="./css/myOrders.css">
</asp:Content>
<%-- 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>--%>
<%-- 
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>--%>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <div class="Mcontainer">
        <div class="search">
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">查询</asp:LinkButton>
        </div>
        <asp:DataList ID="DataList2" runat="server">
            <ItemTemplate>
                <div class="demo">
                    <div class="title">
                        <h3><asp:Label ID="Label1" runat="server"  Text='<%# Eval("Id") %>'></asp:Label></h3>
                        <asp:Label ID="Label2" runat="server"  Text='<%# Eval("BuyDate") %>'></asp:Label>
                    </div>
                    <asp:DataList ID="DataList1" runat="server" DataSource='<%# BookDetail(Eval("Id").ToString()) %>'>
                        <ItemTemplate>
                            <div class="toplist">
                                <div>
                                    <img src='./images/img/<%# Eval("Pic")%>' alt="Alternate Text" />
                                </div>
                                <div class="text">
                                    <div>
                                        <h3>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                        </h3>
                                    </div>
                                    <div>
                                        <p>
                                            <asp:Label ID="Label4" runat="server" Text='<%# "￥" + Eval("Price") %>'></asp:Label>
                                        </p>
                                        <p>
                                            <asp:Label ID="Label5" runat="server"  Text='<%# "数量：" + Eval("BookNum") %>'></asp:Label>
                                        </p>
                                    </div>          
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>

                    <div class="bottom">
                        <p>
                            <asp:Label ID="Label6" runat="server"  Text='<%# Eval("Name") %>'></asp:Label>
                        </p>
                        <p>
                            <asp:Label ID="Label7" runat="server"  Text='<%# Eval("Phone") %>'></asp:Label>
                        </p>
                        <p>
                            <asp:Label ID="Label8" runat="server"  Text='<%# Eval("Address") %>'></asp:Label>
                        </p>
                        <p>
                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("PostCode") %>'>></asp:Label>
                        </p>
                        <p>
                            <asp:Label ID="Label10" runat="server"  Text='<%# Eval("delivery") %>'></asp:Label>
                        </p>
                        <p>
                            <asp:Label ID="Label11" runat="server"  Text='<%# Eval("Message") %>'></asp:Label>
                        </p>
                        <p>
                            <asp:Label ID="Label12" runat="server" Text='<%# "总金额：" + GetPrice(Eval("Id").ToString()) %>'></asp:Label>
                        </p>
                    </div>

                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
<%-- 
<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
</asp:Content>--%>
