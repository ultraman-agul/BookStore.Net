<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="reply.aspx.cs" Inherits="DDbook.reply" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<%--<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>--%>
<%--<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>--%>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <div class="mainContainer">
        <asp:DataList ID="ReplyDataList" runat="server" OnItemCommand="ReplyCommand">
            <ItemTemplate>
                <div class="top">
                    <p>
                作者：<asp:Label ID="Label1" runat="server" Text='<%# Eval("LoginName") %>'></asp:Label>
                发布时间：<asp:Label ID="Label2" runat="server" Text='<%# Eval("LeaveDate") %>'></asp:Label>
                    </p>
                    <p>
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("LeaveContent") %>'></asp:Label>
                    </p>
                </div>
                <div class="bookinfo">
                    <div class="img-box">
                        <img src='./images/img/<%# Eval("Pic") %>' alt="Alternate Text" />
                    </div>
                    <div class="txtinfo">
                        <p>
                        <h3><asp:Label ID="Label3" runat="server" Text='<%# Eval("Name") %>'></asp:Label></h3>
                        </p>
                        <p>作者：
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Author") %>'></asp:Label>
                        </p>
                        <p>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                        </p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
        <div>
            <h3>评论</h3>
            <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine"></asp:TextBox>
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">发布</asp:LinkButton>
        </div>

        <asp:DataList ID="ReplyReplyDataList" runat="server">
            <ItemTemplate>
                <p>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("LoginName") %>'></asp:Label>
                发布时间：<asp:Label ID="Label2" runat="server" Text='<%# Eval("ReplyDate") %>'></asp:Label>
                    </p>
                    <p>
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("ReplyContent") %>'></asp:Label>
                    </p>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
<%--<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>--%>
<%--<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
</asp:Content>--%>
