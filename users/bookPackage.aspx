<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="bookPackage.aspx.cs" Inherits="DDbook.bookPackage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>叮当-书籍分类</title>
    <link rel="stylesheet" href="/css/bookPackage.css">
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
            <asp:LinkButton ID="LinkButton15" runat="server" PostBackUrl="~/users/bookPackage.aspx?Id=0" CssClass="seemore">查看更多>></asp:LinkButton>
        </div>
        <div class="Pmain">
            <div id="rotation">
                <img src="/images/package/img1.jpg" alt="">
                <img src="/images/package/img2.jpg" alt="">
                <img src="/images/package/img3.jpg" alt="">
                <img src="/images/package/img4.jpg" alt="">
                <div class="arrow_left" num="0"> < </div>
                <div class="arrow_right" num="0"> > </div>
                <div id="dot_area">
                    <ul id="dot_ul">
                        <li class="dot_li" flag="false" num="0" check="true"></li>
                        <li class="dot_li" flag="false" num="1" check="true"></li>
                        <li class="dot_li" flag="false" num="2" check="true"></li>
                        <li class="dot_li" flag="false" num="3" check="true"></li>
                    </ul>
                </div>
            </div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
            <nav>
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">销  量  </asp:LinkButton>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/jiantou.png" />
                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">好  评  </asp:LinkButton>
                <asp:Image ID="Image2" runat="server" ImageUrl="~/images/jiantou.png"/>
                <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">最  新  </asp:LinkButton>
                <asp:Image ID="Image3" runat="server" ImageUrl="~/images/jiantou.png" />
                <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">价  格  </asp:LinkButton>
                <asp:Image ID="Image4" runat="server" ImageUrl="~/images/jiantou.png" />
            </nav>
            <div class="dl">
                <asp:DataList ID="PackageDataList" runat="server" RepeatColumns="3" CssClass="showDataList" OnItemCommand="PackageCommand" RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton5" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="describe">
                            <span class="img-box">
                            <img src="/images/img/<%# Eval("Pic") %>"/>
                        </span> 
                        <div class="info">
                            <h3><asp:Label ID="Label1" CssClass="bookname" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            </h3>
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
                        <p>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                        </p>
                        </div>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:DataList>
            </div>
            </ContentTemplate>
                </asp:UpdatePanel>
        </div>
    </div>
    <script src="/js/jquery-3.5.1.min.js"></script>
    <script src="/js/bookPackage.js"></script>
</asp:Content>
<%-- <asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>--%>
<%--<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
</asp:Content>--%>
