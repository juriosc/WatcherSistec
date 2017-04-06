<%@ Page Title="" Language="C#" MasterPageFile="~/General/Principal.Master" AutoEventWireup="true" CodeBehind="RegSupervision.aspx.cs" Inherits="WatcherSistec.Control_Tecnico.RegSuperVision" %>
<%@ MasterType VirtualPath="~/General/Principal.master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .ColumnaOculta {display:none;}
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="fondoemergente" class="fondo">&nbsp;</div>
    <div>
        <table style="width:100%">
            <tr>
                <td class="CabeceraBusqueda">
                    &nbsp; OPCIONES DE BUSQUEDA :
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
                <td style="width:27%">
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
                                            </tr>
                                        </table>
                                                    
                                    </div>
                                    <div style="height:65px; overflow:auto">
                                        <asp:UpdatePanel ID="UpdatePanel42" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:GridView ID="gvTipoMantenimiento" runat="server" AutoGenerateColumns="False" CellPadding="4" CellSpacing="2" onpageindexchanging="gvTipoMantenimiento_PageIndexChanging" SkinID="gvwBusqueda" CssClass="mGrid" ShowHeader="False" >
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="...">
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkSel" runat="server" />
                                                            </ItemTemplate>
                                                            <HeaderStyle BackColor="Silver" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="TipoMant_ID" HeaderText="Codigo" >
                                                            <HeaderStyle BackColor="Silver" CssClass="ColumnaOculta" />
                                                            <ItemStyle CssClass="ColumnaOculta" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="TipoMant_Des" HeaderText="Tipo Mantenimiento" >
                                                            <HeaderStyle BackColor="Silver" />
                                                        </asp:BoundField>
                                                    </Columns>
                                                    <FooterStyle BackColor="#CCCCCC" HorizontalAlign="Center" />
                                                    <HeaderStyle BackColor="Black" Font-Size="9pt"  ForeColor="White"  />
                                                    <PagerSettings FirstPageText="l&lt;" LastPageText="&gt;l" Mode="NumericFirstLast" NextPageText="&gt;" PreviousPageText="&lt;" />
                                                    <PagerStyle BackColor="Black" ForeColor="White" HorizontalAlign="Center" Font-Bold="True" Font-Size="8pt"  />
                                                    <RowStyle BackColor="White" Font-Size="8pt" />
                                                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                    <SortedAscendingHeaderStyle BackColor="Gray" />
                                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                    <SortedDescendingHeaderStyle BackColor="#383838" />
                                                </asp:GridView>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnBuscar" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table style="width:100%">
                                        <tr>
                                            <td style="width:85%">
                                                <asp:Button ID="btnMarcar" runat="server" Text="Marcar Todos" CssClass="btn btn-primary" />
                                            </td>
                                            <td>
                                                <asp:Button ID="btnDesmarcar" runat="server" Text="Desmarcar Todos" CssClass="btn btn-primary"/>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
                <td style="width:32%">
                    <fieldset style="height:104px">
                        <table style="width:100%; margin-top:10px">
                            <tr>
                                <td class="Etiqueta">
                                    Cod. Atención
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtCodAtencion" runat="server" style="width:100px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="Etiqueta">
                                    Distribuidor
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txtDealercode" runat="server" style="width:50px"></asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel12" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txtDealerName" runat="server" style="width:220px"></asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <asp:UpdatePanel ID="UpdatePanel14" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Button ID="btnBusCodDistribuidor" runat="server" Text="Button" style="display:none" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                                <td colspan="2">
                                    <asp:UpdatePanel ID="UpdatePanel15" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:ImageButton ID="btnPopupDistribuidor" runat="server" ImageUrl="../Images/search.png" CssClass="ImagenBotonBuscar" OnClientClick="mostrarPopupSubscriber('Buscar Oficinas:',810,480); " />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td class="Etiqueta">
                                    Abonado
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel10" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txtCsid" runat="server" style="width:50px"></asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel8" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txtSubscriberName" runat="server" style="width:220px"></asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <asp:UpdatePanel ID="UpdatePanel9" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Button ID="btnBusCodAbonado" runat="server" Text="Button" style="display:none" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                                <td colspan="2">
                                    <asp:UpdatePanel ID="UpdatePanel13" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:ImageButton ID="btnPopupAbonado" runat="server" ImageUrl="../Images/search.png" CssClass="ImagenBotonBuscar" OnClientClick="mostrarPopupSubscriber('Buscar Oficinas:',810,480); " />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                        </table>
                     </fieldset>
                </td>
                <td style="width:30%">
                    <fieldset style="height:104px">
                        <table style="width:100%; margin-top:10px">
                            <tr>
                                <td class="Etiqueta">
                                    Operador
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel30" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txtOperador" runat="server" style="width:50px"></asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel31" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txtOperName" runat="server" style="width:220px"></asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <asp:UpdatePanel ID="UpdatePanel32" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Button ID="btnBusCodOperador" runat="server" Text="Button" style="display:none" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                                <td colspan="2">
                                    <asp:UpdatePanel ID="UpdatePanel33" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:ImageButton ID="btnPopupOperador" runat="server" ImageUrl="../Images/search.png" CssClass="ImagenBotonBuscar" OnClientClick="mostrarPopupSubscriber('Buscar Oficinas:',810,480); " />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
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
                        </table>
                     </fieldset>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <fieldset>
                        <legend>
                            Estados OT
                        </legend>
                        <table style="width:100%">
                            <tr>
                                <td>
                                    <table style="width:100%">
                                        <tr>
                                            <td>
                                                <asp:UpdatePanel ID="UpdatePanel27" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:CheckBox ID="chkPendiente" runat="server" Text="Pendientes"/> 
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btnLimpiar" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </td>
                                            <td>
                                                <asp:UpdatePanel ID="UpdatePanel28" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:CheckBox ID="chkConcluida" runat="server" Text="Concluidas"/> 
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btnLimpiar" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </td>
                                            <td>
                                                <asp:UpdatePanel ID="UpdatePanel34" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:CheckBox ID="chkAtencion" runat="server" Text="En Atencion"/> 
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btnLimpiar" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </td>
                                            <td>
                                                <asp:UpdatePanel ID="UpdatePanel35" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:CheckBox ID="chkCancelada" runat="server" Text="Canceladas"/> 
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btnLimpiar" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </td>
                                            <td>
                                                <asp:UpdatePanel ID="UpdatePanel36" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:CheckBox ID="chkenviadas" runat="server" Text="Enviadas"/> 
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btnLimpiar" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
                <td>
                    <fieldset>
                        <legend>
                            Comentarios
                        </legend>
                        <table style="width:100%">
                            <tr>
                                <td>
                                    <table style="width:100%">
                                        <tr>
                                            <td>
                                                <asp:UpdatePanel ID="UpdatePanel37" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:CheckBox ID="chkTrabPend" runat="server" Text="Trabajos Pendientes"/>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btnLimpiar" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </td>
                                            <td>
                                                <asp:UpdatePanel ID="UpdatePanel38" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:CheckBox ID="chkObservaciones" runat="server" Text="Observaciones"/>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btnLimpiar" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
                <td>
                    <fieldset>
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
                                <asp:GridView ID="gvSupervisiones"  runat="server" CssClass="mGrid" AutoGenerateColumns="False" CellPadding="4" CellSpacing="2" AllowPaging="True" PageSize="30" OnPageIndexChanging="gvSupervisiones_PageIndexChanging" ShowHeaderWhenEmpty="True" OnRowCommand="gvSupervisiones_RowCommand">
                                    <Columns>
                                        <asp:BoundField HeaderText="Fecha_Registro" DataField="Fecha_Registro" />
                                        <asp:BoundField HeaderText="ID_Ficha" DataField="ID_Ficha" />
                                        <asp:BoundField HeaderText="ID_Atencion" DataField="ID_Atencion" />
                                        <asp:BoundField HeaderText="Dealer" DataField="Dealer" />
                                        <asp:BoundField HeaderText="CSID" DataField="CSID" />
                                        <asp:BoundField HeaderText="SubscriberName" DataField="SubscriberName" />
                                        <asp:BoundField HeaderText="ProveedorID" DataField="ProveedorID" />
                                        <asp:BoundField HeaderText="PersonalID" DataField="PersonalID" />
                                        <asp:BoundField HeaderText="Nombres" DataField="Nombres" />
                                        <asp:BoundField HeaderText="Usuario" DataField="Usuario" />
                                        <asp:BoundField HeaderText="Estado_Inicio" DataField="Estado_Inicio" />
                                        <asp:BoundField HeaderText="Estado_Termino" DataField="Estado_Termino" />
                                        <asp:BoundField HeaderText="Cod_Atencion" DataField="Cod_Atencion" />
                                        <asp:BoundField HeaderText="Obs_Ficha" DataField="Obs_Ficha" />
                                        <asp:BoundField HeaderText="TipoMantenimiento" DataField="TipoMantenimiento" />
                                        <asp:BoundField HeaderText="Estado" DataField="Estado" />
                                        <asp:BoundField HeaderText="Estado_Cod" DataField="Estado_Cod" />
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

    <div id="emergente" class="ventana">
        <div class="undraggable" style="width:100%;">
			<table style="width:100% ; border-spacing:0px 0px; ">
				<tr style="background-color: #950208;" onmouseover="this.style.cursor='move'">
					<td style="width:100%; height:30px; text-align:center; font: bold 14px Tahoma;color:white;">&nbsp;&nbsp;
					<span id="titcabemergente">&nbsp;</span>&nbsp;&nbsp;</td>
					<td id="tdemergentecerrar" class="cerrar" style="width:24px; height:30px ; background-image:url('../Images/equis.png'); background-repeat:no-repeat; cursor:pointer; text-align:right" onclick="SalirPopupSubscriber();">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
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
                                        <asp:UpdatePanel ID="UpdatePanel39" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:Button ID="btnBuscarSubscriber" runat="server" Width="70" Text="Buscar" Class="btn btn-primary" OnClick="btnBuscarSubscriber_Click"  /></td>
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
                                                        <asp:CommandField ButtonType="Button" SelectText="Seleccionar" ShowSelectButton="True" >
                                                        <ControlStyle CssClass="btn btn-primary" />
                                                        </asp:CommandField>
                                                    </Columns>
                                                    
                                                    <EmptyDataTemplate>No existe(n) registro(s)</EmptyDataTemplate>
                                                    <FooterStyle BackColor="#CCCCCC" HorizontalAlign="Center" />
                                                    <HeaderStyle BackColor="Black" Font-Size="9pt"  ForeColor="White" />
                                                    <PagerSettings FirstPageText="l&lt;" LastPageText="&gt;l" Mode="NumericFirstLast" NextPageText="&gt;" PreviousPageText="&lt;" />
                                                    <PagerStyle BackColor="Black" ForeColor="white" HorizontalAlign="Center" Font-Bold="true" Font-Size="12pt"  />
                                                    <RowStyle BackColor="White" Font-Size="8pt" />
                                                    <SelectedRowStyle BackColor="Yellow" Font-Bold="True" ForeColor="Black" />
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
                                <table >
                                <tr>
                                    <td  >
                                        <asp:UpdatePanel ID="UpdatePanel41" runat="server" UpdateMode="Conditional">
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

        function Limpiar() {
            document.getElementById('ContentPlaceHolder1_txtHoraIni').value = "00";
            document.getElementById('ContentPlaceHolder1_txtMinIni').value = "00";
            document.getElementById('ContentPlaceHolder1_txtHoraFin').value = "23";
            document.getElementById('ContentPlaceHolder1_txtMinFin').value = "59";
            document.getElementById('ContentPlaceHolder1_txtCodAtencion').value = "";
            document.getElementById('ContentPlaceHolder1_txtDealercode').value = "";
            document.getElementById('ContentPlaceHolder1_txtDealerName').value = "";
            document.getElementById('ContentPlaceHolder1_txtCsid').value = "";
            document.getElementById('ContentPlaceHolder1_txtSubscriberName').value = "";
            document.getElementById('ContentPlaceHolder1_txtOperador').value = "";
            document.getElementById('ContentPlaceHolder1_txtOperName').value = "";
            document.getElementById('ContentPlaceHolder1_txtProveedor').value = "";
            document.getElementById('ContentPlaceHolder1_txtProveName').value = "";
            document.getElementById('ContentPlaceHolder1_txtTecnico').value = "";
            document.getElementById('ContentPlaceHolder1_txtTecName').value = "";
        }

    </script>
</asp:Content>







