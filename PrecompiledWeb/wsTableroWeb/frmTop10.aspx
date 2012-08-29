<%@ page language="C#" masterpagefile="~/frmPlantilla.master" autoeventwireup="true" inherits="frmTop10, App_Web_frmtop10.aspx.cdcab7d2" title="Reporte Top 10 Tickets" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="cphMaster" Runat="Server">
        <h1><asp:Label ID="lblTit" runat="server" Text="Top 10 Tickets"></asp:Label></h1>
        <hr />
        <table class="nostyle">
        <tbody>
            <tr>
                <td style="width: 120px">
                    Año y mes:</td>
                <td>
                    <asp:DropDownList ID="cmbAnio" runat="server" Width="84px" OnSelectedIndexChanged="cmbAnio_SelectedIndexChanged" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:DropDownList ID="cmbMes" runat="server" Width="200px">
                    </asp:DropDownList></td>
                <td style="width: 20px">
                </td>
                <td style="width: 120px">
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
        <hr />
        <div id="rep" style="vertical-align: middle; text-align: center">
            <rsweb:ReportViewer ID="rpvData" runat="server" ExportContentDisposition="AlwaysAttachment"
                Height="680px" PromptAreaCollapsed="True" ShowCredentialPrompts="False" ShowDocumentMapButton="False"
                ShowPageNavigationControls="False" ShowParameterPrompts="False" Width="100%">
            </rsweb:ReportViewer>
        </div>   
</asp:Content>
