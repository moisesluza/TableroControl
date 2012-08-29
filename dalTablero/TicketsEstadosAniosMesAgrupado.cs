using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace dalTablero
{
    public class TicketsEstadosAñosMesAgrupado
    {
        public DataTable Listar_Tipos()
        {
            DataSet _ds = new DataSet();
            Database db = DatabaseFactory.CreateDatabase("Tablero");
            System.Data.Common.DbCommand cm = db.GetStoredProcCommand("[S_View_TicketsEstadosAñosMesAgrupado_Tipos]");

            _ds = db.ExecuteDataSet(cm);
            return _ds.Tables[0];
        }
        public DataTable Listar_Areas()
        {
            DataSet _ds = new DataSet();
            Database db = DatabaseFactory.CreateDatabase("Tablero");
            System.Data.Common.DbCommand cm = db.GetStoredProcCommand("[S_View_TicketsEstadosAñosMesAgrupado_Areas]");

            _ds = db.ExecuteDataSet(cm);
            return _ds.Tables[0];
        }
        public DataTable Listar_Anios()
        {
            DataSet _ds = new DataSet();
            Database db = DatabaseFactory.CreateDatabase("Tablero");
            System.Data.Common.DbCommand cm = db.GetStoredProcCommand("[S_View_TicketsEstadosAñosMesAgrupado_Anios]");

            _ds = db.ExecuteDataSet(cm);
            return _ds.Tables[0];
        }
        public DataTable Listar_Meses(int intAnio)
        {
            DataSet _ds = new DataSet();
            Database db = DatabaseFactory.CreateDatabase("Tablero");
            System.Data.Common.DbCommand cm = db.GetStoredProcCommand("[S_View_TicketsEstadosAñosMesAgrupado_Meses]");
            db.AddInParameter(cm, "@ANIO", DbType.Int16, intAnio);

            _ds = db.ExecuteDataSet(cm);
            return _ds.Tables[0];
        }
    }
}
