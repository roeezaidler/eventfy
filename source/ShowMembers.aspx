<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShowMembers.aspx.cs" Inherits="ShowMembers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>





<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1"  Runat="Server">
    <center>
    <asp:GridView ID="GridShowMembers" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDataBound="GridShowMembers_RowDataBound" AllowPaging="True" OnPageIndexChanging="GridShowMembers_PageIndexChanging" PageSize="5">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField HeaderText="Code" />
            <asp:BoundField DataField="MemberId" HeaderText="Id" />
            <asp:BoundField DataField="MemberFname" HeaderText="First Name" />
            <asp:BoundField DataField="MemberLname" HeaderText="Last Name" />
            <asp:BoundField DataField="MemberEmail" HeaderText="Email" />
            <asp:BoundField DataField="MemberPass" HeaderText="Pass" />
            <asp:BoundField DataField="MemberGender" HeaderText="Gender" />
            <asp:BoundField DataField="CityName" HeaderText="City" />
            <asp:BoundField DataField="MemberAddress" HeaderText="Address" />
            <asp:BoundField DataField="MemberHobbies" HeaderText="Hobbies" />
            <asp:BoundField DataField="MemberDate" HeaderText="Date" DataFormatString="{0:d}" />
            <asp:BoundField DataField="MemberPhone" HeaderText="Phone" />
            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <asp:Image ID="Image1" Height="50" Width="50" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="MemberComment" HeaderText="Comment" />
            <asp:TemplateField HeaderText="Check">
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" AutoPostBack="True"  />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" Width="50" Height="50" runat="server" OnDataBinding="ImageButton1_DataBinding" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <br />

        </center>
</asp:Content>

