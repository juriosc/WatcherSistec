<%@ Page Title="" Language="C#" MasterPageFile="~/General/Principal.Master" AutoEventWireup="true" CodeBehind="repEstadSalidasNoReportadas.aspx.cs" Inherits="WatcherSistec.Reportes.repEstadSalidasNoReportadas" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="fondoemergente" class="fondo">&nbsp;</div>
    <div>
        <table style="width:100%">
            <tr>
                <td class="CabeceraBusqueda">
                    &nbsp; Reporte Estadistico - Salidas No Reportadas
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
                                    <fieldset style="height: 64px; margin-bottom:9px">
                                        <legend>
                                            Fechas
                                        </legend>
                                        <table id="tblCtrlFecha">
                                            <tr>
                                                <td class="Etiqueta">Desde</td>
                                                <td style="text-align:right">
                                                    <asp:UpdatePanel ID="UpdatePanel22" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtFechaIni" runat="server" style="height:16px ;width:80px"></asp:TextBox>
                                                            <asp:CalendarExtender ID="txtFechaIni_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtFechaIni" Format="dd/MM/yyyy">
                                                            </asp:CalendarExtender>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="btnLimpiar" EventName="Click" />
                                                        </Triggers>
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
                                                    <asp:UpdatePanel ID="UpdatePanel7" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtFechaFin" runat="server" style="height:16px ;width:80px" ></asp:TextBox>
                                                            <asp:CalendarExtender ID="txtFechaFin_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtFechaFin" Format="dd/MM/yyyy">
                                                            </asp:CalendarExtender>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="btnLimpiar" EventName="Click" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </td>
                                <td>
                                    <fieldset style="height: 56px;">
                                        <table style="width:100%;margin-top:12px">
                                            <tr>
                                                <td class="Etiqueta">
                                                    Técnico
                                                </td>
                                                <td>
                                                    <asp:UpdatePanel ID="UpdatePanel25" runat="server">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtTecName" runat="server" style="width:220px"></asp:TextBox>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                    <asp:UpdatePanel ID="UpdatePanel23" runat="server">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtTecnico" runat="server" style="display:none"></asp:TextBox>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                                <td colspan="2">
                                                    <asp:UpdatePanel ID="UpdatePanel29" runat="server">
                                                        <ContentTemplate>
                                                            <asp:ImageButton ID="btnPopupTecnico" runat="server" ImageUrl="../Images/search.png" CssClass="ImagenBotonBuscar" OnClientClick="mostrarEmergenteTecnico('Buscar Tecnico:',810,480); " />
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                                <td style="width:150px"></td>
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
                                <td style="width:45%"></td>
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
                                        <asp:BoundField HeaderText="Proveedor" DataField="ProvName" />
                                        <asp:BoundField HeaderText="Técnico" DataField="Nombres" />
                                        <asp:BoundField HeaderText="Total Trabajos x Tecnicos" DataField="Total" />
                                        <asp:BoundField HeaderText="Salida no Reportadas x Técnico" DataField="TxtMan" />
                                    </Columns>
                                
                                    <EmptyDataTemplate>No existe(n) registro(s)</EmptyDataTemplate>
                                    <FooterStyle BackColor="#CCCCCC" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="Black" Font-Size="9pt"  ForeColor="White" />
                                    <PagerSettings FirstPageText="l&lt;" LastPageText="&gt;l" Mode="NumericFirstLast" NextPageText="&gt;" PreviousPageText="&lt;" />
                                    <PagerStyle BackColor="Black" ForeColor="white" HorizontalAlign="Center" Font-Bold="true" Font-Size="8pt"  />
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
    <div id="emerTecnico" class="ventana">
        <div class="undraggable" style="width:100%;">
			<table style="width:100% ; border-spacing:0px 0px; ">
				<tr style="background: linear-gradient(#525252,black);" onmouseover="this.style.cursor='move'">
					<td style="width:100%; height:30px; text-align:center; font: bold 14px Tahoma;color:white;">&nbsp;&nbsp;
					<span id="titcabemerTecnico">&nbsp;</span>&nbsp;&nbsp;</td>
					<td id="tdemerTecnicocerrar" class="cerrar" style="width:24px; height:30px ; background-image:url('../Images/equis.png'); background-repeat:no-repeat; cursor:pointer; text-align:right" onclick="SalirEmergenteTecnico();">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
			</table>
		</div>

        <div id="emerTecnicocuerpo">
            <table style="width:100%"> 
                <tr>                                        
                    <td>
                        <div style="position:absolute;width:250px; height:20px;">
                            <table style="width:100%;">
                                <tr>
                                    <td class="EtiquetaPop">
                                       Proveedor
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtProv" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="EtiquetaPop">
                                        Tecnico                                        
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtNameTecnico" runat="server"></asp:TextBox>
                                        <asp:TextBox ID="txtFondo1" runat="server" style="display:none"></asp:TextBox>
                                    </td>
                                    <td>                                        
                                        <asp:UpdatePanel ID="UpdatePanel63" runat="server">
                                            <ContentTemplate>
                                                <asp:Button ID="btnBuscarTecnico" runat="server" Width="70" Text="Buscar" Class="btn btn-primary" OnClick="btnBuscarTecnico_Click"/></td>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>        
                            </table>                        
                            <table style="width:100%; height:200px">
                                <tr>
                                    <td style="vertical-align:top;width:100%;">
                                        <asp:UpdatePanel ID="UpdatePanel64" runat="server" >
                                            <ContentTemplate>
                                                <asp:GridView ID="gvTecnico" runat="server" AllowPaging="True" CssClass="mGrid" AutoGenerateColumns="False" Width="800px" OnPageIndexChanging="gvTecnico_PageIndexChanging">
                                                    <Columns>                                    
                                                        <asp:BoundField HeaderText="Proveedor" DataField="sProveedorName" />
                                                        <asp:BoundField HeaderText="DNI" DataField="sDocumento" />
                                                        <asp:BoundField HeaderText="Nombres" DataField="Nombres" />
                                                        <asp:BoundField HeaderText="PersonalID" DataField="PersonalID" >
                                                            <HeaderStyle CssClass="ColumnaOculta" />
                                                            <ItemStyle CssClass="ColumnaOculta" />
                                                        </asp:BoundField>
                                                        <asp:BoundField HeaderText="ProveedorID" DataField="ProveedorID" >
                                                            <HeaderStyle CssClass="ColumnaOculta" />
                                                            <ItemStyle CssClass="ColumnaOculta" />
                                                        </asp:BoundField>
                                                        <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" ButtonType="Image" SelectImageUrl="../Images/Select.png">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:CommandField>
                                                    </Columns>
                                                    
                                                    <EmptyDataTemplate>No existe(n) registro(s)</EmptyDataTemplate>
                                                    <FooterStyle BackColor="#CCCCCC" HorizontalAlign="Center" />
                                                    <HeaderStyle BackColor="Black" Font-Size="9pt"  ForeColor="White" />
                                                    <PagerSettings FirstPageText="l&lt;" LastPageText="&gt;l" Mode="NumericFirstLast" NextPageText="&gt;" PreviousPageText="&lt;" />
                                                    <PagerStyle BackColor="Black" ForeColor="white" HorizontalAlign="Center" Font-Bold="true" Font-Size="8pt"  />
                                                    <RowStyle BackColor="White" Font-Size="8pt" />
                                                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
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
                            <div style="position:absolute;width:250px; height:20px;top:50%;left:63%;margin-top:400px;margin-left:120px;">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel66" runat="server">
                                                <ContentTemplate>
                                                    <asp:Button ID="btnAceptarTec" runat="server" Width="70" Text="Aceptar" Class="btn btn-primary" OnClientClick="SalirEmergenteTecnico()" OnClick="btnAceptarTec_Click"/></td>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                        <td style="width:80px">
                                        </td>    
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel67" runat="server">
                                                <ContentTemplate>
                                                    <asp:Button ID="btnCancelarTec" runat="server" Width="70" Text="Cancelar" Class="btn btn-primary" OnClientClick="SalirEmergenteTecnico()" />                                        
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            
                        </div>
                    </td>
                </tr>
            </table>
         </div>
    </div>

    <script type="text/javascript">
        
        $(function () {
            $("#emerTecnico").draggable({ handle: 'div.undraggable' });
        });

        function mostrarEmergenteTecnico(titulo, ancho, alto) {
            $("#tdemerTecnicocerrar").show();
            $("#fondoemergente").css('display', 'block');
            $("#titcabemerTecnico").html(titulo);
            mostrarCentrarDiv('emerTecnico', ancho, alto);
        }

        function SalirEmergenteTecnico() {
            $("#fondoemergente").hide();
            $("#emerTecnico").hide();
        }

        function Limpiar() {

            document.getElementById('ContentPlaceHolder1_txtTecnico').value = "";
            document.getElementById('ContentPlaceHolder1_txtTecName').value = "";
        }

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
