<%@ Page Language="C#"  MasterPageFile="~/frmPlantilla.master" AutoEventWireup="true" CodeFile="frmEficaciaGrupo.aspx.cs" Inherits="frmEficaciaGrupo" Title="Reporte Eficacia por Grupo" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="cphMaster" Runat="Server">
        <h1>Eficacia por Grupo Solucionador</h1>
        <hr />
        <table class="nostyle">
        <tbody>
            <tr>
                <td >
                    Año y mes:</td>
                <td>
                    <asp:DropDownList ID="cmbAnio" runat="server" Width="84px" OnSelectedIndexChanged="cmbAnio_SelectedIndexChanged" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:DropDownList ID="cmbMes" runat="server" Width="120px">
                    </asp:DropDownList></td>
                <td >
                </td>
                <td >
                    Tipo:</td>
                <td>
                    <asp:DropDownList ID="cmbTip" runat="server" Width="288px">
                    </asp:DropDownList></td>
            </tr>
            <tr><td>Área de Usuario:</td><td><asp:DropDownList ID="cmbAre" runat="server" Width="288px"></asp:DropDownList></td>
                <td>
                </td>
                <td>
                    Grupo:</td>
                <td>
                    <asp:DropDownList ID="cmbGru" runat="server" Width="288px"></asp:DropDownList></td>
            </tr>
        </tbody>
    </table>
        <asp:Button ID="btnBus" runat="server" OnClick="btnBus_Click" Text="Generar reporte" CssClass="input-submit" />
        <br />
        <asp:Label ID="lblErr" runat="server" EnableViewState="False" Font-Bold="True" ForeColor="Red"></asp:Label>
        <hr />
        <div id="rep">
            <rsweb:ReportViewer ID="rpvData" runat="server" ExportContentDisposition="AlwaysAttachment"
                Height="680px" PromptAreaCollapsed="True" ShowCredentialPrompts="False" ShowDocumentMapButton="False"
                ShowPageNavigationControls="False" ShowParameterPrompts="False" Width="100%">
            </rsweb:ReportViewer>
        </div>   
</asp:Content>
