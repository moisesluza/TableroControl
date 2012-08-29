using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Microsoft.Reporting.WebForms;

public partial class frmHistorial : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!(Page.IsPostBack))
        {
            dalTablero.TicketsEstadosAñosMesAgrupado _dal = new dalTablero.TicketsEstadosAñosMesAgrupado();

            this.cmbAnio.DataSource = _dal.Listar_Anios();
            this.cmbAnio.DataTextField = "ANIO";
            this.cmbAnio.DataBind();

            this.cmbAnio.SelectedValue = Convert.ToString(DateTime.Now.Year);

            int intAnio=0;
            int.TryParse(this.cmbAnio.SelectedValue, out intAnio);

            this.cmbMes.DataSource = _dal.Listar_Meses(intAnio);
            this.cmbMes.DataValueField = "CODIGO";
            this.cmbMes.DataTextField = "MES";
            this.cmbMes.DataBind();

            this.cmbMes.SelectedValue = Convert.ToString(DateTime.Now.Month);

            this.cmbTip.DataSource = _dal.Listar_Tipos();
            this.cmbTip.DataTextField = "TIPO";
            this.cmbTip.DataBind();

            this.cmbAre.DataSource = _dal.Listar_Areas();
            this.cmbAre.DataTextField = "AREA";
            this.cmbAre.DataBind();

            this.cmbAre.Items.Insert(0, new ListItem("[TODOS]", ""));
            this.cmbTip.Items.Insert(0, new ListItem("[TODOS]", ""));
         

            _dal = null;
        }
    }
    protected void btnBus_Click(object sender, EventArgs e)
    {
        int intAnio = 0;
        int intMes = 0;

        if (!int.TryParse(cmbAnio.SelectedValue, out intAnio) || !int.TryParse(cmbMes.SelectedValue, out intMes))
        {
            lblErr.Text = "El año y mes seleccionado es incorrecto";
            return;
        }

        System.Collections.Generic.List<ReportParameter> _parameters = new System.Collections.Generic.List<ReportParameter>();
        _parameters.Add(new ReportParameter("Tipo", this.cmbTip.SelectedIndex == 0 ? " " : this.cmbTip.Text));
        _parameters.Add(new ReportParameter("Area", this.cmbAre.SelectedIndex == 0 ? " " : this.cmbAre.Text));
        _parameters.Add(new ReportParameter("anioMes_ini", UtilFechas.getFechaIni(intAnio,intMes).ToString("yyyyMM")));
        _parameters.Add(new ReportParameter("anioMes_fin", UtilFechas.getFechaFin(intAnio, intMes).ToString("yyyyMM")));
        try
        {
            this.rpvData.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Remote;
            this.rpvData.ShowParameterPrompts = false;
            this.rpvData.ServerReport.ReportServerUrl = new Uri(ConfigurationManager.AppSettings["ReportServerUrl"]);
            this.rpvData.ServerReport.ReportPath = "/rptTablero/rptHistoricoAtenciones";
            this.rpvData.ServerReport.SetParameters(_parameters);
            this.rpvData.ServerReport.Refresh();
            this.rpvData.Visible = true;
        }
        catch (Exception ex)
        {
            this.rpvData.Visible = false;
            this.lblErr.Text = ex.Message + "<br/>" + ex.StackTrace ;
        }

    }
    protected void cmbAnio_SelectedIndexChanged(object sender, EventArgs e)
    {
        int intAnio = 0;
        dalTablero.TicketsEstadosAñosMesAgrupado _dal = new dalTablero.TicketsEstadosAñosMesAgrupado();

        int.TryParse(cmbAnio.SelectedValue, out intAnio);

        this.cmbMes.DataSource = _dal.Listar_Meses(intAnio);
        this.cmbMes.DataValueField = "CODIGO";
        this.cmbMes.DataTextField = "MES";
        this.cmbMes.DataBind();

        _dal = null;
    }
}
