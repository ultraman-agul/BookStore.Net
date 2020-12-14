<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="DDbook.Orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>叮当-填写订单</title>
    <link rel="stylesheet" href="/css/buttons.css">
    <link rel="stylesheet" href="/css/Orders.css">
    <%-- <script src="/js/order.js"></script> --%>
</asp:Content>
<%--<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>--%>
<%--<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content> --%>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <div class="container">
        <!-- 头部 -->
        <div class="head">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/index.aspx">
                <div class="logo">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/logo.png"/>
                    <span>购物车</span>
                </div>
            </asp:HyperLink>
            <div class="jindu">
                <span>我的购物车</span>
                <span class="current">填写订单</span>
                <span>我的订单</span>
            </div>
        </div>
        <!-- 头部结束 -->
        <div class="title"><h2>请核对购物车清单</h2></div>
        <div class="showBook">
        <asp:DataList ID="DataList1" runat="server" CssClass="CartData">
            <ItemTemplate>
                <div class="items">
                    <div>
                        <img src='/images/img/<%# Eval("Pic") %>' alt="Alternate Text" />
                    </div>
                    <div>
                        <h3>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("BookName") %>'></asp:Label>
                        </h3>
                    </div>
                    <div class="Oprice">
                        <asp:Label ID="Label1" runat="server" Text='<%# "￥" + Convert.ToDouble(Eval("Price")) %>'></asp:Label>
                        &nbsp;&nbsp;
                        <asp:Label ID="Label2" runat="server" Text='<%# "x" + Eval("BookNum") %>'></asp:Label>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
        </div>
        <!--收货信息-->
        <div class="info">
            <div class="contBottom">
            <div class="addressinfo">
                <h2> <i class="iconfont icon-yonghu"></i>收货人信息</h2>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                <asp:DataList ID="addressDL" runat="server" CssClass="addl">
                    <ItemTemplate>
                    <div>
                        <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckedChanged"/>
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("CustomerName") %>'></asp:Label>
                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("AddressName") %>'></asp:Label>
                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
                    </div>
                    </ItemTemplate>
                </asp:DataList>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <a id="addlink" href="javascript:void(0)" onclick="showBox()" class="iconfont icon-tianjia">新增收货地址</a>
            </div>

            <div class="addAddress" id="addBox">
                <div class="title">
                    <span>新增收货人信息</span>
                    <a class="close" id="close" onclick="hideBox()">X</a>
                </div>
                <div class="userinfo">
                <table>
                    <tbody>
                        <tr>
                            <td class="left">收货人</td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" MaxLength="10"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="非空" ControlToValidate="TextBox1" ValidationGroup="group3"></asp:RequiredFieldValidator>
                                                     </td>
                        </tr>
                        <tr>
                            <td class="left">详细地址</td>
                            <td>
                                <asp:TextBox ID="TextBox2" runat="server" MaxLength="50"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="非空" ControlToValidate="TextBox2" ValidationGroup="group3"></asp:RequiredFieldValidator>
                                                      </td>
                        </tr>
                        <tr>
                            <td class="left">手机号码</td>
                            <td>
                                <asp:TextBox ID="TextBox3" runat="server" MaxLength="11"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="非空" ControlToValidate="TextBox3" ValidationGroup="group3"></asp:RequiredFieldValidator>
                                                      </td>
                        </tr>
                        <tr>
                            <td class="left">邮政编码</td>
                            <td>
                                <asp:TextBox ID="TextBox4" runat="server" MaxLength="6"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="非空" ControlToValidate="TextBox4" ValidationGroup="group3"></asp:RequiredFieldValidator>
                                                      </td>
                        </tr>
                    </tbody>
                </table>
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="saveInfo" OnClick="LinkButton1_Click" ValidationGroup="group3">保存收货人信息</asp:LinkButton>
            </div>
            </div>
            <div class="item" style="border-top: 1px solid #ccc;">
                <h2> <i class="iconfont icon-distribution"></i> 配送方式：</h2>
                <br>    
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>邮政</asp:ListItem>
                    <asp:ListItem>申通</asp:ListItem>
                    <asp:ListItem>中通</asp:ListItem>
                    <asp:ListItem>圆通</asp:ListItem>
                    <asp:ListItem>天天</asp:ListItem>
                    <asp:ListItem>韵达</asp:ListItem>
                    <asp:ListItem>京东</asp:ListItem>
                    <asp:ListItem>顺丰</asp:ListItem>
                    <asp:ListItem>上门自取</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="item">
                <h2> <i class="iconfont icon-beizhu"></i> 备注：</h2>
                <br>
                <asp:TextBox ID="TextBox5" runat="server" Height="100px" TextMode="MultiLine" ToolTip="写下你的备注吧~" Width="300" placeholder="写下你的备注吧~"></asp:TextBox>
            </div>
            <div class="item">
                <h2><i class="iconfont icon-zhifu"></i>支付方式</h2>
                <br>
                <div>
                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="fukuan" OnClick="LinkButton2_Click">货到付款</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton3" runat="server" CssClass="fukuan" OnClick="LinkButton3_Click">在线支付</asp:LinkButton>
                </div>
            </div>
            
            </div>

            <div class="rightImg">
                <img src="/images/wallhaven-qdzzgq1.png" alt="">
            </div>
            </div>
        
        <div class="apply">
                <div class="small">
                    <asp:Label ID="Label3" CssClass="num" runat="server" Text="Label"></asp:Label>
                    <span class="totalPrice">本书，总金额:</span>
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                    <br>
                    <div>
                        <span class="yun">运费：</span>
                        <span class="test">￥0.00</span>
                    </div>
                    
                    <br>
                    <span>支付款:</span> 
                    <asp:Label ID="Label6" runat="server" Text="Label" CssClass="totalMon"></asp:Label>
                </div>
                
            </div>

        <div class="bottom">
            <div class="btndv">
                <asp:Button ID="Button1" class="btn btn-success" runat="server" Text="点此支付>>" OnClick="Button1_Click"/>
            </div>
            <div class="btngo">
                <asp:Button ID="Button2" class="btn btn-outline-success btn-lg" runat="server" Text="提交订单" OnClick="Button2_Click" />
            </div>
        </div>
    </div>
    <script src="/js/order.js"></script>
</asp:Content>
<%-- <asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>--%>
<%-- <asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
</asp:Content>--%>

