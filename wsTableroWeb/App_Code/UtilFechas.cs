using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for UtilFechas
/// </summary>
public class UtilFechas
{
    public UtilFechas()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static DateTime getFechaIni(int intAnio, int intMes)
    {
        DateTime dtFecIni;
        DateTime dtFecFin;

        dtFecFin = getFechaFin(intAnio, intMes);
        dtFecIni = new DateTime(dtFecFin.Year-1, dtFecFin.Month, 1);

        return dtFecIni;
    }

    public static DateTime getFechaFin(int intAnio, int intMes)
    {
        DateTime dtFecFin;

        dtFecFin = new DateTime(intAnio, intMes, DateTime.Today.Day);

        return dtFecFin;
    }
}
