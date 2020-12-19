<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="myInfo.aspx.cs" Inherits="DDbook.myInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>叮当-个人中心</title>
    <link href="/css/register.css" rel="stylesheet" />
    <link href="/css/myInfo.css" rel="stylesheet" />
</asp:Content>
<%-- <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>--%>
<%-- <asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>--%>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <div class="mainContainer">
                <asp:SiteMapPath ID="SiteMapPath1" runat="server" Font-Size="Medium"></asp:SiteMapPath>
                <div class="rightTitle">
                    <h2>我的信息</h2>
                    <asp:Image ID="Image1" runat="server" />
                </div>
                <div class="leftImg">
                    <h2>收货地址</h2>
                    <div class="biaoti">
                        <ul>
                            <li>收货人</li>
                            <li>收货地址</li>
                            <li>联系电话</li>
                            <li>邮政编码</li>
                            <li>操作</li>
                        </ul>
                    </div>
                   <asp:DataList ID="addressDL" runat="server" CssClass="addl" OnCancelCommand="addressDL_CancelCommand" OnDeleteCommand="addressDL_DeleteCommand" OnEditCommand="addressDL_EditCommand" OnUpdateCommand="addressDL_UpdateCommand">
                    <ItemTemplate>
                    <div>
    
                        <asp:Label ID="one" runat="server" Text='<%# Eval("CustomerName") %>'></asp:Label>
                        <asp:Label ID="two" runat="server" Width="200px" Text='<%# Eval("AddressName") %>'></asp:Label>
                        <asp:Label ID="three" runat="server" Text='<%# Eval("Phone") %>' Width="120px"></asp:Label>
                        <asp:Label ID="four" runat="server" Text='<%# Eval("PostCode") %>'></asp:Label>
                        <span>
                        <asp:LinkButton ID="LinkButton1" CommandArgument='<%# Eval("Id") %>' CommandName="edit" runat="server">编辑</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton2" CommandName="delete" OnClientClick="javascript: return confirm('是否删除?')" CommandArgument='<%# Eval("Id") %>' runat="server">删除</asp:LinkButton>
                        </span>
                    </div>
                    </ItemTemplate>
                    <EditItemTemplate>
                    <div class="editItems">
   
                        <asp:TextBox ID="one" runat="server" Text='<%# Eval("CustomerName") %>' Width="120px"></asp:TextBox>
                        <asp:TextBox ID="two" runat="server" Text='<%# Eval("AddressName") %>' Width="200px"></asp:TextBox>
                        <asp:TextBox ID="three" runat="server" Text='<%# Eval("Phone")%>' Width="120px"></asp:TextBox>
                        <asp:TextBox ID="four" runat="server" Text='<%# Eval("PostCode") %>' Width="120px"></asp:TextBox>
                        
                            <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="update">更新</asp:LinkButton>
                            <asp:LinkButton ID="LinkButton4" runat="server" CommandName="cancel">取消</asp:LinkButton>

                        </div>
                    </div>
                </EditItemTemplate>
                </asp:DataList>
                    <a id="addlink" href="javascript:void(0)" onclick="showBox()" class="iconfont icon-tianjia">新增收货地址</a>
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
                                <asp:TextBox ID="TextBox6" runat="server" MaxLength="10"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="非空" ControlToValidate="TextBox6" ValidationGroup="group1"></asp:RequiredFieldValidator>
                                                     </td>
                        </tr>
                        <tr>
                            <td class="left">详细地址</td>
                            <td>
                                <asp:TextBox ID="TextBox8" runat="server" MaxLength="50"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="非空" ControlToValidate="TextBox8" ValidationGroup="group1"></asp:RequiredFieldValidator>
                                                      </td>
                        </tr>
                        <tr>
                            <td class="left">手机号码</td>
                            <td>

                                <asp:TextBox ID="TextBox9" runat="server" MaxLength="11"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="非空" ControlToValidate="TextBox9" ValidationGroup="group1"></asp:RequiredFieldValidator>
                                                      </td>
                        </tr>
                        <tr>
                            <td class="left">邮政编码</td>
                            <td>
                                <asp:TextBox ID="TextBox10" runat="server" MaxLength="6"></asp:TextBox>
                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="非空" ControlToValidate="TextBox10" ValidationGroup="group1"></asp:RequiredFieldValidator>
                                                      </td>
                        </tr>
                    </tbody>
                </table>
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="saveInfo" OnClick="LinkButton1_Click" ValidationGroup="group1">保存收货人信息</asp:LinkButton>
            </div>
            </div>
            </div>
        <div class="registerBox">
                    <table>
                        <tbody>
                            <tr>
                                <td class="left">用户名</td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server" TabIndex="1" MaxLength="10"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="非空" ControlToValidate="TextBox1" ValidationGroup="group2"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="left">真实姓名</td>
                                <td>
                                    <asp:TextBox ID="TextBox2" runat="server" TabIndex="2" MaxLength="10"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="非空" ControlToValidate="TextBox2" ValidationGroup="group2"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="left">手机号码</td>
                                <td>
                                    <asp:TextBox ID="TextBox3" runat="server" TabIndex="3" MaxLength="11"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="非空" ControlToValidate="TextBox3" ValidationGroup="group2"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="left">邮政编码</td>
                                <td>
                                    <asp:TextBox ID="TextBox7" runat="server" TabIndex="5" MaxLength="6"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="非空" ControlToValidate="TextBox7" ValidationGroup="group2"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="left">密码</td>
                                <td>
                                    <asp:TextBox ID="TextBox4" runat="server" ControlToCompare="TextBox4" TextMode="Password" TabIndex="6" MaxLength="20"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="非空" ControlToValidate="TextBox4" ValidationGroup="group2"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="left">确认密码</td>
                                <td>
                                    <asp:TextBox ID="TextBox5" runat="server" TextMode="Password" TabIndex="7" MaxLength="20"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="密码不一致" ControlToValidate="TextBox5" ControlToCompare="TextBox4"></asp:CompareValidator>
                                </td>       
                            </tr>
                            <tr>
                                <td class="left">用户头像</td>
                                <td>
                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                </td>
                            </tr>
                        <tr><td colspan="2">
                            <asp:Button ID="Button2" runat="server" Text="修改" CssClass="xiugai" OnClick="Button2_Click"/>
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" CssClass="registerbtn1" Text="保存" TabIndex="9" ValidationGroup="group2" /></td></tr>
                        </tbody>
                    </table>    
                </div>
        </div>
        <script src="/js/order.js"></script>
</asp:Content>
<%-- <asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>--%>
<%-- <asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">
</asp:Content>--%>
