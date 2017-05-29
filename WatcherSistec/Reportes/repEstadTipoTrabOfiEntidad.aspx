<%@ Page Title="" Language="C#" MasterPageFile="~/General/Principal.Master" AutoEventWireup="true" CodeBehind="repEstadTipoTrabOfiEntidad.aspx.cs" Inherits="WatcherSistec.Reportes.repEstadTipoTrabOfiEntidad" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table style="width:100%">
            <tr>
                <td class="CabeceraBusqueda">
                    &nbsp; Reporte Estadistico - Tipo de Trabajo y Oficina/Entidad
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
                                <td style="width: 11%">
                                    <fieldset style="height:110px; margin-bottom:9px">
                                        <legend>
                                            Fechas
                                        </legend>
                                        <table id="tblCtrlFecha" style="margin-top:20px">
                                            <tr>
                                                <td class="Etiqueta">Desde</td>
                                                <td style="text-align:right">
                                                    <asp:UpdatePanel ID="UpdatePanel22" runat="server">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtFechaIni" runat="server" ReadOnly="true" style="height:16px ;width:80px"></asp:TextBox>
                                                            <asp:CalendarExtender ID="txtFechaIni_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtFechaIni" Format="dd/MM/yyyy">
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
                                                    <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtFechaFin" runat="server" ReadOnly="true" style="height:16px ;width:80px" ></asp:TextBox>
                                                            <asp:CalendarExtender ID="txtFechaFin_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtFechaFin" Format="dd/MM/yyyy">
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
                                                        <asp:UpdatePanel ID="UpdatePanel42" runat="server">
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
                                <td>
                                    <fieldset style="height: 103px;">
                                        <table style="width:100%;margin-top:33px">
                                            <tr>
                                                <td class="Etiqueta">
                                                    Proveedor
                                                </td>
                                                <td>
                                                    <asp:UpdatePanel ID="UpdatePanel18" runat="server">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtProveedor" runat="server" style="width:50px"></asp:TextBox>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                                <td>
                                                    <asp:UpdatePanel ID="UpdatePanel19" runat="server">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtProveName" runat="server" style="width:220px"></asp:TextBox>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                    <asp:UpdatePanel ID="UpdatePanel20" runat="server">
                                                        <ContentTemplate>
                                                            <asp:Button ID="btnBusCodProveedor" runat="server" Text="Button" style="display:none" />
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                                <td colspan="2">
                                                    <asp:UpdatePanel ID="UpdatePanel21" runat="server">
                                                        <ContentTemplate>
                                                            <asp:ImageButton ID="btnPopupProveedor" runat="server" ImageUrl="../Images/search.png" CssClass="ImagenBotonBuscar" OnClientClick="mostrarEmergenteProv('Buscar Proveedor:',400,250); " />
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
                                                            <asp:ImageButton ID="btnExportar" ToolTip="Exportar" runat="server" ImageUrl="../Images/excel.png" CssClass="ImagenBoton"/>
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
                                        <asp:BoundField HeaderText="Proveedor" DataField="ProvName" />
                                        <asp:BoundField HeaderText="Tipo de Mantenimiento" DataField="TipoMantenimiento" />
                                        <asp:BoundField HeaderText="Trabajos x Tipo Mant" DataField="TxTman" />
                                        <asp:BoundField HeaderText="Trabajos x Entidad" DataField="Total" />
                                        <asp:BoundField HeaderText="%(Tipo/Entidad)" DataField="PORCENTAJE" />
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

    <div id="emerProv" class="ventana">
        <div class="undraggable" style="width:100%;">
			<table style="width:100% ; border-spacing:0px 0px; ">
				<tr style="background: linear-gradient(#525252,black);" onmouseover="this.style.cursor='move'">
					<td style="width:100%; height:30px; text-align:center; font: bold 14px Tahoma;color:white;">&nbsp;&nbsp;
					<span id="titcabemerProv">&nbsp;</span>&nbsp;&nbsp;</td>
					<td id="tdemerProvcerrar" class="cerrar" style="width:24px; height:30px ; background-image:url('../Images/equisx.png'); background-repeat:no-repeat; cursor:pointer; text-align:right" onclick="SalirEmergenteProveedor();">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
			</table>
		</div>

        <div id="emerProvcuerpo">
            <table style="width:100%"> 
                <tr>                                        
                    <td>
                        <div style="width:100%;">
                            <table style="width:100%;">
                                <tr>
                                    <td class="EtiquetaPop">
                                        Proveedor
                                    </td>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel58" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtProvName" runat="server" style="width:220px"></asp:TextBox>
                                                <asp:TextBox ID="txtFondo" runat="server" style="display:none"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td>                                        
                                        <asp:UpdatePanel ID="UpdatePanel59" runat="server">
                                            <ContentTemplate>
                                                <asp:Button ID="btnBuscarProv" runat="server" Width="70" Text="Buscar" Class="btn btn-primary" OnClick="btnBuscarProv_Click"/></td>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>        
                            </table>                        
                            <table style="width:100%; height:125px">
                                <tr>
                                    <td style="vertical-align:top;width:100%;">
                                        
                                        <asp:UpdatePanel ID="UpdatePanel60" runat="server" >
                                            <ContentTemplate>
                                                <asp:GridView ID="gvProveedor" runat="server" AllowPaging="True" CssClass="mGrid" AutoGenerateColumns="False" Width="100%" OnPageIndexChanging="gvProveedor_PageIndexChanging">
                                                    <Columns>                                    
                                                        <asp:BoundField HeaderText="Codigo" DataField="Codigo" />
                                                        <asp:BoundField HeaderText="Proveedor" DataField="Proveedor" />
                                                        <asp:BoundField HeaderText="RUC" DataField="RUC" />
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
                            <div style="margin-top:8px;margin-left:85px;">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel61" runat="server">
                                                <ContentTemplate>
                                                    <asp:Button ID="btnAceptar_Prov" runat="server" Width="70" Text="Aceptar" Class="btn btn-primary" OnClientClick="SalirEmergenteProveedor()" OnClick="btnAceptar_Prov_Click"/></td>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                        <td style="width:80px">
                                        </td>    
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel62" runat="server">
                                                <ContentTemplate>
                                                    <asp:Button ID="btnCancelar_Prov" runat="server" Width="70" Text="Cancelar" Class="btn btn-primary" OnClientClick="SalirEmergenteProveedor()" />                                        
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

    <script>

        $(function () {
            $("#emerProv").draggable({ handle: 'div.undraggable' });
        });

        function mostrarEmergenteProv(titulo, ancho, alto) {
            $("#tdemerProvcerrar").show();
            $("#fondoemergente").css('display', 'block');
            $("#titcabemerProv").html(titulo);
            mostrarCentrarDiv('emerProv', ancho, alto);
        }

        function SalirEmergenteProveedor() {
            $("#fondoemergente").hide();
            $("#emerProv").hide();
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

        function Limpiar() {

            document.getElementById('ContentPlaceHolder1_txtDealercode').value = "";
            document.getElementById('ContentPlaceHolder1_txtDealerName').value = "";
            document.getElementById('ContentPlaceHolder1_txtCsid').value = "";
            document.getElementById('ContentPlaceHolder1_txtSubscriberName').value = "";
            document.getElementById('ContentPlaceHolder1_txtProveedor').value = "";
            document.getElementById('ContentPlaceHolder1_txtProveName').value = "";
            document.getElementById('ContentPlaceHolder1_txtTecnico').value = "";
            document.getElementById('ContentPlaceHolder1_txtTecName').value = "";
        }
    </script>

</asp:Content>  