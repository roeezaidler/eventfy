using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for MembersService
/// </summary>
public class MembersService
{
	public static void AddMember(Members member)
    {
        string strSql = "INSERT INTO Members(MemberFname,MemberLname,MemberEmail,MemberPass,MemberGender,CityId,MemberAddress,MemberHobbies,MemberDate,MemberPicture,MemberPhone,MemberComment)VALUES('" + member.MemberFname.Trim() + "','" + member.MemberLname.Trim() + "','" + member.MemberEmail.Trim() + "','" + member.MemberPass.Trim() + "','" + member.MemberGender.Trim() + "'," + member.CityId + ",'" + member.MemberAddress.Trim() + "','" + member.MemberHobbies.Trim() + "','" + member.MemberDate.ToString("yyyy/MM/dd") + "','" + member.MemberPicture.Trim() + "','" + member.MemberPhone.Trim() + "','" + member.MemberComment.Trim() + "')";
        Connect.InsertUpdateDelete(strSql);
    }
    public static bool IsEmailExist(Members member)
    {
        string strFind = "SELECT COUNT(MemberFname) FROM Members WHERE MemberEmail= '" + member.MemberEmail + "'";
        object obj = Connect.GetObject(strFind);
        if (int.Parse(obj.ToString()) == 0)
            return false;
        return true;
    }

}