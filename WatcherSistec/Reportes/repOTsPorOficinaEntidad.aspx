<%@ Page Title="" Language="C#" MasterPageFile="~/General/Principal.Master" AutoEventWireup="true" CodeBehind="repOTsPorOficinaEntidad.aspx.cs" Inherits="WatcherSistec.Reportes.repOTsPorOficinaEntidad" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="fondoemergente" class="fondo">&nbsp;</div>
    <div>
        <table style="width:100%">
            <tr>
                <td class="CabeceraBusqueda">
                    &nbsp; Fichas por Oficina/Entidad
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
                                                                  <asp:TextBox ID="txtFechaIni" runat="server" ReadOnly="true" style="height:16px ;width:80px"></asp:TextBox>
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
                                                          <asp:UpdatePanel ID="UpdatePanel7" runat="server" UpdateMode="Conditional">
                                                              <ContentTemplate>
                                                                  <asp:TextBox ID="txtFechaFin" runat="server" ReadOnly="true" style="height:16px ;width:80px" ></asp:TextBox>
                                                              </ContentTemplate>
                                                          </asp:UpdatePanel>
                                                      </td>
                                                  </tr>
                                              </table>
                                          </fieldset>
                                      </td>
                                      <td style="width:30%">
                                          <fieldset>
                                              <table style="width:100%">
                                                  <tr>
                                                      <td class="Etiqueta">
                                                          Distribuidor
                                                      </td>
                                                      <td>
                                                          <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                              <ContentTemplate>
                                                                  <asp:TextBox ID="txtDealercode" runat="server" style="width:50px"></asp:TextBox>
                                                              </ContentTemplate>
                                                          </asp:UpdatePanel>
                                                      </td>
                                                      <td>
                                                          <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                                                              <ContentTemplate>
                                                                  <asp:TextBox ID="txtDealerName" runat="server" style="width:220px"></asp:TextBox>
                                                              </ContentTemplate>
                                                          </asp:UpdatePanel>
                                                          <asp:UpdatePanel ID="UpdatePanel14" runat="server">
                                                              <ContentTemplate>
                                                                  <asp:Button ID="btnBusCodDistribuidor" runat="server" Text="Button" style="display:none" />
                                                              </ContentTemplate>
                                                          </asp:UpdatePanel>
                                                      </td>
                                                      <td colspan="2">
                                                          <asp:UpdatePanel ID="UpdatePanel15" runat="server">
                                                              <ContentTemplate>
                                                                  <asp:ImageButton ID="btnPopupDistribuidor" runat="server" ImageUrl="../Images/search.png" CssClass="ImagenBotonBuscar" OnClientClick="mostrarEmergenteDealer('Buscar Distribuidor:',460,250);" />
                                                              </ContentTemplate>
                                                          </asp:UpdatePanel>
                                                      </td>
                                                  </tr>
                                                  <tr>
                                                      <td class="Etiqueta">
                                                          Abonado
                                                      </td>
                                                      <td>
                                                          <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                                                              <ContentTemplate>
                                                                  <asp:TextBox ID="txtCsid" runat="server" style="width:50px"></asp:TextBox>
                                                              </ContentTemplate>
                                                          </asp:UpdatePanel>
                                                      </td>
                                                      <td>
                                                          <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                                              <ContentTemplate>
                                                                  <asp:TextBox ID="txtSubscriberName" runat="server" style="width:220px"></asp:TextBox>
                                                              </ContentTemplate>
                                                          </asp:UpdatePanel>
                                                          <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                                                              <ContentTemplate>
                                                                  <asp:Button ID="btnBusCodAbonado" runat="server" Text="Button" style="display:none" />
                                                              </ContentTemplate>
                                                          </asp:UpdatePanel>
                                                      </td>
                                                      <td colspan="2">
                                                          <asp:UpdatePanel ID="UpdatePanel13" runat="server">
                                                              <ContentTemplate>
                                                                  <asp:ImageButton ID="btnPopupAbonado" runat="server" ImageUrl="../Images/search.png" CssClass="ImagenBotonBuscar" OnClientClick="mostrarPopupSubscriber('Buscar Oficinas:',810,480); " />
                                                              </ContentTemplate>
                                                          </asp:UpdatePanel>
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
                                        <asp:BoundField HeaderText="Fecha" DataField="Fecha_Registro" />
                                        <asp:BoundField HeaderText="Tipo. Mant" DataField="TipoMantenimiento" />
                                        <asp:BoundField HeaderText="Distribuidor" DataField="Dealer" />
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

    <div id="emergente" class="ventana">
        <div class="undraggable" style="width:100%;">
			<table style="width:100% ; border-spacing:0px 0px; ">
				<tr style="background: linear-gradient(#525252,black);" onmouseover="this.style.cursor='move'">
					<td style="width:100%; height:30px; text-align:center; font: bold 14px Tahoma;color:white;">&nbsp;&nbsp;
					<span id="titcabemergente">&nbsp;</span>&nbsp;&nbsp;</td>
					<td id="tdemergentecerrar" class="cerrar" style="width:24px; height:30px ; background-image:url('../Images/equis.png'); background-repeat:no-repeat; cursor:pointer; text-align:right" onclick="SalirPopupSubscriber();">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
			</table>
		</div>

        <div id="emergentecuerpo">
            <table style="width:100%"> 
                <tr>                                        
                    <td>
                        <div style="position:absolute;width:250px; height:20px;">
                            <table style="width:100%;">
                                <tr>
                                    <td class="EtiquetaPop">
                                       Oficina
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtBusOficina" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="EtiquetaPop">
                                        Distribuidor                                        
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtBusDistribuidor" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="EtiquetaPop">
                                        Dirección
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtBusDireccion" runat="server"></asp:TextBox>
                                    </td>
                                    <td>                                        
                                        <asp:UpdatePanel ID="UpdatePanel39" runat="server">
                                            <ContentTemplate>
                                                <asp:Button ID="btnBuscarSubscriber" runat="server" Width="70" Text="Buscar" Class="btn btn-primary" OnClick="btnBuscarSubscriber_Click"/></td>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>        
                            </table>                        
                            <table style="width:100%; height:200px">
                                <tr>
                                    <td style="vertical-align:top;width:100%;">
                                        <asp:UpdatePanel ID="UpdatePanel40" runat="server" >
                                            <ContentTemplate>
                                                <asp:GridView ID="gvSubscriber" runat="server" AllowPaging="True" CssClass="mGrid" AutoGenerateColumns="False" Width="800px" OnPageIndexChanging="gvSubscriber_PageIndexChanging" >
                                                    <Columns>                                    
                                                        <asp:BoundField HeaderText="Distribuidor" DataField="DealerName" />
                                                        <asp:BoundField HeaderText="Abonado" DataField="CSID" />
                                                        <asp:BoundField HeaderText="Oficina" DataField="SubscriberName" />
                                                        <asp:BoundField HeaderText="Dirección" DataField="AddressStreet" />    
                                                        <asp:BoundField HeaderText="DealerCode" DataField="DealerCode" >
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
                                        <asp:UpdatePanel ID="UpdatePanel41" runat="server">
                                            <ContentTemplate>
                                                <asp:Button ID="btnAceptarSubscriber" runat="server" Width="70" Text="Aceptar" Class="btn btn-primary" OnClick="btnAceptarSubscriber_Click" OnClientClick="SalirPopupSubscriber()"  /></td>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td style="width:80px">
                                    </td>    
                                    <td>
                                        <asp:Button ID="btnCancelarSubscriber" runat="server" Width="70" Text="Cancelar" Class="btn btn-primary" OnClientClick="SalirPopupSubscriber()" />                                        
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

    <div id="emerDealer" class="ventana">
        <div class="undraggable" style="width:100%;">
			<table style="width:100% ; border-spacing:0px 0px; ">
				<tr style="background: linear-gradient(#525252,black);" onmouseover="this.style.cursor='move'">
					<td style="width:100%; height:30px; text-align:center; font: bold 14px Tahoma;color:white;">&nbsp;&nbsp;
					<span id="titcabemerDealer">&nbsp;</span>&nbsp;&nbsp;</td>
					<td id="tdemerDealercerrar" class="cerrar" style="width:24px; height:30px ; background-image:url('../Images/equisx.png'); background-repeat:no-repeat; cursor:pointer; text-align:right" onclick="SalirEmergenteDealer();">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
			</table>
		</div>

        <div id="emerDealercuerpo">
            <table style="width:100%"> 
                <tr>                                        
                    <td>
                        <div style="width:100%;">
                            <table style="width:100%;">
                                <tr>
                                    <td class="EtiquetaPop">
                                        Distribuidor
                                    </td>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel47" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtDealer" runat="server" style="width:50px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel48" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtNameDealer" runat="server" style="width:220px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td>                                        
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                            <ContentTemplate>
                                                <asp:Button ID="btnBuscarDealer" runat="server" Width="70" Text="Buscar" Class="btn btn-primary" OnClick="btnBuscarDealer_Click" /></td>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>        
                            </table>                        
                            <table style="width:100%; height:125px">
                                <tr>
                                    <td style="vertical-align:top;width:100%;">
                                        
                                        <asp:UpdatePanel ID="UpdatePanel44" runat="server" >
                                            <ContentTemplate>
                                                <asp:GridView ID="gvDealer" runat="server" AllowPaging="True" CssClass="mGrid" AutoGenerateColumns="False" Width="100%" OnPageIndexChanging="gvDealer_PageIndexChanging">
                                                    <Columns>                                    
                                                        <asp:BoundField HeaderText="Codigo" DataField="DealerCode" />
                                                        <asp:BoundField HeaderText="Distriuidor" DataField="DealerName" />
                                                        <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" ButtonType="Image" SelectImageUrl="../Images/Select.png">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:CommandField>
                                                    </Columns>
                                                    
                                                    <EmptyDataTemplate>No existe(n) registro(s)</EmptyDataTemplate>
                                                    <FooterStyle BackColor="#CCCCCC" HorizontalAlign="Center" />
                                                    <HeaderStyle BackColor="Black" Font-Size="9pt"  ForeColor="White" />
                                                    <PagerSettings FirstPageText="l&lt;" LastPageText="&gt;l" Mode="NumericFirstLast" NextPageText="&gt;" PreviousPageText="&lt;" />
                                                    <PagerStyle BackColor="Black" ForeColor="white" HorizontalAlign="Center" Font-Bold="true" Font-Size="12pt"  />
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
                            <div style="margin-top:10px;margin-left:110px;">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel45" runat="server">
                                                <ContentTemplate>
                                                    <asp:Button ID="btnAceptar_Dealer" runat="server" Width="70" Text="Aceptar" Class="btn btn-primary" OnClientClick="SalirEmergenteDealer()" OnClick="btnAceptar_Dealer_Click"/></td>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                        <td style="width:80px">
                                        </td>    
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel46" runat="server">
                                                <ContentTemplate>
                                                    <asp:Button ID="btnCancelar_Dealer" runat="server" Width="70" Text="Cancelar" Class="btn btn-primary" OnClientClick="SalirEmergenteDealer()" />                                        
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

         $(document).ready(function () {
             $('#ContentPlaceHolder1_txtFechaIni').datepicker();
             $('#ContentPlaceHolder1_txtFechaFin').datepicker();
         });


         $(function () {
             $("#emergente").draggable({ handle: 'div.undraggable' });
             $("#emerDealer").draggable({ handle: 'div.undraggable' });
         });

         function mostrarPopupSubscriber(titulo, ancho, alto) {
             $("#tdemergentecerrar").show();
             $("#fondoemergente").css('display', 'block');
             $("#titcabemergente").html(titulo);
             mostrarCentrarDiv('emergente', ancho, alto);
         }

         function mostrarEmergenteDealer(titulo, ancho, alto) {
             $("#tdemerDealercerrar").show();
             $("#fondoemergente").css('display', 'block');
             $("#titcabemerDealer").html(titulo);
             mostrarCentrarDiv('emerDealer', ancho, alto);
         }

         function SalirPopupSubscriber() {
             $("#fondoemergente").hide();
             $("#emergente").hide();
         }

         function SalirEmergenteDealer() {
             $("#fondoemergente").hide();
             $("#emerDealer").hide();
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
         }

    </script>

 </asp:Content>

 