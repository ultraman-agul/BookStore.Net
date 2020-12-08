<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="myOrders.aspx.cs" Inherits="DDbook.myOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/css/myOrders.css">
</asp:Content>
<%-- 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>--%>
<%-- 
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>--%>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <div class="Mcontainer">
        <!-- 头部 -->
        <div class="head">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/index.aspx">
                <div class="logo">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/logo.png"/>
                    <span>购物车</span>
                </div>
            </asp:HyperLink>
            <div class="jindu">
                <span>我的购物车</span>
                <span>填写订单</span>
                <span class="current">我的订单</span>
            </div>
        </div>
        <!-- 头部结束 -->
        <div class="search">
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" class="iconfont icon-sousuo">查询</asp:LinkButton>
        </div>
        <div class="DLdv">

        
        <asp:DataList ID="DataList2" runat="server" CssClass="orderDL">
            <ItemTemplate>
                <div class="demo">
                    <div class="title">
                        <h2>订单号：<asp:Label ID="Label1" runat="server"  Text='<%# Eval("Id") %>'></asp:Label></h2>
                        <asp:Label ID="Label2" runat="server"  Text='<%# Eval("BuyDate") %>'></asp:Label>
                    </div>
                    <asp:DataList ID="DataList1" runat="server" DataSource='<%# BookDetail(Eval("Id").ToString()) %>' CssClass="innerDL" OnItemCommand="DataList2_ItemCommand">
                        <ItemTemplate>
                            <div class="toplist">
                                <div>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="redirect" CommandArgument='<%# Eval("Id") %>'>
                                    <img src='/images/img/<%# Eval("Pic")%>' alt="Alternate Text" />
                                     </asp:LinkButton>
                                </div>
                                <div class="text">
                                    <div>
                                        <h3>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                        </h3>
                                    </div>
                                    <div>
                                        <p>
                                        <asp:Label ID="Label4" runat="server" Text='<%# "￥" + Eval("SpecialPrice") %>'></asp:Label>
                                       </p>
                                      
                                    </div>  
                                    <div>
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
                            <span class="left">收货人：</span>
                            <asp:Label ID="Label6" runat="server"  Text='<%# Eval("Name") %>'></asp:Label>
                        </p>
                        <p>
                            <span class="left">收货手机号：</span>
                            <asp:Label ID="Label7" runat="server"  Text='<%# Eval("Phone") %>'></asp:Label>
                        </p>
                        <p>
                            <span class="left">收货地址：</span>
                            <asp:Label ID="Label8" runat="server"  Text='<%# Eval("Address") %>'></asp:Label>
                        </p>
                        <p>
                            <span class="left">邮政编码：</span>
                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("PostCode") %>'>></asp:Label>
                        </p>
                        <p>
                            <span class="left">配送方式：</span>
                            <asp:Label ID="Label10" runat="server"  Text='<%# Eval("delivery") %>'></asp:Label>
                        </p>
                        <p>
                            <span class="left">备注：</span>
                            <asp:Label ID="Label11" runat="server"  Text='<%# Eval("Message") %>'></asp:Label>
                        </p>
                        <p>
                            <span class="left">总金额：</span>
                            <asp:Label ID="Label12" runat="server" CssClass="totalMoney" Text='<%#  "￥" + GetPrice(Eval("Id").ToString()) %>'></asp:Label>
                        </p>
                    </div>

                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
    </div>
</asp:Content>
<%-- <asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>--%>
<%-- 
<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
</asp:Content>--%>
