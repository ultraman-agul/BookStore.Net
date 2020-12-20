<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="comment.aspx.cs" Inherits="DDbook.comment" %>
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
                <asp:HyperLink ID="HyperLink8" runat="server"  NavigateUrl="~/admin/userInfo.aspx">&nbsp;&nbsp;&nbsp;&nbsp;用户管理</asp:HyperLink>
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
                <asp:HyperLink ID="HyperLink13" runat="server" NavigateUrl="~/admin/comment.aspx" ForeColor="#FF6A00">&nbsp;&nbsp;&nbsp;&nbsp;用户评论</asp:HyperLink>
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
        <h2>评论信息</h2>
         <br />
         <div class="mainGV">
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sqlConnection %>" SelectCommand="SELECT *,Reply.Id as rid FROM LeaveWord  
LEFT JOIN Reply ON LeaveWord.Id=Reply.LeaveWordID order by LeaveDate desc;" UpdateCommand="update SysUser set RealName=@RealName,LoginName=@LoginName,Address=@Address,Role=@Role where Id=@Id" DeleteCommand="delete from LeaveWord where Id=@Id;">
                 <DeleteParameters>
                     <asp:Parameter Name="Id" />
                 </DeleteParameters>
                 <UpdateParameters>
                     <asp:Parameter Name="RealName" />
                     <asp:Parameter Name="LoginName" />
                     <asp:Parameter Name="Address" />
                     <asp:Parameter Name="Role" />
                     <asp:Parameter Name="Id" />
                 </UpdateParameters>
             </asp:SqlDataSource>
             <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1"  PageSize="7"  DataKeyNames="Id" OnRowDataBound="GridView1_RowDataBound">
                 <Columns>
                     <asp:TemplateField HeaderText="评论编号" InsertVisible="False" SortExpression="Id">
                         <EditItemTemplate>
                             <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:BoundField DataField="BookID" HeaderText="书籍编号" SortExpression="BookID" >
                     </asp:BoundField>
                     <asp:BoundField DataField="CustomerID" HeaderText="评论用户编号" SortExpression="CustomerID" >
                     </asp:BoundField>
                     <asp:BoundField DataField="CommentLevel" HeaderText="评论等级" SortExpression="CommentLevel" >
                     </asp:BoundField>
                     <asp:TemplateField HeaderText="评论内容" SortExpression="LeaveContent">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("LeaveContent") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label2" CssClass="mlength" runat="server" Text='<%# Bind("LeaveContent") %>'></asp:Label>
                         </ItemTemplate>
                         <ItemStyle CssClass="overh" Width="150px" />
                     </asp:TemplateField>
                     <asp:BoundField DataField="LeaveDate" HeaderText="评论时间" SortExpression="LeaveDate">
                     </asp:BoundField>
                     <asp:BoundField DataField="ReplyNumber" HeaderText="回复数" SortExpression="ReplyNumber" />
                     <asp:BoundField DataField="CustomerID1" HeaderText="回复用户编号" SortExpression="CustomerID1" />
                     <asp:TemplateField HeaderText="回复内容" SortExpression="ReplyContent">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ReplyContent") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label3" CssClass="mlength" runat="server" Text='<%# Bind("ReplyContent") %>'></asp:Label>
                         </ItemTemplate>
                         <ItemStyle Width="150px" />
                     </asp:TemplateField>
                     <asp:BoundField DataField="ReplyDate" HeaderText="回复时间" SortExpression="ReplyDate" />
                     <asp:TemplateField ShowHeader="False">
                         <ItemTemplate>
                             <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="删除" OnClientClick="return confirm('确定要删除吗？')"></asp:LinkButton>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
             </asp:GridView>
         </div>
    </div>    
      </div>
</asp:Content>
<%-- 
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>--%>
<%--<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
</asp:Content>--%>

