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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sqlConnection %>" SelectCommand="SELECT * FROM [Book]" DeleteCommand="DELETE FROM Book WHERE (Id = @Id)" UpdateCommand="UPDATE Book SET Pic = @Pic, Name = @Name, BookTypeID = @BookTypeID, Price = @Price, SpecialPrice = @SpecialPrice, Description = @Description, StockNum = @StockNum, Sales = @Sales, WordsCount = @WordsCount, PublishCompany = @PublishCompany, PublishDate = @PublishDate, Author = @Author, IsCommend = @IsCommend, IsSpecial = @IsSpecial WHERE (Id = @Id)"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" AllowPaging="True" OnRowDataBound="GridView1_RowDataBound" PageSize="6">
            <Columns>
                <asp:TemplateField HeaderText="编号" InsertVisible="False" SortExpression="Id">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="100px" />
                </asp:TemplateField>
                <asp:ImageField DataImageUrlField="Pic" DataImageUrlFormatString="~/images/img/{0}" HeaderText="展示图">
                <ItemStyle Height="150px" Width="120px" />
                </asp:ImageField>
               
                <asp:TemplateField HeaderText="书名" SortExpression="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" Width="100px" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="100px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="分类" SortExpression="BookTypeID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" Width="40px" runat="server" Text='<%# Bind("BookTypeID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("BookTypeID") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="40px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="单价" SortExpression="Price">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" Width="50px" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="特价" SortExpression="SpecialPrice">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" Width="50px" runat="server" Text='<%# Bind("SpecialPrice") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("SpecialPrice") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="50px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="简介" SortExpression="Description">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="mlength" Text='<%# Bind("Description") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" CssClass="mlength" Text='<%# Bind("Description") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="库存" SortExpression="StockNum">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" Width="50px" runat="server" Text='<%# Bind("StockNum") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("StockNum") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="销量" SortExpression="Sales">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" Width="50px" runat="server" Text='<%# Bind("Sales") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("Sales") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="字数" SortExpression="WordsCount">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox9" Width="50px" runat="server" Text='<%# Bind("WordsCount") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("WordsCount") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="出版社" SortExpression="PublishCompany">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox10" Width="100px" runat="server" Text='<%# Bind("PublishCompany") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("PublishCompany") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="出版日期">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("PublishDate","{0:yyyy-MM-dd}") %>' Width="100px"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label13" runat="server" Text='<%# Bind("PublishDate", "{0:yyyy/MM/dd}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="作者" SortExpression="Author">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox11" runat="server" Width="70px" Text='<%# Bind("Author") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("Author") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="推荐" SortExpression="IsCommend">
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsCommend") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsCommend") %>' Enabled="false" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="秒杀" SortExpression="IsSpecial">
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("IsSpecial") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("IsSpecial") %>' Enabled="false" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="编辑" ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="编辑"></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="80px" />
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False" HeaderText="下架">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" Text="删除" OnClientClick="javascript:return confirm('是否删除？')"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
</div>  
</asp:Content>
<%-- <asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>--%>
<%-- 
<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
</asp:Content>--%>
