<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .lblWhite
        {
            font-size: 18pt;
            font-weight: bold;
            color: white;
        }
        
        .txtbox
        {
            width: 200px;
            height: 20px;
            font-weight: bold;
            font-size: large;
            direction: rtl;
            position: absolute;
            border-radius: 10px;
        }
        .lbl
        {
            font-size: 14pt;
            font-weight: bold;
        }
    </style>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#tbl").fadeIn(2000);


        })

    </script>
    <script lang="ja" type="text/javascript">
        var x = 0;
        var flag2 = false;
        
        function ValidLetters()
        {
            var flag = false;
            var EmailLog = document.getElementById('ContentPlaceHolder1_EmailLog').value;
            var PassLog = document.getElementById('ContentPlaceHolder1_PassLog').value;
            var LblError = document.getElementById('ContentPlaceHolder1_LblAlert');

            var bool = true;
            for (var i = 0; i < EmailLog.length; i++) {
                if (EmailLog[i] >= 'א' && EmailLog[i] <= 'ת' || EmailLog[i] == " ") {
                    document.getElementById('ContentPlaceHolder1_EmailLog').value = EmailLog.trim().replace(EmailLog[i], "");
                    LblError.innerHTML = "האימייל אינו תקין";
                    bool = false;
                }
            }

         
            var counter = 0;
            for (var i = 0; i < EmailLog.length; i++) {
                if (EmailLog.charAt(i) == '@') {
                    counter++;
                }
            }
            if (counter >= 2 || counter == 0) 
                bool = false;     
            var countDot = 0;
            for (var i = 0; i < EmailLog.length; i++) {
                if (EmailLog.charAt(i) == '.') {
                    countDot++;
                }
            }
            if (countDot == 0) 
                bool = false;
            if (EmailLog.charAt(EmailLog.lastIndexOf("@") + 1) == '.') 
                bool = false;

            if (!bool) {
                
                LblError.innerHTML = "האימייל אינו תקין";
                if (!flag2) {
                    Flickering();
                    flag2 = true;
                }
            }
            
              
                //if (flag && !flag2) {
                //    Flickering();
                //    flag2 = true;
                //}
                if (bool) {
                    LblError.innerHTML = "";

                } 
            
        }
        function Flickering() {
            var LblError = document.getElementById('ContentPlaceHolder1_LblAlert');

            x++;
            if (x % 2 == 0) {
                LblError.style.background = "red";
                LblError.style.color = "white";
            }
            else {
                LblError.style.background = "white";
                LblError.style.color = "red";
            }
            if (x > 1) {
                x = 0;
            }

            setTimeout(function () {
                Flickering();
            }, 250)

        }
    </script>
    <link href="StyleSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <table id="tbl" style="display:none">
            <tr>
                <td colspan="2" class="lblWhite" style="text-align: center; font-size: 36pt">
                    Login
                </td>
            </tr>
            <tr style="height: 30px">
            </tr>
            <tr>
                <td class="lblWhite">
                    Email
                </td>
                <td>
                    <asp:TextBox ID="EmailLog" runat="server" placeholder="email" class="lbl" onkeyup="ValidLetters()" onkeydown="ValidLetters()"></asp:TextBox>
                </td>
               
            </tr>
            <tr style="height: 10px">
            </tr>
            <tr>
                <td class="lblWhite">
                    Password
                </td>
                <td>
                    <asp:TextBox ID="PassLog" runat="server" MaxLength="20" TextMode="Password" placeholder="password" class="lbl"
                        onkeydown="ValidLetters()" onkeyup="ValidLetters()"></asp:TextBox>
                </td>
            </tr>
            <tr style="height: 10px">
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <asp:Button ID="LoginPress" runat="server"  Text="Login" Style="border-radius: 10px">
                    </asp:Button>
                </td>
            </tr>
            <tr style="height: 10px">
            </tr>
            <tr>
                <td colspan="2" style="text-align: center; font-weight: bold; color: white;">
                    <asp:Label ID="LblAlert" runat="server" Text="" Style="background: red; border-radius: 10px"></asp:Label>
                </td>
            </tr>
            <tr>
                 <td rowspan="2">
                    <asp:ValidationSummary ID="ValidationSummary1" DisplayMode="List" Style="color: red;
                        font-weight: bold; font-size: 18pt; direction: ltr; vertical-align: top; padding-top: 50px"
                        runat="server" />
                </td>
            </tr>
        </table>
        <asp:RequiredFieldValidator ID="CheckEmptyEmail" runat="server" ControlToValidate="EmailLog"
            Display="Dynamic" ForeColor="Red" ErrorMessage="*Enter email">&nbsp;</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="CheckEmail" runat="server" ControlToValidate="EmailLog"
            Display="Dynamic" ValidationExpression="\w+\@\w+\.com" ErrorMessage="*Email is not valid">&nbsp;</asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="CheckEmptyPass" runat="server" ControlToValidate="PassLog"
            Display="Dynamic" ForeColor="Red" ErrorMessage="*Enter password">&nbsp;</asp:RequiredFieldValidator>
         <asp:RegularExpressionValidator ID="CheckPassLetters" runat="server" ControlToValidate="PassLog" Display="Dynamic"
              ValidationExpression="\w{5,15}" ErrorMessage="*Password must be 5-15 chars in english with numbers ONLY">&nbsp;</asp:RegularExpressionValidator>
    </center>
</asp:Content>
