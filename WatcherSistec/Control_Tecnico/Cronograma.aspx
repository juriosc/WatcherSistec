 <%@ Page Title="" Language="C#" MasterPageFile="~/General/Principal.Master" AutoEventWireup="true" CodeBehind="Cronograma.aspx.cs" Inherits="WatcherSistec.Control_Tecnico.Cronograma" %>
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
                    <fieldset>
                        <legend>
                            Periodo
                        </legend>
                        <table id="tblCtrlPeriodo" style="margin-top:20px">
                            <tr>
                                <td class="Etiqueta">Desde</td>
                                <td style="text-align:right">
                                    <asp:UpdatePanel ID="UpdatePanel22" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txtPeriodoIni" runat="server" style="height:16px ;width:80px"></asp:TextBox>
                                            <asp:CalendarExtender ID="txtPeriodoIni_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtPeriodoIni" Format="dd/MM/yyyy">
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
                                            <asp:TextBox ID="txtPeriodoFin" runat="server" style="height:16px ;width:80px" ></asp:TextBox>
                                            <asp:CalendarExtender ID="txtPeriodoFin_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtPeriodoFin" Format="dd/MM/yyyy">
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
                <td style="width:11%">
                    <fieldset>
                        <legend>
                            Fecha de Programación
                        </legend>
                        <table id="tblCtrlFecha" style="margin-top:20px">
                            <tr>
                                <td class="Etiqueta">Desde</td>
                                <td style="text-align:right">
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
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
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
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
                <td style="width:32%">
                    <fieldset>
                        <table style="width:100%; margin-top:10px">
                            <tr>
                                <td class="Etiqueta">
                                    Distribuidor
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txtDealercode" runat="server" style="width:50px"></asp:TextBox>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnAceptar_Dealer" EventName="Click" />
                                            <asp:AsyncPostBackTrigger ControlID="btnAceptarSubscriber" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel12" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txtDealerName" runat="server" style="width:220px"></asp:TextBox>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnAceptar_Dealer" EventName="Click" />
                                            <asp:AsyncPostBackTrigger ControlID="btnAceptarSubscriber" EventName="Click" />
                                        </Triggers>
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
                                    <asp:UpdatePanel ID="UpdatePanel10" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txtCsid" runat="server" style="width:50px"></asp:TextBox>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnAceptar_Dealer" EventName="Click" />
                                            <asp:AsyncPostBackTrigger ControlID="btnAceptarSubscriber" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel8" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txtSubscriberName" runat="server" style="width:220px"></asp:TextBox>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnAceptar_Dealer" EventName="Click" />
                                            <asp:AsyncPostBackTrigger ControlID="btnAceptarSubscriber" EventName="Click" />
                                        </Triggers>
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
                    <fieldset>
                        <table style="width:100%; margin-top:10px">
                            <tr>
                                <td class="Etiqueta">
                                    Proveedor
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel19" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txtProveName" runat="server" style="width:220px"></asp:TextBox>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnAceptar_Prov" EventName="Click" />
                                            <asp:AsyncPostBackTrigger ControlID="btnAceptarTec" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                    <asp:UpdatePanel ID="UpdatePanel20" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txtProveedor" runat="server" style="display:none"></asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                                <td colspan="2">
                                    <asp:UpdatePanel ID="UpdatePanel21" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:ImageButton ID="btnPopupProveedor" runat="server" ImageUrl="../Images/search.png" CssClass="ImagenBotonBuscar" OnClientClick="mostrarEmergenteProv('Buscar Proveedor:',400,250); " />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td class="Etiqueta">
                                    Técnico
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel25" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txtTecName" runat="server" style="width:220px"></asp:TextBox>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnAceptarTec" EventName="Click" />
                                            <asp:AsyncPostBackTrigger ControlID="btnAceptar_Prov" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                    <asp:UpdatePanel ID="UpdatePanel23" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txtTecnico" runat="server" style="display:none"></asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                                <td colspan="2">
                                    <asp:UpdatePanel ID="UpdatePanel29" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:ImageButton ID="btnPopupTecnico" runat="server" ImageUrl="../Images/search.png" CssClass="ImagenBotonBuscar" OnClientClick="mostrarEmergenteTecnico('Buscar Tecnico:',810,480); " />
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
                            Ruta de Mantenimiento
                        </legend>
                        <table style="width:100%">
                            <tr>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel30" runat="server" UpdateMode="Conditional" >
                                        <ContentTemplate>
                                            <asp:DropDownList ID="ddlRuta" runat="server" style="width:150px">
                                            </asp:DropDownList>
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
                            Interconeción de Abonados
                        </legend>
                        <table style="width:100%">
                            <tr>
                                <td>
                                    <table style="width:100%">
                                        <tr>
                                            <td class="Etiqueta">
                                                <asp:UpdatePanel ID="UpdatePanel24" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:RadioButton ID="rbtSupervision" runat="server" GroupName="gSupervision" text="Supervisados"   Checked="true"/>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btnLimpiar" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </td>
                                            <td class="Etiqueta">
                                                <asp:UpdatePanel ID="UpdatePanel17" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:RadioButton ID="rbtSinSupervision" runat="server" GroupName="gSupervision" Text="Sin Supervision"/>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btnLimpiar" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </td>
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
                        <asp:UpdatePanel ID="UpdatePanel16" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gvCronograma" Width="100%" runat="server" CssClass="mGrid" AutoGenerateColumns="False" CellPadding="4" CellSpacing="2" AllowPaging="True" PageSize="30" OnPageIndexChanging="gvCronograma_PageIndexChanging" ShowHeaderWhenEmpty="True" OnRowCommand="gvCronograma_RowCommand">
                                    <Columns>
                                        <asp:BoundField HeaderText="Periodo" DataField="Periodo" />
                                        <asp:BoundField HeaderText="Proveedor" DataField="ProveedorID" />
                                        <asp:BoundField HeaderText="Cod. Técnico" DataField="PersonalID" />
                                        <asp:BoundField HeaderText="Técnico" DataField="Nombres" />
                                        <asp:BoundField HeaderText="Ruta_ID" DataField="Ruta_ID" >
                                        <HeaderStyle CssClass="ColumnaOculta" />
                                        <ItemStyle CssClass="ColumnaOculta" />
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="Ruta/Zona" DataField="Ruta" />
                                        <asp:BoundField HeaderText="Distribuidor" DataField="DealerCode" />
                                        <asp:BoundField HeaderText="Abonado" DataField="CSID" />
                                        <asp:BoundField HeaderText="Oficina" DataField="Abonado" />
                                        <asp:BoundField HeaderText="Observaciones" DataField="Observaciones" />
                                        <asp:BoundField HeaderText="Estado_Ficha" DataField="Estado_Ficha" >
                                        <HeaderStyle CssClass="ColumnaOculta" />
                                        <ItemStyle CssClass="ColumnaOculta" />
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="tiposMant" DataField="tiposMant" >
                                        <HeaderStyle CssClass="ColumnaOculta" />
                                        <ItemStyle CssClass="ColumnaOculta" />
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="Fecha_Programada" DataField="Fecha_Programada" >
                                        <HeaderStyle CssClass="ColumnaOculta" />
                                        <ItemStyle CssClass="ColumnaOculta" />
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="Mes" DataField="Mes" >
                                        <HeaderStyle CssClass="ColumnaOculta" />
                                        <ItemStyle CssClass="ColumnaOculta" />
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="Anho" DataField="Anho" >
                                        <HeaderStyle CssClass="ColumnaOculta" />
                                        <ItemStyle CssClass="ColumnaOculta" />
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="DealerName" DataField="DealerName" >
                                        <HeaderStyle CssClass="ColumnaOculta" />
                                        <ItemStyle CssClass="ColumnaOculta" />
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="ProvName" DataField="ProvName" >
                                        <HeaderStyle CssClass="ColumnaOculta" />
                                        <ItemStyle CssClass="ColumnaOculta" />
                                        </asp:BoundField>
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
                                    <PagerStyle BackColor="Black" ForeColor="white" HorizontalAlign="Center" Font-Bold="true" Font-Size="8pt"  />
                                    <RowStyle BackColor="White" Font-Size="10pt" />
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

    <div id="emerNuevoCronograma" class="ventana">
        <div class="undraggable" style="width:100%;">
			<table style="width:100% ; border-spacing:0px 0px; ">
				<tr style="background: linear-gradient(#525252,black);" onmouseover="this.style.cursor='move'">
					<td style="width:100%; height:30px; text-align:center; font: bold 14px Tahoma;color:white;">&nbsp;&nbsp;
					<span id="titcabemerNuevoCronograma">&nbsp;</span>&nbsp;&nbsp;</td>
					<td id="tdemerNuevoCronogramacerrar" class="cerrar" style="width:24px; height:30px ; background-image:url('../Images/equis.png'); background-repeat:no-repeat; cursor:pointer; text-align:right" onclick="SalirPopupNuevoCronograma();">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
			</table>
		</div>
        <div id="fondoemergentedos" class="fondo">&nbsp;</div>
        <div id="emerNuevoCronogramacuerpo">
            <table style="width:100%"> 
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                            <ContentTemplate>
                                <asp:HiddenField ID="hdfEstado" runat="server"/>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>                                        
                    <td>
                        <table style="width:100%;">
                            <tr>
                                <td>
                                    <fieldset>
                                        <legend>
                                            Datos Principales
                                        </legend>
                                        <table style="width:100%">
                                            <tr>
                                                <td colspan="6">
                                                    <table style="width:100%">
                                                        <tr>
                                                            <td class="EtiquetaPop">
                                                                Periodo (MES-AÑO)
                                                            </td>
                                                            <td style="width:95px">
                                                                <asp:UpdatePanel ID="UpdatePanel38" runat="server">
                                                                    <ContentTemplate>
                                                                        <asp:DropDownList ID="ddlMes" runat="server" style="width:98px">
                                                                            <asp:ListItem Value="00">SELECCIONE</asp:ListItem>
                                                                            <asp:ListItem Value="01">ENERO</asp:ListItem>
                                                                            <asp:ListItem Value="02">FEBRERO</asp:ListItem>
                                                                            <asp:ListItem Value="03">MARZO</asp:ListItem>
                                                                            <asp:ListItem Value="04">ABRIL</asp:ListItem>
                                                                            <asp:ListItem Value="05">MAYO</asp:ListItem>
                                                                            <asp:ListItem Value="06">JUNIO</asp:ListItem>
                                                                            <asp:ListItem Value="07">JULIO</asp:ListItem>
                                                                            <asp:ListItem Value="08">AGOSTO</asp:ListItem>
                                                                            <asp:ListItem Value="09">SETIEMBRE</asp:ListItem>
                                                                            <asp:ListItem Value="10">OCTUBRE</asp:ListItem>
                                                                            <asp:ListItem Value="11">NOVIEMBRE</asp:ListItem>
                                                                            <asp:ListItem Value="12">DICIEMBRE</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </td>
                                                            <td>
                                                                <asp:UpdatePanel ID="UpdatePanel42" runat="server" >
                                                                    <ContentTemplate>
                                                                        <asp:TextBox ID="txtAño" runat="server" style="width:35px" MaxLength="4"></asp:TextBox>
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </td>
                                                            <td class="Etiqueta">
                                                                Ruta de Mantenimiento
                                                            </td>
                                                            <td>
                                                                <asp:UpdatePanel ID="UpdatePanel49" runat="server">
                                                                    <ContentTemplate>
                                                                        <asp:DropDownList ID="ddlRutas" runat="server" style="width:150px">
                                                                        </asp:DropDownList>
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Etiqueta">
                                                    Proveedor
                                                </td>
                                                <td>
                                                    <asp:UpdatePanel ID="UpdatePanel37" runat="server">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtNewProvDes" runat="server" style="width:220px"></asp:TextBox>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                    <asp:UpdatePanel ID="UpdatePanel31" runat="server">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtNewProv" runat="server" style="display:none"></asp:TextBox>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                                <td>
                                                    <asp:UpdatePanel ID="UpdatePanel44" runat="server">
                                                        <ContentTemplate>
                                                            <asp:ImageButton ID="btnNewPopupProv" runat="server" ImageUrl="../Images/search.png" CssClass="ImagenBotonBuscar" OnClientClick="mostrarEmergenteProv2('Buscar Proveedor:',400,250); " />
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                                <td class="Etiqueta">
                                                    Técnico
                                                </td>
                                                <td>
                                                    <asp:UpdatePanel ID="UpdatePanel46" runat="server">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtNewTecNom" runat="server" style="width:220px"></asp:TextBox>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                    <asp:UpdatePanel ID="UpdatePanel45" runat="server">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtNewTec" runat="server" style="display:none"></asp:TextBox>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                                <td>
                                                    <asp:UpdatePanel ID="UpdatePanel48" runat="server">
                                                        <ContentTemplate>
                                                            <asp:ImageButton ID="btnNewPopupTec" runat="server" ImageUrl="../Images/search.png" CssClass="ImagenBotonBuscar" OnClientClick="mostrarEmergenteTecnico2('Buscar Oficinas:',810,480); " />
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>
                                            <tr>
                                                
                                                <td class="Etiqueta">
                                                    Observación
                                                </td>
                                                <td colspan="5" style="height:40%; width:60%;">
                                                     <asp:UpdatePanel ID="UpdatePanel50" runat="server">
                                                         <ContentTemplate>
                                                             <asp:TextBox ID="txtObs" Font-Size="14px" TextMode="MultiLine" runat="server" Width="100%" Height="50px"></asp:TextBox>
                                                         </ContentTemplate>
                                                     </asp:UpdatePanel>
                                                 </td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <fieldset>
                                        <legend>
                                            Detalles
                                        </legend>
                                        <table style="width:100%">
                                            <tr>
                                                <td class="Etiqueta">
                                                    Distribuidor
                                                </td>
                                                <td>
                                                    <asp:UpdatePanel ID="UpdatePanel18" runat="server">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtNewDealer" runat="server" style="width:50px"></asp:TextBox>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                                <td>
                                                    <asp:UpdatePanel ID="UpdatePanel26" runat="server">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtNewDealerDesc" runat="server" style="width:220px"></asp:TextBox>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                    <asp:UpdatePanel ID="UpdatePanel32" runat="server">
                                                        <ContentTemplate>
                                                            <asp:Button ID="btnNewDealer" runat="server" Text="Button" style="display:none" />
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                                <td>
                                                    <asp:UpdatePanel ID="UpdatePanel43" runat="server">
                                                        <ContentTemplate>
                                                            <asp:ImageButton ID="btnNewPopupDealer" runat="server" ImageUrl="../Images/search.png" CssClass="ImagenBotonBuscar" OnClientClick="mostrarEmergenteDealer2('Buscar Distribuidor:',460,250);" />
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Etiqueta">
                                                    Abonado
                                                </td>
                                                <td>
                                                    <asp:UpdatePanel ID="UpdatePanel47" runat="server">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtNewAbon" runat="server" style="width:50px"></asp:TextBox>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                    <asp:UpdatePanel ID="UpdatePanel77" runat="server">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtLocal" runat="server" style="display:none"></asp:TextBox>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                                <td>
                                                    <asp:UpdatePanel ID="UpdatePanel65" runat="server">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtNewAbonDesc" runat="server" style="width:220px"></asp:TextBox>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                    <asp:UpdatePanel ID="UpdatePanel68" runat="server">
                                                        <ContentTemplate>
                                                            <asp:Button ID="btnNewAbon" runat="server" Text="Button" style="display:none" />
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                                <td >
                                                    <asp:UpdatePanel ID="UpdatePanel69" runat="server">
                                                        <ContentTemplate>
                                                            <asp:ImageButton ID="btnNewPopupAbon" runat="server" ImageUrl="../Images/search.png" CssClass="ImagenBotonBuscar" OnClientClick="mostrarPopupSubscriber2('Buscar Oficinas:',810,480); " />
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Etiqueta">Fecha Programacion</td>
                                                <td  colspan="2" style="height: 28px">
                                                    <asp:UpdatePanel ID="UpdatePanel70" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtFechaP" runat="server" ></asp:TextBox>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="gvCronograma" EventName="RowCommand" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Etiqueta">Fecha Visita</td>
                                                <td colspan="2" style="height: 28px">
                                                    <asp:UpdatePanel ID="UpdatePanel71" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtFechaV" runat="server" ></asp:TextBox>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="gvCronograma" EventName="RowCommand" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </td>
                                                <td>
                                                <asp:UpdatePanel ID="UpdatePanel75" runat="server">
                                                    <ContentTemplate>
                                                        <asp:Button ID="btnFicha" runat="server" Width="100px" Text="Generar Ficha" Class="btn btn-primary" OnClick="btnFicha_Click" /></td>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <div>
                                                        <table class="CabeceraScroll" style="background-color:black; font-size:11px; color:white; width:100%">
                                                            <tr>
                                                                <td>
                                                                    Tipo Mantenimiento
                                                                </td>
                                                                <td>

                                                                </td>
                                                                <td style="text-align:right;padding-right:28px;">
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
                                                        <asp:UpdatePanel ID="UpdatePanel72" runat="server">
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
                                            <tr>
                                                <td colspan="4" style="border-top:solid">&nbsp; </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="vertical-align:central">
                                                    <asp:UpdatePanel ID="UpdatePanel73" runat="server" >
                                                        <ContentTemplate>
                                                            <asp:GridView ID="gvBloqueZonas"  runat="server" AutoGenerateColumns="False" ShowHeader="false" OnRowDataBound="gvBloqueZonas_RowDataBound" Height="100%" Width="100%">
                                                                <Columns>
                                                                    <asp:BoundField DataField="A" ItemStyle-CssClass="Bloque" ></asp:BoundField>
                                                                    <asp:BoundField DataField="PA" ItemStyle-CssClass="ColumnaOculta"></asp:BoundField>
                                                                    <asp:BoundField DataField="B" ItemStyle-CssClass="Bloque"></asp:BoundField>
                                                                    <asp:BoundField DataField="PB" ItemStyle-CssClass="ColumnaOculta"></asp:BoundField>
                                                                    <asp:BoundField DataField="C" ItemStyle-CssClass="Bloque"></asp:BoundField>
                                                                    <asp:BoundField DataField="PC" ItemStyle-CssClass="ColumnaOculta"></asp:BoundField>                                                        
                                                                    <asp:BoundField DataField="D" ItemStyle-CssClass="Bloque"></asp:BoundField>
                                                                    <asp:BoundField DataField="PD" ItemStyle-CssClass="ColumnaOculta"></asp:BoundField>
                                                                    <asp:BoundField DataField="E" ItemStyle-CssClass="Bloque"></asp:BoundField>
                                                                    <asp:BoundField DataField="PE" ItemStyle-CssClass="ColumnaOculta"></asp:BoundField>
                                                                    <asp:BoundField DataField="F" ItemStyle-CssClass="Bloque"></asp:BoundField>
                                                                    <asp:BoundField DataField="PF" ItemStyle-CssClass="ColumnaOculta"></asp:BoundField>
                                                                    <asp:BoundField DataField="G" ItemStyle-CssClass="Bloque"></asp:BoundField>
                                                                    <asp:BoundField DataField="PG" ItemStyle-CssClass="ColumnaOculta"></asp:BoundField>
                                                                    <asp:BoundField DataField="H" ItemStyle-CssClass="Bloque"></asp:BoundField>
                                                                    <asp:BoundField DataField="PH" ItemStyle-CssClass="ColumnaOculta"></asp:BoundField>
                                                                    <asp:BoundField DataField="I" ItemStyle-CssClass="Bloque"></asp:BoundField>
                                                                    <asp:BoundField DataField="PI" ItemStyle-CssClass="ColumnaOculta"></asp:BoundField>
                                                                    <asp:BoundField DataField="J" ItemStyle-CssClass="Bloque"></asp:BoundField>
                                                                    <asp:BoundField DataField="PJ" ItemStyle-CssClass="ColumnaOculta"></asp:BoundField>
                                                                    <asp:BoundField DataField="K" ItemStyle-CssClass="Bloque"></asp:BoundField>
                                                                    <asp:BoundField DataField="PK" ItemStyle-CssClass="ColumnaOculta"></asp:BoundField>
                                                                    <asp:BoundField DataField="L" ItemStyle-CssClass="Bloque"></asp:BoundField>
                                                                    <asp:BoundField DataField="PL" ItemStyle-CssClass="ColumnaOculta"></asp:BoundField>
                                                                    <asp:BoundField DataField="M" ItemStyle-CssClass="Bloque"></asp:BoundField>
                                                                    <asp:BoundField DataField="PM" ItemStyle-CssClass="ColumnaOculta"></asp:BoundField>
                                                                    <asp:BoundField DataField="N" ItemStyle-CssClass="Bloque"></asp:BoundField>
                                                                    <asp:BoundField DataField="PN" ItemStyle-CssClass="ColumnaOculta"></asp:BoundField>
                                                                    <asp:BoundField DataField="O" ItemStyle-CssClass="Bloque"></asp:BoundField>
                                                                    <asp:BoundField DataField="PO" ItemStyle-CssClass="ColumnaOculta"></asp:BoundField>
                                                                    <asp:BoundField DataField="P" ItemStyle-CssClass="Bloque"></asp:BoundField>
                                                                    <asp:BoundField DataField="PP" ItemStyle-CssClass="ColumnaOculta"></asp:BoundField>
                                                                    <asp:BoundField DataField="Q" ItemStyle-CssClass="Bloque"></asp:BoundField>
                                                                    <asp:BoundField DataField="PQ" ItemStyle-CssClass="ColumnaOculta"></asp:BoundField>
                                                                    <asp:BoundField DataField="R" ItemStyle-CssClass="Bloque"></asp:BoundField>
                                                                    <asp:BoundField DataField="PR" ItemStyle-CssClass="ColumnaOculta"></asp:BoundField>
                                                                    <asp:BoundField DataField="S" ItemStyle-CssClass="Bloque"></asp:BoundField>
                                                                    <asp:BoundField DataField="PS" ItemStyle-CssClass="ColumnaOculta"></asp:BoundField>
                                                                    <asp:BoundField DataField="T" ItemStyle-CssClass="Bloque"></asp:BoundField>
                                                                    <asp:BoundField DataField="PT" ItemStyle-CssClass="ColumnaOculta"></asp:BoundField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>                                
                                                </td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </td>
                            </tr>
                            <%--<tr>
                                <td>
                                    <fieldset>
                                        <legend>
                                            Detalles - Listado de Abonados
                                        </legend>
                                        <table style="width:100%; height:200px">
                                            <tr>
                                                <td style="vertical-align:top;width:100%;">
                                                    <asp:UpdatePanel ID="UpdatePanel32" runat="server" >
                                                        <ContentTemplate>
                                                            <asp:GridView ID="gvCronogramaMantenimiento" runat="server" CssClass="mGrid" AllowPaging="True" AutoGenerateColumns="False" Width="100%" OnPageIndexChanging="gvCronogramaMantenimiento_PageIndexChanging" ShowHeaderWhenEmpty="True">
                                                                <Columns>
                                                                    <asp:BoundField HeaderText="Periodo" DataField="Periodo" >
                                                                        <HeaderStyle CssClass="ColumnaOculta" />
                                                                        <ItemStyle CssClass="ColumnaOculta" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField HeaderText="ProveedorID" DataField="ProveedorID" >
                                                                        <HeaderStyle CssClass="ColumnaOculta" />
                                                                        <ItemStyle CssClass="ColumnaOculta" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField HeaderText="PersonalID" DataField="PersonalID" >
                                                                        <HeaderStyle CssClass="ColumnaOculta" />
                                                                        <ItemStyle CssClass="ColumnaOculta" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField HeaderText="Ruta_ID" DataField="Ruta_ID" >
                                                                        <HeaderStyle CssClass="ColumnaOculta" />
                                                                        <ItemStyle CssClass="ColumnaOculta" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField HeaderText="b_supervisar" DataField="b_supervisar" >
                                                                        <HeaderStyle CssClass="ColumnaOculta" />
                                                                        <ItemStyle CssClass="ColumnaOculta" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField HeaderText="Distribuidor" DataField="DealerCode" />
                                                                    <asp:BoundField HeaderText="Cod. Abonado" DataField="CSID" />
                                                                    <asp:BoundField HeaderText="Oficina" DataField="Abonado" />
                                                                    <asp:BoundField HeaderText="Fecha Prog." DataField="Fecha_Programada" />
                                                                    <asp:BoundField HeaderText="Fecha Visita" DataField="Fecha_Visita" />
                                                                    <asp:BoundField HeaderText="Observaciones" DataField="Observaciones" />
                                                                    <asp:BoundField HeaderText="Estado_Ficha" DataField="Estado_Ficha" >
                                                                        <HeaderStyle CssClass="ColumnaOculta" />
                                                                        <ItemStyle CssClass="ColumnaOculta" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField HeaderText="Tipos(s) de Mant." DataField="tiposMant" />
                                                                    <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" ButtonType="Image" SelectImageUrl="../Images/Select.png">
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:CommandField>
                                                                </Columns>
                                                    
                                                                <EmptyDataTemplate></EmptyDataTemplate>
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
                                    </fieldset>
                                </td>
                            </tr>--%>
                            <tr>
                                <td>
                                    <table style="width:100%">
                                        <tr>
                                            <td style="width:20%">&nbsp;</td>
                                            <td>
                                                <asp:UpdatePanel ID="UpdatePanel33" runat="server">
                                                    <ContentTemplate>
                                                        <asp:Button ID="btnAceptarCronograma" runat="server" Width="70" Text="Aceptar" Class="btn btn-primary" OnClick="btnAceptarCronograma_Click"  OnClientClick="SalirPopupNuevoCronograma()" /></td>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
                                            <td style="width:80px">
                                            </td>
                                            <td>
                                                <asp:UpdatePanel ID="UpdatePanel57" runat="server">
                                                    <ContentTemplate>
                                                        <asp:Button ID="btnCancelarCronograma" runat="server" Width="70" Text="Cancelar" Class="btn btn-primary" OnClientClick="SalirPopupNuevoCronograma()" />
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
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
                                        <asp:UpdatePanel ID="UpdatePanel51" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtDealer" runat="server" style="width:50px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel52" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtNameDealer" runat="server" style="width:220px"></asp:TextBox>
                                                <asp:TextBox ID="txtFondo4" runat="server" style="display:none"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td>                                        
                                        <asp:UpdatePanel ID="UpdatePanel53" runat="server">
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
                                        
                                        <asp:UpdatePanel ID="UpdatePanel54" runat="server" >
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
                            <div style="margin-top:10px;margin-left:110px;">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel55" runat="server">
                                                <ContentTemplate>
                                                    <asp:Button ID="btnAceptar_Dealer" runat="server" Width="70" Text="Aceptar" Class="btn btn-primary" OnClientClick="SalirEmergenteDealer()" OnClick="btnAceptar_Dealer_Click"/></td>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                        <td style="width:80px">
                                        </td>    
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel56" runat="server">
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

    <div id="emergente" class="ventana">
        <div class="undraggable" style="width:100%;">
			<table style="width:100% ; border-spacing:0px 0px; ">
				<tr style="background: linear-gradient(#525252,black);" onmouseover="this.style.cursor='move'">
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
                                        <asp:TextBox ID="txtFondo3" runat="server" style="display:none"></asp:TextBox>
                                    </td>
                                    <td>                                        
                                        <asp:UpdatePanel ID="UpdatePanel39" runat="server">
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
                                                        <asp:BoundField HeaderText="DealerCode" DataField="DealerCode" >
                                                            <HeaderStyle CssClass="ColumnaOculta" />
                                                            <ItemStyle CssClass="ColumnaOculta" />
                                                        </asp:BoundField>
                                                        <asp:BoundField HeaderText="Localid" DataField="Localid" >
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
                                        <asp:UpdatePanel ID="UpdatePanel74" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:Button ID="btnCancelarSubscriber" runat="server" Width="70" Text="Cancelar" Class="btn btn-primary" OnClientClick="SalirPopupSubscriber()" />                                        
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
                                                <asp:Button ID="btnBuscarProv" runat="server" Width="70" Text="Buscar" Class="btn btn-primary" OnClick="btnBuscarProv_Click" /></td>
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
                                                <asp:Button ID="btnBuscarTecnico" runat="server" Width="70" Text="Buscar" Class="btn btn-primary" OnClick="btnBuscarTecnico_Click"  /></td>
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
                                                <asp:GridView ID="gvTecnico" runat="server" AllowPaging="True" CssClass="mGrid" AutoGenerateColumns="False" Width="800px" OnPageIndexChanging="gvTecnico_PageIndexChanging" >
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
                $("#emergente").draggable({ handle: 'div.undraggable' });
                $("#emerLocalSubscriber").draggable({ handle: 'div.undraggable' });
                $("#emerDealer").draggable({ handle: 'div.undraggable' });
                $("#emerProv").draggable({ handle: 'div.undraggable' });
                $("#emerTecnico").draggable({ handle: 'div.undraggable' });
                $("#emerNuevoCronograma").draggable({ handle: 'div.undraggable' });
                
            });

            $(document).ready(function () {
                $('#ContentPlaceHolder1_txtFechaP').datetimepicker();
                $('#ContentPlaceHolder1_txtFechaV').datetimepicker();
            });
            function mostrarPopupSubscriber(titulo, ancho, alto) {
                $("#tdemergentecerrar").show();
                $("#fondoemergente").css('display', 'block');
                $("#titcabemergente").html(titulo);
                document.getElementById('ContentPlaceHolder1_txtFondo3').value = "0";
                mostrarCentrarDiv('emergente', ancho, alto);
            }

            function mostrarPopupNuevoCronograma(titulo, ancho, alto) {
                $("#tdemerNuevoCronogramacerrar").show();
                $("#fondoemergente").css('display', 'block');
                $("#titcabemerNuevoCronograma").html(titulo);
                mostrarCentrarDiv('emerNuevoCronograma', ancho, alto);
            }

            function mostrarEmergenteDealer(titulo, ancho, alto) {
                $("#tdemerDealercerrar").show();
                $("#fondoemergente").css('display', 'block');
                $("#titcabemerDealer").html(titulo);
                document.getElementById('ContentPlaceHolder1_txtFondo4').value = "0";
                mostrarCentrarDiv('emerDealer', ancho, alto);
            }

            function mostrarEmergenteProv(titulo, ancho, alto) {
                $("#tdemerProvcerrar").show();
                $("#fondoemergente").css('display', 'block');
                $("#titcabemerProv").html(titulo);
                document.getElementById('ContentPlaceHolder1_txtFondo').value = "0";
                mostrarCentrarDiv('emerProv', ancho, alto);
            }

            function mostrarEmergenteTecnico(titulo, ancho, alto) {
                $("#tdemerTecnicocerrar").show();
                $("#fondoemergente").css('display', 'block');
                $("#titcabemerTecnico").html(titulo);
                document.getElementById('ContentPlaceHolder1_txtFondo1').value = "0";
                mostrarCentrarDiv('emerTecnico', ancho, alto);
            }

            function mostrarPopupSubscriber2(titulo, ancho, alto) {
                $("#tdemergentecerrar").show();
                $("#fondoemergentedos").css('display', 'block');
                $("#titcabemergente").html(titulo);
                document.getElementById('ContentPlaceHolder1_txtFondo3').value = "1";
                mostrarCentrarDiv('emergente', ancho, alto);
            }

            function mostrarEmergenteDealer2(titulo, ancho, alto) {
                $("#tdemerDealercerrar").show();
                $("#fondoemergentedos").css('display', 'block');
                $("#titcabemerDealer").html(titulo);
                document.getElementById('ContentPlaceHolder1_txtFondo4').value = "1";
                mostrarCentrarDiv('emerDealer', ancho, alto);
            }
            function mostrarEmergenteProv2(titulo, ancho, alto) {
                $("#tdemerProvcerrar").show();
                $("#fondoemergentedos").css('display', 'block');
                $("#titcabemerProv").html(titulo);
                document.getElementById('ContentPlaceHolder1_txtFondo').value = "1";
                mostrarCentrarDiv('emerProv', ancho, alto);
            }

            function mostrarEmergenteTecnico2(titulo, ancho, alto) {
                $("#tdemerTecnicocerrar").show();
                $("#fondoemergentedos").css('display', 'block');
                $("#titcabemerTecnico").html(titulo);
                document.getElementById('ContentPlaceHolder1_txtFondo1').value = "1";
                mostrarCentrarDiv('emerTecnico', ancho, alto);

            }
            function SalirPopupNuevoCronograma() {
                $("#fondoemergente").hide();
                $("#emerNuevoCronograma").hide();
            }

            function SalirPopupSubscriber() {

                var bandera = document.getElementById('ContentPlaceHolder1_txtFondo3').value;
                if (bandera == "1")
                {
                    $("#fondoemergentedos").hide();
                }
                else
                {
                    $("#fondoemergente").hide();
                }
                $("#emergente").hide();
            }

            

            function SalirEmergenteDealer() {

                var bandera = document.getElementById('ContentPlaceHolder1_txtFondo4').value;
                if (bandera == "1")
                {
                    $("#fondoemergentedos").hide();
                }
                else
                {
                    $("#fondoemergente").hide();
                }
                $("#emerDealer").hide();
            }

            function SalirEmergenteProveedor() {

                var bandera = document.getElementById('ContentPlaceHolder1_txtFondo').value;
                if (bandera == "1")
                {
                    $("#fondoemergentedos").hide();
                }
                else
                {
                    $("#fondoemergente").hide();
                }
                $("#emerProv").hide();
            }

            function SalirEmergenteTecnico() {
                var bandera = document.getElementById('ContentPlaceHolder1_txtFondo1').value;
                if (bandera == "1")
                {
                    $("#fondoemergentedos").hide();
                }
                else
                {
                    $("#fondoemergente").hide();
                }
                $("#emerTecnico").hide();
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

            function soloNumerosCompleto(txt, e, tipo) {
                var key = (window.event) ? event.keyCode : e.which;

                var tipoKey = -1;
                if (tipo == 0) // solo numero
                    tipoKey = -1
                else if (tipo == 1) // solo numero decimal
                    tipoKey = 46
                else if (tipo == 2) // solo numero fecha
                    tipoKey = 47

                //Was key that was pressed a numeric character (0-9) or backspace (8)?
                if (key > 47 && key < 58 || key == 8 || key == tipoKey || key == 0) {
                    var continuar = true;
                    if (key == 46) {
                        if (txt.value.indexOf('.') != -1) {
                            continuar = false;
                        }
                    }

                    if (continuar) {
                        return true;
                    } else {
                        if (window.event) { window.event.returnValue = null; } //IE
                        else { e.preventDefault(); } //Firefox
                    }
                } else {
                    if (window.event) { window.event.returnValue = null; } //IE
                    else { e.preventDefault(); } //Firefox
                }
            }

            function Limpiar() {
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
