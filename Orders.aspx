<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="DDbook.Orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="./css/Orders.css">
</asp:Content>
<%--<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>--%>
<%--<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content> --%>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <div class="container">
        <div class="title"><h2>请核对购物车清单</h2></div>
        <div class="showBook">
        <asp:DataList ID="DataList1" runat="server">
            <ItemTemplate>
                <div class="descTable">
                    <div class="Oimg">
                        <img src='./images/img/<%# Eval("Pic") %>' alt="Alternate Text" />
                    </div>
                    <div class="Oname">
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
        <div class="contBottom">
            <div class="addressinfo">
                <p >
                    <asp:Label ID="Label9" runat="server" Text="收货人："></asp:Label>
                    <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
                </p>
                <p>
                    <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine"></asp:TextBox>
                </p>
                 <p >
                    <asp:Label ID="Label10" runat="server" Text="收货电话："></asp:Label>
                    <asp:DropDownList ID="DropDownList2" runat="server" ></asp:DropDownList>
                </p>
                <p>
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine"></asp:TextBox>
                </p>
                <p >
                    <asp:Label ID="Label7" runat="server" Text="收货地址："></asp:Label>
                    <asp:DropDownList ID="DropDownList3" runat="server" ></asp:DropDownList>
                </p>
                <p>
                    <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine"></asp:TextBox>
                </p>
                <p >
                    <asp:Label ID="Label8" runat="server" Text="邮政编码："></asp:Label>
                    <asp:DropDownList ID="DropDownList4" runat="server" ></asp:DropDownList>
                </p>
                <p>
                    <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine"></asp:TextBox>
                </p>
                <p>
                    <asp:Label ID="Label14"  runat="server" Text="留言："></asp:Label>
                    <asp:TextBox ID="TextBox5" runat="server" TextMode="MultiLine"></asp:TextBox>
                </p>
                <p >
                    <asp:Label ID="Label13" runat="server" Text="配送方式："></asp:Label>
                    <asp:DropDownList ID="DropDownList5" runat="server" >
                        <asp:ListItem>圆通</asp:ListItem>
                        <asp:ListItem>顺丰</asp:ListItem>
                        <asp:ListItem>邮政</asp:ListItem>
                        <asp:ListItem>韵达</asp:ListItem>
                        <asp:ListItem>天天</asp:ListItem>
                        <asp:ListItem>中通</asp:ListItem>
                        <asp:ListItem>京东</asp:ListItem>
                        <asp:ListItem>申通</asp:ListItem>
                    </asp:DropDownList>
                </p>
            </div>
            <div class="apply">
                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label><span>本书，总金额:</span>
                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
               <span>支付款:</span> 
                <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
            </div>
            <div>
                <asp:Button ID="Button1" runat="server" Text="点此支付>>" OnClick="Button1_Click"/></div>
            <div>
                <asp:Button ID="Button2" runat="server" Text="提交订单" OnClick="Button2_Click" />
        </div>
        
    </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
<%-- <asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
</asp:Content>--%>

