<%@ Page Language="C#" MasterPageFile="~/frmPlantilla.master" AutoEventWireup="true" CodeFile="frmHistorial.aspx.cs" Inherits="frmHistorial" Title="Reporte Historial de Atenciones" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="cphMaster" Runat="Server">
    
        <h1>Hist�rico de Atenciones por Grupo Resultor</h1>
        <hr />
        <table class="nostyle">
        <tbody>
            <tr>
                <td style="width: 120px">
                    A�o y mes:</td>
                <td>
                    <asp:DropDownList ID="cmbAnio" runat="server" Width="84px" AutoPostBack="true" OnSelectedIndexChanged="cmbAnio_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:DropDownList ID="cmbMes" runat="server" Width="120px">
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td style="width: 120px">
                    Tipo:</td>
                <td>
                    <asp:DropDownList ID="cmbTip" runat="server" Width="288px">
                    </asp:DropDownList></td>
            </tr>
            <tr><td>�rea de Usuario:</td><td><asp:DropDownList ID="cmbAre" runat="server" Width="288px"></asp:DropDownList></td>
            </tr>
        </tbody>
    </table>
        <asp:Button ID="btnBus" runat="server" OnClick="btnBus_Click" Text="Generar reporte" CssClass="input-submit" />
        <br />
        <asp:Label ID="lblErr" runat="server" EnableViewState="False" Font-Bold="True" ForeColor="Red"></asp:Label>
        <hr />
        <div id="rep">
            <rsweb:ReportViewer ID="rpvData" runat="server" ExportContentDisposition="AlwaysAttachment"
                Height="530px" PromptAreaCollapsed="True" ShowCredentialPrompts="False" ShowDocumentMapButton="False"
                ShowPageNavigationControls="False" ShowParameterPrompts="False" Width="100%">
            </rsweb:ReportViewer>
        </div>
        
</asp:Content>

