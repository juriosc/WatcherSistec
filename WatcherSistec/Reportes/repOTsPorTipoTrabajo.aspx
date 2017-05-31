<%@ Page Title="" Language="C#" MasterPageFile="~/General/Principal.Master" AutoEventWireup="true" CodeBehind="repOTsPorTipoTrabajo.aspx.cs" Inherits="WatcherSistec.Reportes.repOTsPorTipoTrabajo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table style="width:100%">
            <tr>
                <td class="CabeceraBusqueda">
                    &nbsp; Fichas por Tipo de Trabajo
                </td>
            </tr>
        </table>

        <table style="width:100%">
            <tr>
                <td>
                    <fieldset>
                        <legend>
                            OPCIONES DE BUSQUEDA :
                        </legend>
                        <table style="width:100%">
                            <tr>
                                <td style="width:11%">
                                    <fieldset style="height: 110px; margin-bottom:9px">
                                        <legend>
                                            Fechas
                                        </legend>
                                        <table id="tblCtrlFecha" style="margin-top:20px">
                                            <tr>
                                                <td class="Etiqueta">Desde</td>
                                                <td style="text-align:right">
                                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtFechaDesde" runat="server" style="height:16px ;width:80px"></asp:TextBox>
                                                            <asp:CalendarExtender ID="txtFechaDesde_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtFechaDesde" Format="dd/MM/yyyy">
                                                            </asp:CalendarExtender>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="font-size:3px;">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Etiqueta">Hasta</td>
                                                <td style="text-align:right">
                                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtFechaHasta" runat="server" style="height:16px ;width:80px"></asp:TextBox>
                                                            <asp:CalendarExtender ID="txtFechaHasta_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtFechaHasta" Format="dd/MM/yyyy">
                                                            </asp:CalendarExtender>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </td>
                                <td style="width:40%">
                                    <fieldset style="padding-top: 0em;padding-bottom: 0em;height: 125px;">
                                        <table style="width:100%; height:100%">
                                            <tr>
                                                <td>
                                                    <div>
                                                        <table class="CabeceraScroll" style="background-color:black; font-size:11px; color:white; width:100%">
                                                            <tr>
                                                                <td>
                                                                    Tipo Mantenimiento
                                                                </td>
                                                                <td>

                                                                </td>
                                                                <td style="text-align:right;padding-right:16px;">
                                                                    <asp:UpdatePanel ID="UpdatePanel76" runat="server">
                                                                        <ContentTemplate>
                                                                            <asp:CheckBox ID="chkSeleccion" runat="server" AutoPostBack="True" OnCheckedChanged="chkSeleccion_CheckedChanged" />
                                                                        </ContentTemplate>
                                                                    </asp:UpdatePanel>
                                                                </td>
                                                            </tr>
                                                        </table>           
                                                    </div>
                                                    <div style="height:65px; overflow:auto">
                                                        <asp:UpdatePanel ID="UpdatePanel42" runat="server" >
                                                            <ContentTemplate>
                                                                <asp:GridView ID="gvTipoMantenimiento" runat="server" AutoGenerateColumns="False" CellPadding="4" onpageindexchanging="gvTipoMantenimiento_PageIndexChanging" SkinID="gvwBusqueda" CssClass="mGrid" ShowHeader="False" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" ForeColor="Black" GridLines="Horizontal" >
                                                                    <Columns>
                                                                        <asp:BoundField DataField="TipoMant_ID" HeaderText="Codigo" >
                                                                            <HeaderStyle BackColor="Silver" CssClass="ColumnaOculta" />
                                                                            <ItemStyle CssClass="ColumnaOculta" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="TipoMant_Des" HeaderText="Tipo Mantenimiento" >
                                                                            <HeaderStyle BackColor="Silver" />
                                                                        </asp:BoundField>
                                                                        <asp:TemplateField HeaderText="...">
                                                                            <ItemTemplate>
                                                                                <asp:CheckBox ID="chkSel" runat="server" />
                                                                            </ItemTemplate>
                                                                            <HeaderStyle BackColor="Silver" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <FooterStyle BackColor="#CCCC99" HorizontalAlign="Center" ForeColor="Black" />
                                                                    <HeaderStyle BackColor="#333333" Font-Size="9pt"  ForeColor="White" Font-Bold="True"  />
                                                                    <PagerSettings FirstPageText="l&lt;" LastPageText="&gt;l" NextPageText="&gt;" PreviousPageText="&lt;" />
                                                                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" Font-Size="8pt"  />
                                                                    <RowStyle Font-Size="8pt" />
                                                                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                                                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                                                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                                                    <SortedDescendingHeaderStyle BackColor="#242121" />
                                                                </asp:GridView>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </td>
                                <td style="padding-left:15%">
                                    <fieldset style="width:50px">
                                        <table style="width:100%">
                                            <tr>
                                                <td>
                                                    <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                                                        <ContentTemplate>
                                                            <asp:ImageButton ID="btnLimpiar" runat="server" ImageUrl="../Images/Limpiar.png" CssClass="ImagenBoton" OnClientClick="Limpiar();" />
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                                <td>
                                                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                        <ContentTemplate>
                                                            <asp:ImageButton ID="btnBuscar" runat="server" ImageUrl="../Images/binocular.png" CssClass="ImagenBoton" OnClick="btnBuscar_Click"/>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                                <td>
                                                    <asp:UpdatePanel ID="UpdatePanel6" runat="server" >
                                                        <ContentTemplate>
                                                            <asp:ImageButton ID="btnExportar" ToolTip="Exportar" runat="server" ImageUrl="../Images/excel.png" CssClass="ImagenBoton" OnClick="btnExportar_Click"/>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>                                                
                                                </td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
            </tr>
        </table>
    </div>
    
    <div>
        <fieldset style="padding:0 0 0 0">
            <table style="width:100%">
                <tr>
                    <td style="text-align:center;">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvReporte" Width="100%" runat="server" CssClass="mGrid" AutoGenerateColumns="False" CellPadding="4" CellSpacing="2" AllowPaging="True" PageSize="30" OnPageIndexChanging="gvReporte_PageIndexChanging" ShowHeaderWhenEmpty="True">
                                    <Columns>
                                        <asp:BoundField HeaderText="Fecha" DataField="Fecha_Registro" />
                                        <asp:BoundField HeaderText="Tipo. Mant" DataField="TipoMantenimiento" />
                                        <asp:BoundField HeaderText="Distribuidor" DataField="DealerName" />
                                        <asp:BoundField HeaderText="Abonado" DataField="CSID" />
                                        <asp:BoundField HeaderText="Oficina" DataField="SubscriberName" />
                                        <asp:BoundField HeaderText="Proveedor" DataField="ProvName" />
                                        <asp:BoundField HeaderText="Tecnico" DataField="Nombres" />
                                        <asp:BoundField HeaderText="Usuario" DataField="Usuario" />
                                        <asp:BoundField HeaderText="Observaciones" DataField="Observaciones" />
                                    </Columns>
                                
                                    <EmptyDataTemplate>No existe(n) registro(s)</EmptyDataTemplate>
                                    <FooterStyle BackColor="#CCCCCC" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="Black" Font-Size="9pt"  ForeColor="White" />
                                    <PagerSettings FirstPageText="l&lt;" LastPageText="&gt;l" Mode="NumericFirstLast" NextPageText="&gt;" PreviousPageText="&lt;" />
                                    <PagerStyle BackColor="Black" ForeColor="white" HorizontalAlign="Center" Font-Bold="true" Font-Size="12pt"  />
                                    <RowStyle BackColor="White" Font-Size="8pt" />
                                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                    <SortedAscendingHeaderStyle BackColor="#808080" />
                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                    <SortedDescendingHeaderStyle BackColor="#383838" />
                                
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
    <script type="text/javascript">

        $(function () {
            $("#emergente").draggable({ handle: 'div.undraggable' });
        });

        function mostrarCentrarDiv(iddiv, w, h) {
            var striddiv = "#" + iddiv;
            var width = w + "px";
            var height = h + "px";
            var mleft = "-" + (w / 2) + "px";
            var mtop = "-" + (h / 2) + "px";
            $(striddiv).css({ 'width': width, 'height': height, 'left': '50%', 'top': '50%', 'margin-left': mleft, 'margin-top': mtop });
            $(striddiv).css('display', 'block');
        }

    </script>


</asp:Content>
 