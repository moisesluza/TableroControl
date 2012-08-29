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

public partial class frmEficaciaGrupo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!(Page.IsPostBack))
        {
            dalTablero.TicketsPorEstado _dal = new dalTablero.TicketsPorEstado();

            this.cmbAnio.DataSource = _dal.Listar_Anios();
            this.cmbAnio.DataTextField = "ANIO";
            this.cmbAnio.DataBind();

            this.cmbAnio.SelectedValue = Convert.ToString(DateTime.Now.Year);

            this.cmbMes.DataSource = _dal.Listar_Meses(this.cmbAnio.SelectedValue);
            this.cmbMes.DataValueField = "CODIGO";
            this.cmbMes.DataTextField = "MES";
            this.cmbMes.DataBind();

            this.cmbMes.SelectedValue = Convert.ToString(DateTime.Now.Month);

            this.cmbTip.DataSource = _dal.Listar_Tipos();
            this.cmbTip.DataTextField = "TIPO";
            this.cmbTip.DataBind();

            this.cmbGru.DataSource = _dal.Listar_Grupos();
            this.cmbGru.DataTextField = "GRUPO";
            this.cmbGru.DataBind();

            this.cmbAre.DataSource = _dal.Listar_Areas();
            this.cmbAre.DataTextField = "AREA";
            this.cmbAre.DataBind();

            this.cmbAre.Items.Insert(0,new ListItem("[TODOS]", "[TODOS]"));
            this.cmbGru.Items.Insert(0, new ListItem("[TODOS]", "[TODOS]"));
            this.cmbTip.Items.Insert(0, new ListItem("[TODOS]", "[TODOS]"));
            this.cmbMes.Items.Insert(0, new ListItem("[TODOS]", ""));
            
            _dal = null;
        }
    }
    protected void cmbAnio_SelectedIndexChanged(object sender, EventArgs e)
    {
        dalTablero.TicketsPorEstado _dal = new dalTablero.TicketsPorEstado();

        this.cmbMes.DataSource = _dal.Listar_Meses(this.cmbAnio.SelectedValue);
        this.cmbMes.DataValueField = "CODIGO";
        this.cmbMes.DataTextField = "MES";
        this.cmbMes.DataBind();
        this.cmbMes.Items.Insert(0, new ListItem("[TODOS]", ""));

        _dal = null;
    }
    protected void btnBus_Click(object sender, EventArgs e)
    {
        int intAnio = 0;
        int intMes = 0;

        if (!int.TryParse(cmbAnio.SelectedValue, out intAnio))
        {
            lblErr.Text = "El a�o seleccionado es incorrecto";
            return;
        }
        int.TryParse(cmbMes.SelectedValue, out intMes);

        System.Collections.Generic.List<ReportParameter> _parameters = new System.Collections.Generic.List<ReportParameter>();
        
        _parameters.Add(new ReportParameter("Tipo", this.cmbTip.SelectedIndex == 0 ? " " : this.cmbTip.Text));
        _parameters.Add(new ReportParameter("Grupo", this.cmbGru.SelectedIndex == 0 ? " " : this.cmbGru.Text));
        _parameters.Add(new ReportParameter("Area", this.cmbAre.SelectedIndex == 0 ? " " : this.cmbAre.Text));
        _parameters.Add(new ReportParameter("Anio", intAnio == 0 ? DateTime.Today.Year.ToString() : intAnio.ToString()));
        _parameters.Add(new ReportParameter("Mes", intMes == 0 ? null : intMes.ToString()));

        try
        {
            this.rpvData.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Remote;
            this.rpvData.ShowParameterPrompts = false;
            this.rpvData.ServerReport.ReportServerUrl = new Uri(ConfigurationManager.AppSettings["ReportServerUrl"]);
            this.rpvData.ServerReport.ReportPath = "/rptTablero/rptEficaciaGrupo";
            this.rpvData.ServerReport.SetParameters(_parameters);
            this.rpvData.ServerReport.Refresh();
            this.rpvData.Visible = true;
        }
        catch (Exception ex)
        {
            this.rpvData.Visible = false;
            this.lblErr.Text = ex.Message + "<br/>" + ex.StackTrace;
        }
    }  
}
