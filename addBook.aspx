<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="addBook.aspx.cs" Inherits="DDbook.addBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="./css/addBook.css">
</asp:Content>
<%-- <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>--%>
<%--
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>--%>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <div class="mainContainer">
        <nav>
            <ul>
                <li>
                    <asp:HyperLink ID="HyperLink1" runat="server">信息中心</asp:HyperLink></li>
                <li>
                    <asp:HyperLink ID="HyperLink2" runat="server">新品上架</asp:HyperLink></li>
                <li>
                    <asp:HyperLink ID="HyperLink3" runat="server">书籍管理</asp:HyperLink></li>
                <li>
                    <asp:HyperLink ID="HyperLink4" runat="server">留言管理</asp:HyperLink></li>
            </ul>
        </nav>
        <div class="content">
            <div class="leftcontent">
                <p>
                    <asp:HyperLink ID="HyperLink5" runat="server">新品上架</asp:HyperLink></p>
                <p>
                    <asp:HyperLink ID="HyperLink6" runat="server">商品管理</asp:HyperLink></p>
            </div>
            <div class="rightcontent">
                <asp:Label ID="Label1" runat="server" CssClass="showResult"  Text="添加成功"></asp:Label>
                <div class="items">
                    <span>书籍名称：</span>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* 不卖无名之书" ControlToValidate="TextBox1" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="items">
                    <span>作  者：</span>
                    <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* 记得写上作者名" ControlToValidate="TextBox10" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="items">
                    <span>一级分类：</span>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        
                    </asp:DropDownList>
                    <br />
                    <br />
                    <span>二级分类：</span>
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True"></asp:DropDownList>
                </div>
                <br />
                <div class="items">
                    <span>简  介：</span>
                    <br>
                    <asp:TextBox ID="TextBox2" runat="server" MaxLength="200" TextMode="MultiLine" Height="50"></asp:TextBox>
                </div>
                <div class="items publishdate">
                    <span>出版日期：</span>
                    <asp:Calendar ID="Calendar1" runat="server" CssClass="date"></asp:Calendar>
                </div>
                 <div class="items zishu">
                    <span>字  数：</span>
                    <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="* 小破站卖无字天书恐怕不太好" ControlToValidate="TextBox8" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                
                <div class="items">
                    <span>单  价：</span>
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    <b>￥</b>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="* 整数位最多十位，小数为最多为两位，可以无小数位" ValidationExpression="^(([0-9]|([1-9][0-9]{0,9}))((\.[0-9]{1,2})?))$" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>
                <div class="items">
                    <span>特  价：</span>
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    <b>￥ 无特价不填</b>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox5" ErrorMessage="* 整数位最多十位，小数为最多为两位，可以无小数位" ValidationExpression="^(([0-9]|([1-9][0-9]{0,9}))((\.[0-9]{1,2})?))$" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>
                <div class="items">
                    <span>数  量：</span>
                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox6" ForeColor="Red" ErrorMessage="* 正整数谢谢" ValidationExpression="[1-9]\d*"></asp:RegularExpressionValidator>
                </div>
                <div class="items">
                    <span>出版社：</span>
                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" runat="server" ControlToValidate="TextBox7" ErrorMessage="* 必填，可以参考'弘志708出版社'"></asp:RequiredFieldValidator>
                </div>
                
                <div class="items">
                    <span>展示图片：</span>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </div>
                <div class="items">
                    <span>推荐首页：</span>
                    <asp:RadioButton ID="RadioButton1" runat="server" Text="是" GroupName="shouye" />
                    <asp:RadioButton ID="RadioButton2" runat="server" Text="否" GroupName="shouye" />
                </div>
                <div class="items">
                    <span>秒杀活动：</span>
                    <asp:RadioButton ID="RadioButton3" runat="server" Text="是" GroupName="miaosha" />
                    <asp:RadioButton ID="RadioButton4" runat="server" Text="否" GroupName="miaosha" />
                </div>
                <div class="items btn">
                    <asp:Button ID="Button1" runat="server" CssClass="btnok" Text="确定" OnClick="Button1_Click"/>
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
