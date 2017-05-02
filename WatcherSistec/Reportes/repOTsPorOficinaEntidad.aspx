<%@ Page Title="" Language="C#" MasterPageFile="~/General/Principal.Master" AutoEventWireup="true" CodeBehind="repOTsPorOficinaEntidad.aspx.cs" Inherits="WatcherSistec.Reportes.repOTsPorOficinaEntidad" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>

     <table style="width:100%">
           <tr>
                <td class="CabeceraBusqueda">
                    &nbsp; DATOS DE BUSQUEDA:
                </td>
            </tr>
       </table> 
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
           <td style="width:30%">
                    <fieldset style="height:104px">
                        <table style="width:80%; margin-top:10px">
                             <tr>
                                <td class="Etiqueta">
                                    Proveedor
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel18" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txtProveedor" runat="server" style="width:50px"></asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel19" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txtProveName" runat="server" style="width:220px"></asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <asp:UpdatePanel ID="UpdatePanel20" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Button ID="btnBusCodProveedor" runat="server" Text="Button" style="display:none" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                                <td colspan="2">
                                    <asp:UpdatePanel ID="UpdatePanel21" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:ImageButton ID="btnPopupProveedor" runat="server" ImageUrl="../Images/search.png" CssClass="ImagenBotonBuscar" OnClientClick="mostrarPopupSubscriber('Buscar Oficinas:',810,480); " />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                                <tr>
                                <td class="Etiqueta">
                                    Técnico
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel23" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txtTecnico" runat="server" style="width:50px"></asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel25" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txtTecName" runat="server" style="width:220px"></asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <asp:UpdatePanel ID="UpdatePanel26" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Button ID="btnBusCodTecnico" runat="server" Text="Button" style="display:none" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                                <td colspan="2">
                                    <asp:UpdatePanel ID="UpdatePanel29" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:ImageButton ID="btnPopupTecnico" runat="server" ImageUrl="../Images/search.png" CssClass="ImagenBotonBuscar" OnClientClick="mostrarPopupSubscriber('Buscar Oficinas:',810,480); " />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>

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
                                    <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:ImageButton ID="btnNuevo" ToolTip="Nuevo" runat="server" ImageUrl="../Images/Mantenimiento/new_16.ico" CssClass="ImagenBoton" OnClick="btnNuevo_Click"/>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>                                                
                                </td>
                            </tr>
                        </table>
                     </fieldset>
                </td>                  
                                                       
                           
                         
    </div>
    <div>
        <fieldset style="padding:0 0 0 0">
            <table style="width:100%">
                <tr>
                    <td style="text-align:center;">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvSupervisiones"  runat="server" CssClass="mGrid" AutoGenerateColumns="False" CellPadding="4" CellSpacing="2" AllowPaging="True" PageSize="30" OnPageIndexChanging="gvSupervisiones_PageIndexChanging" ShowHeaderWhenEmpty="True" OnRowCommand="gvSupervisiones_RowCommand">
                                    <Columns>
                                        <asp:BoundField HeaderText="Fecha" DataField="Fecha" />
                                        <asp:BoundField HeaderText="Cod_Entidad" DataField="Cod_Entidad" />
                                        <asp:BoundField HeaderText="Entidad" DataField="Entidad" />
                                        <asp:BoundField HeaderText="Cod_Abonado" DataField="Cod_Abonado" />
                                        <asp:BoundField HeaderText="Nombre_Oficina" DataField="Nombre_Oficina" />
                                        <asp:BoundField HeaderText="Cod_Prov" DataField="Cod_Prov" />
                                        <asp:BoundField HeaderText="Proveedor" DataField="Proveedor" />
                                        <asp:BoundField HeaderText="Cod_Tecnico" DataField="Cod_Tecnico" />
                                        <asp:BoundField HeaderText="Tecnico" DataField="Tecnico" />
                                        <asp:BoundField HeaderText="Fecha/Hora Ingreso" DataField="Fecha/Hora Ingreso" />
                                        <asp:BoundField HeaderText="Fecha/Hora Salida" DataField="Fecha/Hora Salida" />
                                        <asp:BoundField HeaderText="Hora(s)" DataField="Hora(s)" />
                                        <asp:BoundField HeaderText="Minuto(s)" DataField="Minuto(s)" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="btnVer" runat="server" ImageUrl="~/Images/Mantenimiento/view.png" CommandName="Ver" ToolTip="VER"
                                                    CausesValidation="false" CommandArgument="<%# ((GridViewRow)Container).RowIndex %>" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="btnModificar" runat="server" ImageUrl="../Images/Mantenimiento/modify_16.ico" CommandName="Modificar" ToolTip="MODIFICAR" 
                                                    CausesValidation="false" CommandArgument="<%# ((GridViewRow)Container).RowIndex %>" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
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
             $("#emerLocalSubscriber").draggable({ handle: 'div.undraggable' });
         });

         function mostrarPopupSubscriber(titulo, ancho, alto) {
             $("#tdemergentecerrar").show();
             $("#fondoemergente").css('display', 'block');
             $("#titcabemergente").html(titulo);
             mostrarCentrarDiv('emergente', ancho, alto);
         }

         function SalirPopupSubscriber() {
             $("#fondoemergente").hide();
             $("#emergente").hide();
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

 