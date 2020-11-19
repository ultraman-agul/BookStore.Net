<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="bookPackage.aspx.cs" Inherits="DDbook.bookPackage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="./css/bookPackage.css">
</asp:Content>
<%--<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>--%>
<%--<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>--%>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <div class="PContainer">
            <!-- 分类栏 -->
        <div class="column1">
            <ul>
                <li>
                <span><a href="bookPackage.aspx?Id=1">小说</a></span>
                <div class="adv">
                <asp:DataList ID="xiaoShuoDataList" runat="server" OnItemCommand="xiaoShuoDataList_ItemCommand" RepeatColumns="3" CssClass="booktypeTb"> 
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" CommandArgument='<%# Eval("Id")%>' CommandName="discribe" runat="server" Text='<%# Eval("Name") %>' CssClass="sas"></asp:LinkButton>
                    </ItemTemplate>  
                </asp:DataList>
                </div>
                </li>
                <li>
                    <span><a href="bookPackage.aspx?Id=2">文艺</a></span>
                    <div class="adv">
                        <asp:DataList ID="wenYiDataList" runat="server" OnItemCommand="xiaoShuoDataList_ItemCommand" RepeatColumns="3" CssClass="booktypeTb"> 
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" CommandArgument='<%# Eval("Id")%>' CommandName="discribe" runat="server" Text='<%# Eval("Name") %>' CssClass="sas"></asp:LinkButton>
                    </ItemTemplate>  
                </asp:DataList>
                    </div>
                </li>
                <li>
                    <span><a href="bookPackage.aspx?Id=3">历史</a></span>
                    <div class="adv">
                        <asp:DataList ID="liShiDataList" runat="server" OnItemCommand="xiaoShuoDataList_ItemCommand" RepeatColumns="3" CssClass="booktypeTb"> 
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" CommandArgument='<%# Eval("Id")%>' CommandName="discribe" runat="server" Text='<%# Eval("Name") %>' CssClass="sas"></asp:LinkButton>
                    </ItemTemplate>  
                </asp:DataList>
                    </div>
                </li>
                <li>
                    <span><a href="bookPackage.aspx?Id=4">经济</a></span>
                    <div class="adv">
                    <asp:DataList ID="jingJiDataList" runat="server" OnItemCommand="xiaoShuoDataList_ItemCommand" RepeatColumns="3" CssClass="booktypeTb"> 
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" CommandArgument='<%# Eval("Id")%>' CommandName="discribe" runat="server" Text='<%# Eval("Name") %>' CssClass="sas"></asp:LinkButton>
                    </ItemTemplate>  
                </asp:DataList>
                    </div>
                </li>
                <li>
                    <span><a href="bookPackage.aspx?Id=5">心理</a></span>
                    <div class="adv">
                    <asp:DataList ID="xinLiDataList" runat="server" OnItemCommand="xiaoShuoDataList_ItemCommand" RepeatColumns="3" CssClass="booktypeTb"> 
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" CommandArgument='<%# Eval("Id")%>' CommandName="discribe" runat="server" Text='<%# Eval("Name") %>' CssClass="sas"></asp:LinkButton>
                    </ItemTemplate>  
                </asp:DataList>
                    </div>
                </li>
                <li>
                    <span><a href="bookPackage.aspx?Id=6">生活</a></span>
                    <div class="adv">
                        <asp:DataList ID="shengHuoDataList" runat="server" OnItemCommand="xiaoShuoDataList_ItemCommand" RepeatColumns="3" CssClass="booktypeTb"> 
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" CommandArgument='<%# Eval("Id")%>' CommandName="discribe" runat="server" Text='<%# Eval("Name") %>' CssClass="sas"></asp:LinkButton>
                    </ItemTemplate>  
                </asp:DataList>
                    </div>
                </li>
                <li>
                    <span><a href="bookPackage.aspx?Id=7">童书</a></span>
                    <div class="adv">
                    <asp:DataList ID="tongShuDataList" runat="server" OnItemCommand="xiaoShuoDataList_ItemCommand" RepeatColumns="3" CssClass="booktypeTb"> 
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" CommandArgument='<%# Eval("Id")%>' CommandName="discribe" runat="server" Text='<%# Eval("Name") %>' CssClass="sas"></asp:LinkButton>
                    </ItemTemplate>  
                </asp:DataList>
                    </div>
                </li>
                <li>
                    <span><a href="bookPackage.aspx?Id=8">科技</a></span>
                    <div class="adv">
                        <asp:DataList ID="keJiDataList" runat="server" OnItemCommand="xiaoShuoDataList_ItemCommand" RepeatColumns="3" CssClass="booktypeTb"> 
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" CommandArgument='<%# Eval("Id")%>' CommandName="discribe" runat="server" Text='<%# Eval("Name") %>' CssClass="sas"></asp:LinkButton>
                    </ItemTemplate>  
                </asp:DataList>
                    </div>
                </li>
                <li>
                    <span><a href="bookPackage.aspx?Id=9">原创书</a></span>
                    <div class="adv">
                        <asp:DataList ID="yuanChuangDataList" runat="server" OnItemCommand="xiaoShuoDataList_ItemCommand" RepeatColumns="3" CssClass="booktypeTb"> 
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" CommandArgument='<%# Eval("Id")%>' CommandName="discribe" runat="server" Text='<%# Eval("Name") %>' CssClass="sas"></asp:LinkButton>
                    </ItemTemplate>  
                </asp:DataList>
                    </div>
                </li>
            </ul>
        </div>
        <div class="Pmain">
            <nav>
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">销  量</asp:LinkButton>
                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">好  评</asp:LinkButton>
                <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">最  新</asp:LinkButton>
                <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">价  格</asp:LinkButton>
            </nav>
            <div class="dl">
                <asp:DataList ID="PackageDataList" runat="server" RepeatColumns="3" CssClass="showDataList" OnItemCommand="PackageCommand">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton5" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="describe">
                            <span class="img-box">
                            <img src="./images/img/<%# Eval("Pic") %>"/>
                        </span> 
                        <div class="info">
                            <asp:Label ID="Label1" CssClass="bookname" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        <p>
                            <asp:Label ID="Label4" CssClass="author" runat="server" Text='<%# Eval("Author") %>'></asp:Label>
                        </p>
                        <p>
                            <span class="specialPrice">
                                ￥
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("SpecialPrice") %>'></asp:Label>
                            </span>
                            <span class="originPrice">
                                ￥
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                            </span>
                        </p>
                        </div>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
<%--<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
</asp:Content>--%>
