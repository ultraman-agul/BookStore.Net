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
                作者：<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                发布时间：<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                    </p>
                    <p>
                        <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                    </p>
                </div>
                <div class="bookinfo">
                    <div class="img-box">
                        <img src="#" alt="Alternate Text" />
                    </div>
                    <div class="txtinfo">
                        <p>
                        <h3><asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></h3>
                        </p>
                        <p>
                        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                        </p>
                        <p>
                        <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                        </p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
<%--<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>--%>
<%--<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
</asp:Content>--%>
