using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Data.OleDb;
using System.Data;
/// <summary>
/// Summary description for Connect
/// </summary>
public class Connect
{
    public static void InsertUpdateDelete(string strSql)
    {
        // מחרוזת התחברות
      
        string connectionStr = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\RoeeZaidlerDataBase.accdb;Persist Security Info=True";
      
        // בניית אובייקט התחברות
        OleDbConnection con = new OleDbConnection(connectionStr);
        // בניית אובייקט הביצוע
        OleDbCommand cmd = new OleDbCommand(strSql, con);
        // פתיחת החיבור למסד הנתונים
        con.Open();

        cmd.ExecuteNonQuery();

        // סגירת החיבור למסד הנתונים
        con.Close();
    }
    public static DataSet GetDataSet(string strSql, string tableName)
    {
        // מחרוזת התחברות
          string connectionStr = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\RoeeZaidlerDataBase.accdb;Persist Security Info=True";
        // בניית אובייקט התחברות
        OleDbConnection con = new OleDbConnection(connectionStr);
        // בניית אובייקט הביצוע
        OleDbCommand cmd = new OleDbCommand(strSql, con);
        // בניית אובייקט data set- בניית אובייקט מתווך
        DataSet ds = new DataSet();
        // בניית אובייקט adapter - ממלא את הנתונים בdata set
        OleDbDataAdapter adapter = new OleDbDataAdapter(cmd);
        adapter.Fill(ds, tableName);
        // החזרת הdataset
        return ds;

    }

    public static object GetObject(string strSql)
    {
        // מחרוזת התחברות
        string connectionStr = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\RoeeZaidlerDataBase.accdb;Persist Security Info=True";     
        // בניית אובייקט התחברות
        OleDbConnection con = new OleDbConnection(connectionStr);
        // בניית אובייקט הביצוע
        OleDbCommand cmd = new OleDbCommand(strSql, con);
        // פתיחת החיבור למסד הנתונים
        con.Open();

        object obj = cmd.ExecuteScalar();
        // סגירת החיבור למסד הנתונים
        con.Close();
        // החזרת האובייקט
        return obj;
    }


}