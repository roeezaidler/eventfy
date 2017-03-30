using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // בדיקה שהתאריך לא בעבר
        if (!Page.IsPostBack)
        {
            string currentDate = DateTime.Today.ToShortDateString();
            CheckDate.ValueToCompare = currentDate;
            DdlCities();
        }
        RegisterMsg.Text = "";
        //Test
    }
    public void DdlCities()
    {
        //בניית רשימת ערים
        DataSet ds = CitiesService.GetDataSet();
        city.DataSource = ds;
        city.DataTextField = "CityName";
        city.DataValueField = "CityId";
        city.DataBind();
        ListItem li = new ListItem();
        li.Value = "FirstCity";
        li.Text = "choose city";
        city.Items.Insert(0, li);

    }

    //protected void CheckCity_ServerValidate(object source, ServerValidateEventArgs args)
    //{


    //        if (city.SelectedIndex == 0)
    //        {
    //            args.IsValid = false;
    //        }
    //        else
    //            args.IsValid = true;
    // }

    //protected void CheckHobbies_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    args.IsValid = false;
    //    for (int i = 0; i < hobbies.Items.Count; i++)
    //    {
    //        if (hobbies.Items[i].Selected == true)
    //        {
    //            args.IsValid = true;
    //            break;
    //        }
    //    }

    //}
    protected void submit_Click(object sender, EventArgs e)
    {
        // בדיקה שהאימייל לא קיים
        //string strFind = "SELECT COUNT(MemberFname) FROM Members WHERE MemberEmail= '" + email.Text + "'";
        //object obj = Connect.GetObject(strFind);
        //if (int.Parse(obj.ToString()) == 0)
        //{
            // קבלת המשתנים
            string MemFname = fname.Text;
            string MemLname = lname.Text;
            string MemEmail = email.Text;
            string MemPass = pass.Text;
            string MemDate = birthDate.Text;
            DateTime d = DateTime.Parse(MemDate);
            string MemGender = gender.SelectedItem.Text;
            int MemCity = city.SelectedIndex;
            string MemPhone = DdlPhoneAreaCode.SelectedItem.Text+phoneNumber.Text;
            string MemAddress = adress.Text;
            string MemHobbies = "";
            for (int i = 0; i < hobbies.Items.Count; i++)
            {

                if (i != hobbies.Items.Count - 1)
                    MemHobbies += hobbies.Items[i].Value + ",";

            }
            if (MemHobbies[MemHobbies.Length - 1] == ',')
                MemHobbies = MemHobbies.Substring(0, MemHobbies.Length - 1);
            string MemPic = "";
            if (imgupld.HasFile == false)
            {
                if (MemGender == "Male")
                    MemPic = "~/Images/man.jpg";
                else
                    MemPic = "~/Images/Woman.jpg";
            }
            else
            {
                MemPic = "~/Images/" +imgupld.FileName;
                imgupld.SaveAs(Server.MapPath("images//" + imgupld.FileName));
            }
            string MemComment = comments.Text;

            Members member = new Members();
            member.MemberFname = MemFname;
            member.MemberLname = MemLname;
            member.MemberEmail = MemEmail;
            member.MemberPass = MemPass;
            member.MemberDate = d;
            member.MemberGender = MemGender;
            member.CityId = MemCity;
            member.MemberPhone = MemPhone;
            member.MemberAddress = MemAddress;
            member.MemberHobbies = MemHobbies;
            member.MemberPicture = MemPic;
            member.MemberComment = MemComment;

            if(!MembersService.IsEmailExist(member))
            {
                
                
           
                MembersService.AddMember(member);
                Response.Redirect("ShowMembers.aspx");
            }
            else
            {
                RegisterMsg.Text = "The email is already exist in the system";
            }
            // שאילתא של הכנסת נתונים
            //string strSql = "INSERT INTO Members(MemberFname,MemberLname,MemberEmail,MemberPass,MemberGender,CityId,MemberAddress,MemberHobbies,MemberDate,MemberPicture,MemberPhone,MemberComment)VALUES('" + MemFname.Trim() + "','" + MemLname.Trim() + "','" + MemEmail.Trim() + "','" + MemPass.Trim() + "','" + MemGender.Trim() + "'," + MemCity + ",'" + MemAddress.Trim() + "','" + MemHobbies.Trim() + "','" + d.ToString("yyyy/MM/dd") + "','" + MemPic.Trim() + "','" + MemPhone.Trim() + "','" + MemComment.Trim() + "')";
            //Connect.InsertUpdateDelete(strSql);
            //RegisterMsg.Text = "You registered successfully!";
            //Response.Redirect("ShowMembers.aspx");



            //// בניית טבלה
            //Table ShowMembers = new Table();
            
            //TableRow FirstRow = new TableRow();
            //TableCell FirstId = new TableCell();
            //FirstId.Text = "Id";
            //FirstRow.Controls.Add(FirstId);
            //TableCell FirstFname = new TableCell();
            //FirstFname.Text = "First Name";
            //FirstRow.Controls.Add(FirstFname);
            //TableCell FirstLname = new TableCell();
            //FirstLname.Text = "Last Name";
            //FirstRow.Controls.Add(FirstLname);
            //TableCell FirstEmail = new TableCell();
            //FirstEmail.Text = "Email";
            //FirstRow.Controls.Add(FirstEmail);
            //TableCell FirstPass = new TableCell();
            //FirstPass.Text = "Pass";
            //FirstRow.Controls.Add(FirstPass);
            //TableCell FirstGender = new TableCell();
            //FirstGender.Text = "Gender";
            //FirstRow.Controls.Add(FirstGender);
            //TableCell FirstCity = new TableCell();
            //FirstCity.Text = "City";
            //FirstRow.Controls.Add(FirstCity);
            //TableCell FirstAddress = new TableCell();
            //FirstAddress.Text = "Address";
            //FirstRow.Controls.Add(FirstAddress);
            //TableCell FirstHobbies = new TableCell();
            //FirstHobbies.Text = "Hobbies";
            //FirstRow.Controls.Add(FirstHobbies);
            //TableCell FirstDate = new TableCell();
            //FirstDate.Text = "Birt hDate";
            //FirstRow.Controls.Add(FirstDate);
            //TableCell FirstPic = new TableCell();
            //FirstPic.Text = "Picture";
            //FirstRow.Controls.Add(FirstPic);
            //TableCell FirstPhone = new TableCell();
            //FirstPhone.Text = "Phone";
            //FirstRow.Controls.Add(FirstPhone);
            ////TableCell FirstComment = new TableCell();
            ////FirstComment.Text ="Comment";
            ////FirstRow.Controls.Add(FirstComment);
            
            //ShowMembers.Controls.Add(FirstRow);
            //ShowMembers.ForeColor = Color.White;


            //string SqlShow = "SELECT * FROM Members";
            //DataSet ds = new DataSet();
            //ds = Connect.GetDataSet(SqlShow, "Members");
            //for (int i = 0; i < ds.Tables["Members"].Rows.Count; i++)
            //{
            //    TableRow tr = new TableRow();
            //    TableCell tcId = new TableCell();
            //    tcId.Text = ds.Tables["Members"].Rows[i]["MemberId"].ToString();
            //    tr.Controls.Add(tcId);
            //    TableCell tcFname = new TableCell();
            //    tcFname.Text = ds.Tables["Members"].Rows[i]["MemberFname"].ToString();
            //    tr.Controls.Add(tcFname);
            //    TableCell tcLname = new TableCell();
            //    tcLname.Text = ds.Tables["Members"].Rows[i]["MemberLname"].ToString();
            //    tr.Controls.Add(tcLname);
            //    TableCell tcEmail = new TableCell();
            //    tcEmail.Text = ds.Tables["Members"].Rows[i]["MemberEmail"].ToString();
            //    tr.Controls.Add(tcEmail);
            //    TableCell tcPass = new TableCell();
            //    tcPass.Text = ds.Tables["Members"].Rows[i]["MemberPass"].ToString();
            //    tr.Controls.Add(tcPass);
            //    TableCell tcGender = new TableCell();
            //    tcGender.Text = ds.Tables["Members"].Rows[i]["MemberGender"].ToString();
            //    tr.Controls.Add(tcGender);
            //    TableCell tcCity = new TableCell();
            //    string SqlCity = "SELECT CityName FROM Cities WHERE CityId = " + ds.Tables["Members"].Rows[i]["CityId"] + "";
            //    DataSet dscity = new DataSet();
            //    dscity = Connect.GetDataSet(SqlCity, "Cities");
            //    tcCity.Text = dscity.Tables["Cities"].Rows[0]["CityName"].ToString();
            //    //tcCity.Text = ds.Tables["Members"].Rows[i]["CityId"].ToString();
            //    tr.Controls.Add(tcCity);
            //    TableCell tcAddress = new TableCell();
            //    tcAddress.Text = ds.Tables["Members"].Rows[i]["MemberAddress"].ToString();
            //    tr.Controls.Add(tcAddress);
            //    TableCell tcHobbies = new TableCell();
            //    tcHobbies.Text = ds.Tables["Members"].Rows[i]["MemberHobbies"].ToString();
            //    tr.Controls.Add(tcHobbies);
            //    TableCell tcDate = new TableCell();
            //    tcDate.Text = ds.Tables["Members"].Rows[i]["MemberDate"].ToString();
            //    tr.Controls.Add(tcDate);
            //    TableCell tcPic = new TableCell();
            //    tcPic.Text = ds.Tables["Members"].Rows[i]["MemberPicture"].ToString();
            //    tr.Controls.Add(tcPic);
            //    TableCell tcPhone = new TableCell();
            //    tcPhone.Text = ds.Tables["Members"].Rows[i]["MemberPhone"].ToString();
            //    tr.Controls.Add(tcPhone);
            //    //TableCell tcComment = new TableCell();
            //    //tcComment.Text = ds.Tables["Members"].Rows[i]["MemberComment"].ToString();
            //    //tr.Controls.Add(tcComment);
            //    ShowMembers.Controls.Add(tr);
            //}
            //PnlShowMembers.Controls.Add(ShowMembers);


        //}
        //else
        //{
        //    RegisterMsg.Text = "The email is already exist in the system";

        //}

    }
}