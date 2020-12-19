<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="bookManage.aspx.cs" Inherits="DDbook.bookManage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/css/bookManage.css">
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
    <div class="ManageCon">
    <asp:GridView ID="GridView1" runat="server" DataKeyNames="Id" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit"  OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" PageSize="8" AutoGenerateColumns="False">
        <Columns>
            <asp:ImageField DataImageUrlField="Pic" DataImageUrlFormatString="~/images/img/{0}" HeaderText="展示图">
                <ItemStyle Height="150px" Width="120px" />
            </asp:ImageField>
            <asp:BoundField DataField="btname" HeaderText="分类" SortExpression="btname">
            <ItemStyle Width="90px" />
            </asp:BoundField>
            <asp:BoundField DataField="Name" HeaderText="书籍名称" SortExpression="Name">
            <ItemStyle Width="100px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="简介" SortExpression="Description">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label CssClass="mlength" ID="Label1" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Height="150px" Width="200px" />
            </asp:TemplateField>
            <asp:BoundField DataField="Author" HeaderText="作者" SortExpression="Author">
            <ItemStyle Height="80px" />
            </asp:BoundField>
            <asp:BoundField DataField="PublishCompany" HeaderText="出版社" SortExpression="PublishCompany">
            <ItemStyle Width="90px" />
            </asp:BoundField>
            <asp:BoundField DataField="PublishDate" HeaderText="出版日期" SortExpression="PublishDate">
            <ItemStyle Width="80px" />
            </asp:BoundField>
            <asp:BoundField DataField="WordsCount" HeaderText="字数" SortExpression="WordsCount">
            <ItemStyle Width="40px" />
            </asp:BoundField>
            <asp:BoundField DataField="Price" HeaderText="单价" SortExpression="Price">
            <ItemStyle Width="60px" />
            </asp:BoundField>
            <asp:BoundField DataField="SpecialPrice" HeaderText="特价" SortExpression="SpecialPrice">
            <ItemStyle Width="60px" />
            </asp:BoundField>
            <asp:BoundField DataField="StockNum" HeaderText="库存" SortExpression="StockNum">
            <ItemStyle Width="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="Sales" HeaderText="销量" SortExpression="Sales">
            <ItemStyle Width="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="IsCommend" HeaderText="推荐" SortExpression="IsCommend" />
            <asp:BoundField DataField="IsSpecial" HeaderText="特价" SortExpression="IsSpecial" />
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LB1" runat="server" CausesValidation="False" CommandName="Edit" Text="编辑"></asp:LinkButton>
                    &nbsp;
                    <asp:LinkButton ID="LB2" runat="server" CausesValidation="False" CommandName="Delete" Text="删除" OnClientClick="javascript:return confirm('是否删除？')"></asp:LinkButton>    
                    <ItemStyle Width="100px" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle Font-Size="Medium" />
    </asp:GridView>
</div>  
</asp:Content>
<%-- <asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>--%>
<%-- 
<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
</asp:Content>--%>
