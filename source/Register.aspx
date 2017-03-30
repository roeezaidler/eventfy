<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .lbl {
            font-size: 18pt;
            font-weight: bold;
        }

        .lblWhite {
            font-size: 18pt;
            font-weight: bold;
            color: white;
        }

        .txtbox {
            width: 300px;
            height: 20px;
            font-weight: bold;
            font-size: large;
            direction: rtl;
            position: absolute;
        }
       

        .auto-style1 {
            font-size: 18pt;
            font-weight: bold;
            color: white;
            height: 36px;
        }
        .auto-style2 {
            height: 36px;
        }
       

    </style>
    <script lang="ja" type="text/javascript">
        function HobbiesCheck(sender, args) {
          
            var hobby = document.getElementById('<%=hobbies.ClientID%>');
            var input = hobby.getElementsByTagName('input');
            args.IsValid = false;
            for (var i = 0; i < input.length; i++) {
                if (input[i].checked) {
                    args.IsValid = true;
                    return;
                }
            }
            return args.IsValid;
        }
 


    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".lbl").keydown(function () {
                $(this).css("background-color","#faffbd")
            })


        })

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
      <asp:Panel ID="PnlShowMembers" style="margin-left:570px;float:right;position:absolute;top:600px" runat="server">
        
    </asp:Panel>
    <table style="margin-top:20px;float:left" >
        
        <tr>
            <td class="lblWhite">First Name
            </td>
            <td>
                <asp:TextBox ID="fname" runat="server" placeholder="first name" MaxLength="10" class="lbl"></asp:TextBox>


            </td>
            <td rowspan="13">
                <asp:ValidationSummary ID="ValidationSummary1" DisplayMode="List" Style="color: red; font-weight: bold; font-size: 18pt; direction: ltr; vertical-align: top;padding-top:50px" runat="server" />
                <asp:Label ID="RegisterMsg" runat="server" class="lbl" style="color:white" Text=""></asp:Label>

                &nbsp;</td>
        </tr>
        <tr style="height:10px">

        </tr>
        <tr>
            <td class="lblWhite">Last Name
            </td>
            <td>
                <asp:TextBox ID="lname" runat="server" MaxLength="20" placeholder="last name" class="lbl"></asp:TextBox>

            </td>
        </tr>
          <tr style="height:10px">

        </tr>
        <tr>
            <td class="lblWhite">Email
            </td>
            <td>
                <asp:TextBox ID="email" runat="server" placeholder="email" class="lbl"></asp:TextBox>
            </td>
        </tr>
          <tr style="height:10px">

        </tr>
        <tr>
            <td class="lblWhite">Password
            </td>
            <td>
                <asp:TextBox TextMode="password" ID="pass" MaxLength="15" runat="server" placeholder="password" class="lbl"></asp:TextBox>
            </td>
        </tr>
          <tr style="height:10px">

        </tr>
        <tr>
            <td class="lblWhite">Confirm Password
            </td>
            <td>
                <asp:TextBox TextMode="password" ID="repass" MaxLength="15" runat="server" placeholder="confirm password" class="lbl"></asp:TextBox>
            </td>
        </tr>
          <tr style="height:10px">

        </tr>
        <tr>
            <td class="auto-style1">
                Birth Date
            </td>
            <td class="auto-style2">
                    <asp:TextBox ID="birthDate" placeholder="dd/mm/yyyy" class="lbl" runat="server"></asp:TextBox>
              <%--  <asp:textbox id="birthDate" placeholder="birth date" textmode="date" class="lbl" runat="server"></asp:textbox>--%>
            </td>
        </tr>
          <tr style="height:10px">

        </tr>
        <tr>
            <td class="lblWhite">Gender
            </td>
            <td>
                <asp:RadioButtonList ID="gender" runat="server" class="lblWhite">
                    <asp:ListItem Value="male">Male</asp:ListItem>
                    <asp:ListItem Value="female">Female</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
          <tr style="height:10px">

        </tr>
        <tr>
            <td class="lblWhite">City
            </td>
            <td>
                <asp:DropDownList ID="city" Width="300px" runat="server" class="lbl">
                </asp:DropDownList>
            </td>
        </tr>
          <tr style="height:10px">

        </tr>
        <tr>
            <td class="lblWhite">
                Phone Number
            </td>
            <td>
                <asp:DropDownList ID="DdlPhoneAreaCode" class="lbl" runat="server">
                <asp:ListItem Value="area" Text="area"></asp:ListItem>
                <asp:ListItem Value="050" Text="050"></asp:ListItem>
                <asp:ListItem Value="052" Text="052"></asp:ListItem>
                <asp:ListItem Value="053" Text="053"></asp:ListItem>
                <asp:ListItem Value="054" Text="054"></asp:ListItem>
                <asp:ListItem Value="055" Text="055"></asp:ListItem>
                <asp:ListItem Value="058" Text="058"></asp:ListItem>
                </asp:DropDownList>
                
                <asp:TextBox ID="phoneNumber" placeholder="enter phonenumber"  MaxLength="7" runat="server" class="lbl"></asp:TextBox>
            </td>
        </tr>
          <tr style="height:10px">

        </tr>
        <tr>
           
            <td class="lblWhite">Address
            </td>
            <td>
                <asp:TextBox ID="adress" MaxLength="20" runat="server" placeholder="enter adress" class="lbl"></asp:TextBox>
            </td>
        </tr>
          <tr style="height:10px">

        </tr>
        <tr>
            <td class="lblWhite">Hobbies
            </td>
            <td>
                <asp:CheckBoxList ID="hobbies" runat="server" class="lblWhite">
                    <asp:ListItem Value="handball">Handball</asp:ListItem>
                    <asp:ListItem Value="homework">Homework</asp:ListItem>
                    <asp:ListItem Value="soccer">Soccer</asp:ListItem>
                    <asp:ListItem Value="swimming">Swimming</asp:ListItem>
                    <asp:ListItem Value="playing games">Playing games</asp:ListItem>
                </asp:CheckBoxList>
            </td>
        </tr>
          <tr style="height:10px">

        </tr>
        <tr>
            <td class="lblWhite">Upload Image
            </td>
            <td>
                <asp:FileUpload ID="imgupld" runat="server" class="lblWhite" />
            </td>
        </tr>
          <tr style="height:10px">

        </tr>
        <tr>
            <td class="lblWhite">Comments
            </td>
            <td>
                <asp:TextBox TextMode="multiline" Rows="5" Width="300px" ID="comments" runat="server" Style="" placeholder="Comments"></asp:TextBox>
            </td>
        </tr>
          <tr style="height:10px">

        </tr>
        <tr>

            <td colspan="3">
                <asp:Button ID="submit" runat="server" Text="submit" Style="width: 200px; height: 50px; margin-left: 50px" OnClick="submit_Click" />
            </td>
        </tr>
    </table>
    
  


    <%--בדיקות ואלדיזציה--%>
    <asp:RequiredFieldValidator ID="CheckEmptyFname" runat="server" ControlToValidate="fname" ForeColor="Red" Display="Dynamic" ErrorMessage="*Enter first name">&nbsp;</asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="CheckLettersFname" runat="server" ControlToValidate="fname" Display="Dynamic" ValidationExpression="^([A-Za-z-]{2,10})$" ErrorMessage="*First name must be 2-10 chars in english only">&nbsp;</asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="CheckEmptyLname" runat="server" ControlToValidate="lname" Display="Dynamic" ForeColor="Red" ErrorMessage="*Enter last name">&nbsp;</asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="CheckLettersLname" runat="server" ControlToValidate="Lname" Display="Dynamic" ValidationExpression="^([A-Za-z- ]{2,20})$" ErrorMessage="*Last name must be 2-20 chars in english/space/-">&nbsp;</asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="CheckEmptyEmail" runat="server" ControlToValidate="email" Display="Dynamic" ForeColor="Red" ErrorMessage="*Enter email">&nbsp;</asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="CheckEmail" runat="server" ControlToValidate="email" Display="Dynamic" ValidationExpression="\w+\@\w+\.com" ErrorMessage="*Email is not valid">&nbsp;</asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="CheckEmptyPass" runat="server" ControlToValidate="pass" Display="Dynamic" ForeColor="Red" ErrorMessage="*Enter password">&nbsp;</asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="CheckPassLetters" runat="server" ControlToValidate="pass" Display="Dynamic" ValidationExpression="\w{5,15}" ErrorMessage="*Password must be 5-15 chars in english with numbers ONLY">&nbsp;</asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="CheckEmptyRepass" runat="server" ControlToValidate="repass" Display="Dynamic" ForeColor="Red" ErrorMessage="*Enter repass">&nbsp;</asp:RequiredFieldValidator>
    <asp:CompareValidator ID="ComparePass" runat="server" ControlToValidate="repass" ControlToCompare="pass" Display="Dynamic" ErrorMessage="*Passwords do not match">&nbsp;</asp:CompareValidator>
    <asp:RequiredFieldValidator ID="CheckEmptyDate" runat="server" ControlToValidate="birthDate" Display="Dynamic" ErrorMessage="*Enter Birth Date">&nbsp;</asp:RequiredFieldValidator>
  <%--  <asp:regularexpressionvalidator id="checkvaliddate" runat="server" controltovalidate="birthdate" validationexpression="\d{1,2}/\d{1,2}/\d{4}"  errormessage="*date is not valid">&nbsp;</asp:regularexpressionvalidator>--%>
    <asp:CompareValidator ID="CheckDate" runat="server" ControlToValidate="birthDate" Display="Dynamic" Operator="LessThanEqual" Type="Date"  ErrorMessage="*The Date Must Be In The Past">&nbsp;</asp:CompareValidator>   
    <asp:RequiredFieldValidator ID="CheckMarkGender" runat="server" ControlToValidate="gender" Display="Dynamic" ErrorMessage="*Select gender">&nbsp;</asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" ControlToValidate="adress" ValidationExpression="^([0-9A-Za-z ]{3,20})$" ErrorMessage="*Adress name must be 3-20 chars in numbers/english/space">&nbsp;</asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="CityCheck" ControlToValidate="city" InitialValue="FirstCity" Display="Dynamic" runat="server" ErrorMessage="*Enter City">&nbsp;</asp:RequiredFieldValidator>
<%--      <asp:CustomValidator ID="CheckCity" runat="server" ClientValidationFunction="CityCheck" ErrorMessage="Enter City"></asp:CustomValidator>--%>        
    <asp:RequiredFieldValidator ID="CheckEmptyPhone" runat="server" ControlToValidate="phoneNumber" Display="Dynamic" ErrorMessage="*Enter Phone Number">&nbsp;</asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="CheckArea" runat="server" ControlToValidate="DdlPhoneAreaCode" InitialValue="area" ErrorMessage="*Choose phone area">&nbsp;</asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="CheckValidPhone" runat="server" ControlToValidate="phoneNumber" Display="Dynamic" ValidationExpression="\d{7}" ErrorMessage="*Phone Number must be 10 digits">&nbsp;</asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="CheckEmptyAdress" runat="server" ControlToValidate="adress" ForeColor="Red" Display="Dynamic" ErrorMessage="*Enter adress">&nbsp;</asp:RequiredFieldValidator>
    <asp:CustomValidator ID="CheckHobbies" runat="server" ClientValidationFunction="HobbiesCheck" Display="Dynamic" ErrorMessage="*Select at least 1 hobby">&nbsp;</asp:CustomValidator>
    <asp:RegularExpressionValidator ID="CheckImageUpload" runat="server" ControlToValidate="imgupld" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.gif|.GIF|.jpg|.JPG|.jpeg|.JPEG)$" ErrorMessage="*Only image files are allowed">&nbsp;</asp:RegularExpressionValidator>
    
</asp:Content>

