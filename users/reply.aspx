<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="reply.aspx.cs" Inherits="DDbook.reply" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>叮当-评论回复</title>
    <link rel="stylesheet" href="/css/reply.css">
</asp:Content>
<%--<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>--%>
<%--<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>--%>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
<div class="box">
    <div class="mainContainer">
        <asp:DataList ID="ReplyDataList" runat="server"  CssClass="replyDL" OnItemCommand="ReplyDataList_ItemCommand">
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
                        <asp:LinkButton ID="LinkButton2" runat="server"  CommandArgument='<%# Eval("Id") %>' CommandName="describe">
                        <img src='/images/img/<%# Eval("Pic") %>' alt="Alternate Text" />
                        </asp:LinkButton>
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
              <div class="expression">
                  <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server"
                            OnClick="ImageButton1_Click"
                            ImageUrl="~/images/QQmrbqb_23672/QQexpression/1.gif" />
                        <asp:ImageButton ID="ImageButton2" runat="server"
                            OnClick="ImageButton2_Click"
                            ImageUrl="~/images/QQmrbqb_23672/QQexpression/2.gif" />
                        <asp:ImageButton ID="ImageButton3" runat="server"
                            OnClick="ImageButton3_Click"
                            ImageUrl="~/images/QQmrbqb_23672/QQexpression/3.gif" />
                        <asp:ImageButton ID="ImageButton4" runat="server"
                            OnClick="ImageButton4_Click"
                            ImageUrl="~/images/QQmrbqb_23672/QQexpression/4.gif" />
                        <asp:ImageButton ID="ImageButton5" runat="server"
                            OnClick="ImageButton5_Click"
                            ImageUrl="~/images/QQmrbqb_23672/QQexpression/5.gif" />
                        <asp:ImageButton ID="ImageButton6" runat="server"
                            OnClick="ImageButton6_Click"
                            ImageUrl="~/images/QQmrbqb_23672/QQexpression/6.gif" />
                        <asp:ImageButton ID="ImageButton7" runat="server"
                            OnClick="ImageButton7_Click"
                            ImageUrl="~/images/QQmrbqb_23672/QQexpression/7.gif" />
                        <asp:ImageButton ID="ImageButton8" runat="server"
                            OnClick="ImageButton8_Click"
                            ImageUrl="~/images/QQmrbqb_23672/QQexpression/8.gif" />
                        <asp:ImageButton ID="ImageButton9" runat="server"
                            OnClick="ImageButton9_Click"
                            ImageUrl="~/images/QQmrbqb_23672/QQexpression/9.gif" />
                        <asp:ImageButton ID="ImageButton10" runat="server"
                            OnClick="ImageButton10_Click"
                            ImageUrl="~/images/QQmrbqb_23672/QQexpression/10.gif" />
                        <asp:ImageButton ID="ImageButton11" runat="server"
                            OnClick="ImageButton11_Click"
                            ImageUrl="~/images/QQmrbqb_23672/QQexpression/11.gif" />
                        <asp:ImageButton ID="ImageButton12" runat="server"
                            OnClick="ImageButton12_Click"
                            ImageUrl="~/images/QQmrbqb_23672/QQexpression/12.gif" />
                        <asp:ImageButton ID="ImageButton13" runat="server"
                            OnClick="ImageButton13_Click"
                            ImageUrl="~/images/QQmrbqb_23672/QQexpression/13.gif" />
                        <asp:ImageButton ID="ImageButton14" runat="server"
                            OnClick="ImageButton14_Click"
                            ImageUrl="~/images/QQmrbqb_23672/QQexpression/14.gif" />
                        <asp:ImageButton ID="ImageButton15" runat="server"
                            OnClick="ImageButton15_Click"
                            ImageUrl="~/images/QQmrbqb_23672/QQexpression/15.gif" />
                       <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Height="120" placeholder="来说两句吧~"></asp:TextBox>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
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
