<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="userInfo.aspx.cs" Inherits="DDbook.userInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/css/userInfo.css">
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
    
    <div class="mainContainer">
    <div class="leftContain">
        <div class="tite"><h2><i class="iconfont icon-shiwuzhongxin_wangluoxinxizhongxin"></i>&nbsp;信息中心</h2></div>
        <div class="left-item">
            <span>
                <i class="iconfont icon-guanliyuan"></i>
                <asp:HyperLink ID="HyperLink5" NavigateUrl="~/admin/adminShow.aspx" runat="server">
                    管理员信息
                </asp:HyperLink>
            </span>
            <br/>
            <p>
                <asp:HyperLink ID="HyperLink12" runat="server"  NavigateUrl="adminShow.aspx">&nbsp;&nbsp;&nbsp;&nbsp;管理员管理</asp:HyperLink>
            </p>
        </div>
        <div class="left-item">
            <span>
                <i class="iconfont icon-yonghu"></i>
                <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/admin/userInfo.aspx">
                    <i class="iconfont"></i> 用户信息
                </asp:HyperLink>
            </span>
            <br/>
            <p>
                <asp:HyperLink ID="HyperLink8" runat="server" ForeColor="#FF6A00" NavigateUrl="~/admin/userInfo.aspx">&nbsp;&nbsp;&nbsp;&nbsp;用户管理</asp:HyperLink>
            </p>
        </div>
        <div class="left-item">
            <span>
                <i class="iconfont icon-pinglun"></i>
                <asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="~/admin/comment.aspx">
                    <i class="iconfont"></i> 评论管理
                </asp:HyperLink>
            </span>
            <br />
            <p>
                <asp:HyperLink ID="HyperLink13" runat="server" NavigateUrl="~/admin/comment.aspx">&nbsp;&nbsp;&nbsp;&nbsp;用户评论</asp:HyperLink>
            </p>
        </div>
        <div class="left-item">
            <span>
                <i class="iconfont icon-shuji"></i>
                <asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="~/admin/comment.aspx">
                    <i class="iconfont"></i> 书籍管理
                </asp:HyperLink>
            </span>
            <br />
            <p>
                <asp:HyperLink ID="HyperLink14" runat="server" NavigateUrl="~/admin/addBook.aspx">&nbsp;&nbsp;&nbsp;&nbsp;添加书籍</asp:HyperLink>
            </p>
            <p>
                <asp:HyperLink ID="HyperLink15" runat="server" NavigateUrl="~/admin/bookManage.aspx">&nbsp;&nbsp;&nbsp;&nbsp;书籍信息</asp:HyperLink>
            </p>
        </div>
        <div class="left-item">
            <span>
                <i class="iconfont icon-shuji"></i>
                <asp:HyperLink ID="HyperLink16" runat="server" NavigateUrl="~/admin/orderManage.aspx">
                    <i class="iconfont"></i> 订单管理
                </asp:HyperLink>
            </span>
            <br />
            <p>
                <asp:HyperLink ID="HyperLink17" runat="server" NavigateUrl="~/admin/orderManage.aspx">&nbsp;&nbsp;&nbsp;&nbsp;订单信息</asp:HyperLink>
            </p>
        </div>
    </div>
    <div class="rightContain">
        <h2>用户信息</h2>
         <br />
         <div class="mainGV">
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sqlConnection %>" SelectCommand="SELECT * FROM [Customer]" UpdateCommand="update Customer set Realname=@Realname,LoginName=@LoginName,PostCode=@PostCode,LinkTel=@LinkTel where Id=@Id" DeleteCommand="DELETE FROM Customer WHERE (Id = @Id)"></asp:SqlDataSource>
             <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" PageSize="5" Width="900px" OnRowDataBound="GridView1_RowDataBound">
                 <Columns>
                     <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" >
                     <ItemStyle Height="50px" Width="80px" />
                     </asp:BoundField>
                     <asp:BoundField DataField="Realname" HeaderText="真实姓名" SortExpression="Realname" >
                     <ItemStyle Width="80px" />
                     </asp:BoundField>
                     <asp:BoundField DataField="LoginName" HeaderText="登录名" SortExpression="LoginName" >
                     <ItemStyle Width="80px" />
                     </asp:BoundField>
                     <asp:BoundField DataField="PostCode" HeaderText="邮编" SortExpression="PostCode" >
                     <ItemStyle Width="80px" />
                     </asp:BoundField>
                     <asp:BoundField DataField="LinkTel" HeaderText="联系电话" SortExpression="LinkTel" >
                     <ItemStyle Width="100px" />
                     </asp:BoundField>
                     <asp:CommandField ShowEditButton="True" >
                     <ItemStyle Width="60px" />
                     </asp:CommandField>
                     <asp:TemplateField ShowHeader="False">
                         <ItemTemplate>
                             <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="删除" OnClientClick="return confirm('确定删除吗？')"></asp:LinkButton>
                         </ItemTemplate>
                         <ItemStyle Width="30px" />
                     </asp:TemplateField>
                 </Columns>
             </asp:GridView>
         </div>
    </div>    
      </div>
</asp:Content>
<%-- <asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>--%>
<%--<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
</asp:Content>--%>
