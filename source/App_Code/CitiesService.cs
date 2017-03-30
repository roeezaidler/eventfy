using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Data.OleDb;

/// <summary>
/// Summary description for CitiesService
/// </summary>
public class CitiesService
{
    public static DataSet GetDataSet()
    {
        string strSql = "SELECT * FROM Cities";
        DataSet ds = new DataSet();
        ds = Connect.GetDataSet(strSql, "Cities");
        return ds;

    }
}