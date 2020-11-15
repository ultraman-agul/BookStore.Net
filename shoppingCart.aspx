<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="shoppingCart.aspx.cs" Inherits="DDbook.shoppingCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="./css/shoppingCart.css">
    <style>
       .CartData{
            background-color:#7fffd4;
            width: 100%;
        }
        td .items{
            overflow: hidden;
            display: flex;
            justify-content: space-around;
        }
        td .items div{
            /* float: left; */
            height: 150px;
            width: 150px;
            margin: 20px 20px;
            line-height: 150px;
        }
        td .items div img{
            width: 100px;
            height: 140px;
        }
        td .items div span{
            width:80%;
        }

        td .editItems{
            overflow: hidden;
            display: flex;
            justify-content: space-around; 
        }
        td .editItems div{
            height: 150px;
            width: 150px;
            margin: 20px 20px;
            line-height: 150px;
        }
        td .editItems div img{
            width: 100px;
            height: 140px;
        }
        td .editItems div span{
            width: 80%;
        }
    </style>
</asp:Content>
<%-- <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>--%>
<%-- <asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>--%>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <div class="SCartcontainer">
        <!-- 头部 -->
        <div class="head">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/index.aspx">
                <div class="logo">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/logo.png"/>
                    <span>购物车</span>
                </div>
            </asp:HyperLink>
            <div class="jindu">
                <span class="current">我的购物车</span>
                <span>填写订单</span>
                <span>完成订单</span>
            </div>
        </div>
        <!-- 头部结束,购物车清单开始 -->
        <div class="listBody">
            <div class="biaoti">
                <ul>
                    <li>商品图片</li>
                    <li>商品名称</li>
                    <li>订购价</li>
                    <li>数量</li>
                    <li>操作</li>
                </ul>
            </div>
            <asp:DataList ID="DataList1" runat="server" OnCancelCommand="DataList1_CancelCommand" OnEditCommand="DataList1_EditCommand" OnUpdateCommand="DataList1_UpdateCommand" OnDeleteCommand="DataList1_DeleteCommand" CssClass="CartData">
                <ItemTemplate>
                    <div class="items">
                        <div>
                            <asp:CheckBox ID="Sstate" runat="server" Checked='<%# Eval("State") %>' AutoPostBack="True" OnCheckedChanged="CheckedChanged"/>
                        </div>
                        <div>
                            <img src='./images/img/<%# Eval("Pic")%>' alt="照片"/>
                        </div>
                        <div>
                            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl='<%#"bookDetail.aspx?Id="+Eval("BookID")%>' Text='<%# Eval("BookName")%>'></asp:HyperLink>
                            <!--<asp:Label ID="Label1" runat="server" Text='<%# Eval("BookName")%>'></asp:Label>-->
                        </div>
                        <div>
                            <span>￥</span>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                        </div>
                        <div>
                            <asp:Label ID="txt_num" runat="server" Text='<%# Eval("BookNum") %>'></asp:Label>
                        </div>
                        <div>
                            <asp:LinkButton ID="LinkButton1" CommandArgument='<%# Eval("BookID") %>' CommandName="edit" runat="server">编辑</asp:LinkButton>
                            <asp:LinkButton ID="LinkButton2" CommandName="delete" OnClientClick="javascript: return confirm('是否删除?')" CommandArgument='<%# Eval("BookID") %>' runat="server">删除</asp:LinkButton>
                        </div>
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <div class="editItems">
                        <div>
                            <asp:CheckBox ID="Sstate" runat="server"  Checked='<%# Eval("State") %>' AutoPostBack="True" OnCheckedChanged="CheckedChanged"/>
                        </div>
                        <div>
                            <img src='./images/img/<%# Eval("Pic")%>' alt="照片" />
                        </div>
                        <div>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("BookName")%>'></asp:Label>
                         </div>
                        <div>
                            <span>￥</span>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                        </div>
                        <div>
                            <asp:TextBox ID="txt_num" runat="server" Text='<%# Eval("BookNum") %>'></asp:TextBox>
                        </div>
                        <div>
                            <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# Eval("BookID") %>' CommandName="update">更新</asp:LinkButton>
                            <asp:LinkButton ID="LinkButton4" runat="server" CommandName="cancel">取消</asp:LinkButton>
                        </div>
                    </div>
                </EditItemTemplate>
            </asp:DataList>
        </div>
        <div class="CartBottom">
            <div>
                <div class="pick">
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/index.aspx">继续挑选</asp:HyperLink>
                </div>
                <div class="go">
                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Orders.aspx">去结算</asp:HyperLink>
                </div>
                <div class="price">
                    <span>应付金额：</span>
                    <asp:Label ID="Label4" CssClass="realprice" runat="server" Text="Label"></asp:Label>
                </div> 
            </div>
           
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
<%-- 
<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
</asp:Content>--%>

