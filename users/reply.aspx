<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="reply.aspx.cs" Inherits="DDbook.reply" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/css/reply.css">
</asp:Content>
<%--<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>--%>
<%--<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>--%>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
<div class="box">
    <div class="mainContainer">
        <asp:DataList ID="ReplyDataList" runat="server" OnItemCommand="ReplyCommand" CssClass="replyDL">
            <ItemTemplate>
                <div class="top">
                    <p>
                    <asp:Image ID="Image2" runat="server" ImageUrl='<%# string.IsNullOrEmpty(Eval("cPic").ToString()) ? "/images/wenhao.png" : "/images/img/" + Eval("cPic") %>'/>
                作者：<asp:Label ID="Label1" runat="server" Text='<%# Eval("LoginName") %>'></asp:Label>
                发布时间：<asp:Label ID="Label2" runat="server" Text='<%# Eval("LeaveDate") %>'></asp:Label>
                    </p>
                    <p class="content">
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("LeaveContent") %>'></asp:Label>
                    </p>
                </div>
                <div class="bookinfo">
                    <div class="img-box">
                        <img src='/images/img/<%# Eval("Pic") %>' alt="Alternate Text" />
                    </div>
                    <div class="txtinfo">
                        <p>
                        <h3><asp:Label ID="Label3" runat="server" Text='<%# Eval("Name") %>'></asp:Label></h3>
                        </p>
                        <p class="author">作者：
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Author") %>'></asp:Label>
                        </p>
                        <p>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Description") %>' CssClass="description"></asp:Label>
                        </p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
        <div class="fabu">
            <h3> <i class="iconfont icon-pinglun"></i> 评论</h3>
            <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Height="120" placeholder="来说两句吧~"></asp:TextBox>
            <div class="godv">
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CssClass="go">发布</asp:LinkButton></div>
        </div>

        <asp:DataList ID="ReplyReplyDataList" runat="server" CssClass="replyContent">
            <ItemTemplate>
                <p>
                 <asp:Image ID="Image2" runat="server" CssClass="repImg" ImageUrl='<%# string.IsNullOrEmpty(Eval("Pic").ToString()) ? "/images/wenhao.png" : "/images/img/" + Eval("Pic") %>'/>
                作者：<asp:Label ID="Label1" runat="server" Text='<%# Eval("LoginName") %>'></asp:Label>

                发布时间：<asp:Label ID="Label2" runat="server" Text='<%# Eval("ReplyDate") %>'></asp:Label>
                    </p>
                <p>
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("ReplyContent") %>' CssClass="content"></asp:Label>
                </p>
            </ItemTemplate>
        </asp:DataList>
    </div>
</div>
    
</asp:Content>
<%--<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>--%>
<%--<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
</asp:Content>--%>
