<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="DDbook.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/slider.css">
    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/index.js"></script>
</asp:Content>
<%--
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content> --%>
<%--
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content> --%>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
<div class="mainContainer">
    <!-- 分类栏 -->
    <div class="column1">
        <ul>
            <li>
            <span><a href="#">小说</a></span>
            <div class="adv">
            <asp:DataList ID="xiaoShuoDataList" runat="server" OnItemCommand="xiaoShuoDataList_ItemCommand" RepeatColumns="3" CssClass="booktypeTb"> 
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" CommandArgument='<%# Eval("Id")%>' CommandName="discribe" runat="server" Text='<%# Eval("Name") %>' CssClass="sas"></asp:LinkButton>
                </ItemTemplate>  
            </asp:DataList>
            </div>
            </li>
            <li>
                <span><a href="#">文艺</a></span>
                <div class="adv">
                    <asp:DataList ID="wenYiDataList" runat="server" OnItemCommand="xiaoShuoDataList_ItemCommand" RepeatColumns="3" CssClass="booktypeTb"> 
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" CommandArgument='<%# Eval("Id")%>' CommandName="discribe" runat="server" Text='<%# Eval("Name") %>' CssClass="sas"></asp:LinkButton>
                </ItemTemplate>  
            </asp:DataList>
                </div>
            </li>
            <li>
                <span><a href="#">历史</a></span>
                <div class="adv">
                    <asp:DataList ID="liShiDataList" runat="server" OnItemCommand="xiaoShuoDataList_ItemCommand" RepeatColumns="3" CssClass="booktypeTb"> 
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" CommandArgument='<%# Eval("Id")%>' CommandName="discribe" runat="server" Text='<%# Eval("Name") %>' CssClass="sas"></asp:LinkButton>
                </ItemTemplate>  
            </asp:DataList>
                </div>
            </li>
            <li>
                <span><a href="#">经济</a></span>
                <div class="adv">
                   <asp:DataList ID="jingJiDataList" runat="server" OnItemCommand="xiaoShuoDataList_ItemCommand" RepeatColumns="3" CssClass="booktypeTb"> 
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" CommandArgument='<%# Eval("Id")%>' CommandName="discribe" runat="server" Text='<%# Eval("Name") %>' CssClass="sas"></asp:LinkButton>
                </ItemTemplate>  
            </asp:DataList>
                </div>
            </li>
            <li>
                <span><a href="#">心理</a></span>
                <div class="adv">
                   <asp:DataList ID="xinLiDataList" runat="server" OnItemCommand="xiaoShuoDataList_ItemCommand" RepeatColumns="3" CssClass="booktypeTb"> 
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" CommandArgument='<%# Eval("Id")%>' CommandName="discribe" runat="server" Text='<%# Eval("Name") %>' CssClass="sas"></asp:LinkButton>
                </ItemTemplate>  
            </asp:DataList>
                </div>
            </li>
            <li>
                <span><a href="#">生活</a></span>
                <div class="adv">
                    <asp:DataList ID="shengHuoDataList" runat="server" OnItemCommand="xiaoShuoDataList_ItemCommand" RepeatColumns="3" CssClass="booktypeTb"> 
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" CommandArgument='<%# Eval("Id")%>' CommandName="discribe" runat="server" Text='<%# Eval("Name") %>' CssClass="sas"></asp:LinkButton>
                </ItemTemplate>  
            </asp:DataList>
                </div>
            </li>
            <li>
                <span><a href="#">童书</a></span>
                <div class="adv">
                   <asp:DataList ID="tongShuDataList" runat="server" OnItemCommand="xiaoShuoDataList_ItemCommand" RepeatColumns="3" CssClass="booktypeTb"> 
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" CommandArgument='<%# Eval("Id")%>' CommandName="discribe" runat="server" Text='<%# Eval("Name") %>' CssClass="sas"></asp:LinkButton>
                </ItemTemplate>  
            </asp:DataList>
                </div>
            </li>
            <li>
                <span><a href="#">科技</a></span>
                <div class="adv">
                    <asp:DataList ID="keJiDataList" runat="server" OnItemCommand="xiaoShuoDataList_ItemCommand" RepeatColumns="3" CssClass="booktypeTb"> 
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" CommandArgument='<%# Eval("Id")%>' CommandName="discribe" runat="server" Text='<%# Eval("Name") %>' CssClass="sas"></asp:LinkButton>
                </ItemTemplate>  
            </asp:DataList>
                </div>
            </li>
            <li>
                <span><a href="#">原创书</a></span>
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
    <!-- 中间部分 -->
    <div class="column2">
        <div id="slider"></div>
        <div class="xianshi">
            <p>限时秒杀</p>
        </div>
        <asp:DataList ID="SpecialPriceDataList1" runat="server" RepeatColumns="4" OnItemCommand="DataList1_ItemCommand" CssClass="specialList" DataKeyField="Id">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Id")%>' CommandName="discribe">
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
    <!-- 右边部分 -->
    <div class="column3">
        <div class="imgdv">
            <a href="#">
                <img src="./images/vip.jpg" alt="">
            </a>
            <a href="#">
                <img src="./images/dzs.jpg" alt="">
            </a>
        </div>
        <div class="biaoti">
            <p>畅销榜</p>
        </div>
        <div class="saleBox">
            <asp:DataList ID="SalesDataList" CssClass="sales" runat="server" OnItemCommand="SalesDataList_ItemCommand">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# Eval("Id") %>'  CommandName="discribe">
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("序号") %>' style="margin-right: 10px;"></asp:Label>
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("Name") %>' CssClass="nam"></asp:Label>
                        <asp:Label ID="Label7" CssClass="pric" runat="server" Text='<%# "￥" + Eval("Price") %>'></asp:Label>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:DataList>
        </div>
        
    </div>
</div>
<script>
    var imgs = ['./images/img1.jpg', './images/img2.jpg', './images/img3.jpg', './images/img4.jpg', './images/img5.jpg'];
    $('#slider').sliderImg(imgs);
</script>

</asp:Content>
<%--
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content> --%>
<%--
<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
</asp:Content> --%>