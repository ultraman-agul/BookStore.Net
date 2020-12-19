<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="orderManage.aspx.cs" Inherits="DDbook.admin.orderManage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" href="/css/bookManage.css">
</asp:Content>
<%--<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:sqlConnection %>" SelectCommand="SELECT * FROM [Torder]"></asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" AllowPaging="True" OnRowCommand="GridView2_RowCommand"  DataKeyNames="Id">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="订单编号" SortExpression="Id" />
                <asp:BoundField DataField="CustomerID" HeaderText="用户编号" SortExpression="CustomerID" />
                <asp:BoundField DataField="BookID" HeaderText="书籍编号" SortExpression="BookID" />
                <asp:BoundField DataField="PostCode" HeaderText="邮政编码" SortExpression="PostCode" />
                <asp:TemplateField HeaderText="收货地址" SortExpression="Address">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Address") %>' CssClass="mlength"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="200px" />
                </asp:TemplateField>
                <asp:BoundField DataField="Name" HeaderText="收货人" SortExpression="Name" />
                <asp:BoundField DataField="Phone" HeaderText="联系电话" SortExpression="Phone" />
                <asp:TemplateField HeaderText="备注" SortExpression="Message">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="mlength" Text='<%# Bind("Message") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" CssClass="mlength" Text='<%# Bind("Message") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="200px" Wrap="False" />
                </asp:TemplateField>
                <asp:BoundField DataField="BuyDate" HeaderText="下单时间" SortExpression="BuyDate" />
                <asp:BoundField DataField="delivery" HeaderText="快递" SortExpression="delivery" />
                <asp:BoundField DataField="BookNum" HeaderText="数量" SortExpression="BookNum" />
                <asp:CheckBoxField DataField="Flag" HeaderText="付款" SortExpression="Flag" />
                <asp:CheckBoxField DataField="IsSend" HeaderText="发货" SortExpression="IsSend" />
                <asp:TemplateField HeaderText="操作" ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="false" CommandName="Btn_Operation" Text="发货" CommandArgument='<%# Eval("Id") %>'/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div> 
</asp:Content>
<%-- <asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>--%>
<%--<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
</asp:Content>--%>