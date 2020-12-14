<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="bookDetail.aspx.cs" Inherits="DDbook.bookDetail" ValidateRequest="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>叮当-书籍详情</title>
    <link rel="stylesheet" href="/css/bookDetail.css">
</asp:Content>
<%-- <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>--%>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <div class="box">
    <div class="detailContainer">
        <!-- 面包屑导航 -->
        <div class="breadcrumbs">
            <asp:HyperLink ID="HyperLink1" NavigateUrl="~/index.aspx" runat="server">首页</asp:HyperLink>
            > 
            <asp:LinkButton ID="LinkButton1" runat="server" Text="小说"></asp:LinkButton>
             > 
            <asp:Label ID="Label1" runat="server" CssClass="typelabel" Text="侦探/悬疑"></asp:Label>
            >
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        </div>
        <!-- 主要内容 -->
        <div class="mainContain">
            <div class="topContent">
                <div class="imgbox">
                    <asp:Image ID="Image1" runat="server" />
                </div>
                <div class="bookinfo">
                    <div class="header">
                        <h2>
                            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></h2>
                            <br/>
                        <p>已售：<asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>本</p>
                        <p>库存：<asp:Label ID="Label17" runat="server" Text="Label"></asp:Label>本</p>
                    </div>
                    <div class="price">
                        <div class="qianggou">
                            <span>抢购: </span>
                            <asp:Label ID="Label9" runat="server" Text="￥"></asp:Label>
                        </div>
                        <div class="yuanjia">
                            售  价：￥
                            <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
                        </div>
                    </div>
                    <div class="attribute">
                        <dl>
                            <dt>作  者：</dt>
                            <dd>
                                <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></dd>
                        </dl>
                        <dl>
                            <dt>出版社：</dt>
                            <dd>
                                <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label></dd>
                        </dl>
                        <dl>
                            <dt>出版时间：</dt>
                            <dd>
                                <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label></dd>
                        </dl>
                        <dl>
                            <dt>字  数：</dt>
                            <dd>
                                <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>万</dd>
                        </dl>
                        <dl>
                            <dt>所属分类：</dt>
                            <dd>
                                <asp:LinkButton ID="LinkButton2" runat="server">LinkButton</asp:LinkButton>
                                >
                                <asp:LinkButton ID="LinkButton3" runat="server">LinkButton</asp:LinkButton>
                            </dd>
                        </dl>
                    </div>
                    <div class="buydiv">
                        <div class="addCart">
                            <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">加入购物车</asp:LinkButton>
                        </div>
                        <div class="buyNow">
                            <asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton5_Click">立即购买</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tabbox" id="desc">
                <div>
                    <a id="tab1" href="#desc" class="clickli">书籍简介</a>
                    <a id="tab2" href="#comment">评论</a>
                </div>
                <div class="description">
                    <div id="dv1" class="current">
                        <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div id="dv2" class="normal">
                        <div class="CommentNum" id="comment">
                           <asp:Label ID="Label16" runat="server" Text="Label"></asp:Label>
                        </div>
                        <asp:DataList ID="CommentDataList" runat="server" CssClass="commentdl" OnItemCommand="CommentCommand" >
                            <ItemTemplate>
                                <div class="left">
                                    <p>
                                        <asp:Label ID="Label12" runat="server" Text='<%# Eval("LoginName") %>'></asp:Label>
                                        <asp:Label ID="Label13" runat="server" Text='<%# Eval("LeaveDate") %>'></asp:Label>
                                    </p>
    
                                    <div class="imgb">
                                        <asp:Image ID="Image2" runat="server" ImageUrl='<%# string.IsNullOrEmpty(Eval("Pic").ToString()) ? "/images/wenhao.png" : "/images/img/" + Eval("Pic") %>'/>
                                    </div>
                                </div>
                                <div class="Lcontent">
                                    <asp:Label ID="Label14" runat="server" Text='<%# Eval("LeaveContent") %>'></asp:Label>
                                </div>
                                <div class="right">
                                    <asp:LinkButton ID="LinkButton7" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="describe">回复(<asp:Label ID="Label15" runat="server" Text='<%# Eval("ReplyNumber") %>'></asp:Label>)</asp:LinkButton>                    
                                </div>                        
                            </ItemTemplate>
                        </asp:DataList>
                        <div>
                        <asp:LinkButton ID="LinkButton13" runat="server" OnClick="LinkButton13_Click" CssClass="more">查看更多>></asp:LinkButton>
                        </div>
                        <div class="inputword">
                            <div class="top">发表评论 <i class="iconfont icon-pinglun"></i>
                                <br />
                                <asp:ScriptManager runat="server"></asp:ScriptManager>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                     <ContentTemplate>
                                <asp:LinkButton ID="LinkButton8" runat="server" OnClick="LinkButton8_Click">
                                    好
                                </asp:LinkButton>
                                <asp:LinkButton ID="LinkButton9" runat="server" OnClick="LinkButton9_Click">
                                    好
                                </asp:LinkButton>
                               <asp:LinkButton ID="LinkButton10" runat="server" OnClick="LinkButton10_Click">
                                    好
                               </asp:LinkButton>
                               <asp:LinkButton ID="LinkButton11" runat="server" OnClick="LinkButton11_Click">
                                    好
                               </asp:LinkButton>
                               <asp:LinkButton ID="LinkButton12" runat="server" OnClick="LinkButton12_Click" >
                                    好
                                    </asp:LinkButton>
                                     </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Height="200" MaxLength="500" Width="900" CssClass="txtbox" placeholder="发表评论，分享你的看法吧!"></asp:TextBox>
                            <br>
                            <br>
                            <div>
                                <asp:LinkButton ID="LinkButton6" runat="server" OnClick="LinkButton6_Click" CssClass="gobtn">发表评论 
                            </asp:LinkButton>
                            </div>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>
<%-- <asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>--%>
<%--<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
</asp:Content>--%>

