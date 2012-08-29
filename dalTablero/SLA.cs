using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace dalTablero
{
    public class SLA
    {
        public DataTable Listar_Tipos()
        {
            DataSet _ds = new DataSet();
            Database db = DatabaseFactory.CreateDatabase("Tablero");
            System.Data.Common.DbCommand cm = db.GetStoredProcCommand("[S_View_TicketsConSLA_Tipos]");

            _ds = db.ExecuteDataSet(cm);
            return _ds.Tables[0];
        }
        public DataTable Listar_Grupos()
        {
            DataSet _ds = new DataSet();
            Database db = DatabaseFactory.CreateDatabase("Tablero");
            System.Data.Common.DbCommand cm = db.GetStoredProcCommand("[S_View_TicketsConSLA_Grupos]");

            _ds = db.ExecuteDataSet(cm);
            return _ds.Tables[0];
        }
        public DataTable Listar_Areas()
        {
            DataSet _ds = new DataSet();
            Database db = DatabaseFactory.CreateDatabase("Tablero");
            System.Data.Common.DbCommand cm = db.GetStoredProcCommand("[S_View_TicketsConSLA_Areas]");

            _ds = db.ExecuteDataSet(cm);
            return _ds.Tables[0];
        }
        public DataTable Listar_Anios()
        {
            DataSet _ds = new DataSet();
            Database db = DatabaseFactory.CreateDatabase("Tablero");
            System.Data.Common.DbCommand cm = db.GetStoredProcCommand("[S_View_TicketsConSLA_Anios]");

            _ds = db.ExecuteDataSet(cm);
            return _ds.Tables[0];
        }
        public DataTable Listar_Meses(System.String strAnio)
        {
            DataSet _ds = new DataSet();
            Database db = DatabaseFactory.CreateDatabase("Tablero");
            System.Data.Common.DbCommand cm = db.GetStoredProcCommand("[S_View_TicketsConSLA_Meses]");
            db.AddInParameter(cm, "@ANIO", DbType.String, strAnio);

            _ds = db.ExecuteDataSet(cm);
            return _ds.Tables[0];
        }
    }
}
