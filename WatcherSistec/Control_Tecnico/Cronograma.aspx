﻿<%@ Page Title="" Language="C#" MasterPageFile="~/General/Principal.Master" AutoEventWireup="true" CodeBehind="Cronograma.aspx.cs" Inherits="WatcherSistec.Control_Tecnico.Cronograma" %>
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
                    <fieldset>
                        <table style="width:100%; margin-top:10px">
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
                            Ruta de Mantenimiento
                        </legend>
                        <table style="width:100%">
                            <tr>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel30" runat="server" UpdateMode="Conditional" >
                                        <ContentTemplate>
                                            <asp:DropDownList ID="ddlDpto" runat="server" style="width:150px">
                                                <asp:ListItem Value="00">TODOS</asp:ListItem>
                                                <asp:ListItem Value="01">AMAZONAS</asp:ListItem>
                                                <asp:ListItem Value="02">ANCASH</asp:ListItem>
                                                <asp:ListItem Value="03">APURÍMAC</asp:ListItem>
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
                                                        <asp:RadioButton ID="rbtSupervision" runat="server" GroupName="gSupervision" text="Supervisados" Checked="true"/>
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
                                            <td>
                                                <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:ImageButton ID="btnModificar" runat="server" ToolTip="Modificar" ImageUrl="../Images/Mantenimiento/modify_16.ico" CssClass="ImagenBoton"/>
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
                                <asp:GridView ID="gvCronograma" runat="server" CssClass="mGrid" AutoGenerateColumns="False" CellPadding="4" CellSpacing="2" AllowPaging="True" PageSize="30" OnPageIndexChanging="gvCronograma_PageIndexChanging" ShowHeaderWhenEmpty="True">
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

    <div id="emerNuevoCronograma" class="ventana">
        <div class="undraggable" style="width:100%;">
			<table style="width:100% ; border-spacing:0px 0px; ">
				<tr style="background-color: #950208;" onmouseover="this.style.cursor='move'">
					<td style="width:100%; height:30px; text-align:center; font: bold 14px Tahoma;color:white;">&nbsp;&nbsp;
					<span id="titcabemerNuevoCronograma">&nbsp;</span>&nbsp;&nbsp;</td>
					<td id="tdemerNuevoCronogramacerrar" class="cerrar" style="width:24px; height:30px ; background-image:url('../Images/equis.png'); background-repeat:no-repeat; cursor:pointer; text-align:right" onclick="SalirPopupNuevoCronograma();">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
			</table>
		</div>

        <div id="emerNuevoCronogramacuerpo">
            <table style="width:100%"> 
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
                                                <td colspan="4">
                                                    <table style="width:100%">
                                                        <tr>
                                                            <td class="EtiquetaPop">
                                                                Periodo (MES-AÑO)
                                                            </td>
                                                            <td style="width:95px">
                                                                <asp:UpdatePanel ID="UpdatePanel38" runat="server" UpdateMode="Conditional" >
                                                                    <ContentTemplate>
                                                                        <asp:DropDownList ID="ddlMes" runat="server" style="width:95px">
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
                                                                        <asp:TextBox ID="txtAño" runat="server" onkeypress="soloNumerosCompleto(this,event,'0');"></asp:TextBox>
                                                                        <asp:NumericUpDownExtender ID="NumUPVent" runat="server" Width="60" Minimum="2000" TargetControlID="txtAño" >
                                                                        </asp:NumericUpDownExtender>
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </td>
                                                            <td style="width:11%">&nbsp;</td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Etiqueta">
                                                    Proveedor
                                                </td>
                                                <td>
                                                    <asp:UpdatePanel ID="UpdatePanel31" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtNewProv" runat="server" style="width:50px"></asp:TextBox>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                                <td>
                                                    <asp:UpdatePanel ID="UpdatePanel37" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtNewProvDes" runat="server" style="width:220px"></asp:TextBox>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                    <asp:UpdatePanel ID="UpdatePanel43" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:Button ID="btnNewProv" runat="server" Text="Button" style="display:none" />
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                                <td colspan="2">
                                                    <asp:UpdatePanel ID="UpdatePanel44" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:ImageButton ID="btnNewPopupProv" runat="server" ImageUrl="../Images/search.png" CssClass="ImagenBotonBuscar" OnClientClick="mostrarPopupSubscriber('Buscar Oficinas:',810,480); " />
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Etiqueta">
                                                    Técnico
                                                </td>
                                                <td>
                                                    <asp:UpdatePanel ID="UpdatePanel45" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtNewTec" runat="server" style="width:50px"></asp:TextBox>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                                <td>
                                                    <asp:UpdatePanel ID="UpdatePanel46" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtNewTecNom" runat="server" style="width:220px"></asp:TextBox>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                    <asp:UpdatePanel ID="UpdatePanel47" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:Button ID="btnNewTec" runat="server" Text="Button" style="display:none" />
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                                <td colspan="2">
                                                    <asp:UpdatePanel ID="UpdatePanel48" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:ImageButton ID="btnNewPopupTec" runat="server" ImageUrl="../Images/search.png" CssClass="ImagenBotonBuscar" OnClientClick="mostrarPopupSubscriber('Buscar Oficinas:',810,480); " />
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Etiqueta">
                                                    Ruta de Mantenimiento
                                                </td>
                                                <td colspan="2">
                                                    <asp:UpdatePanel ID="UpdatePanel49" runat="server" UpdateMode="Conditional" >
                                                        <ContentTemplate>
                                                            <asp:DropDownList ID="ddlRutas" runat="server" style="width:150px">
                                                                <asp:ListItem Value="00">TODOS</asp:ListItem>
                                                                <asp:ListItem Value="01">AMAZONAS</asp:ListItem>
                                                                <asp:ListItem Value="02">ANCASH</asp:ListItem>
                                                                <asp:ListItem Value="03">APURÍMAC</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Etiqueta">
                                                    Observación
                                                </td>
                                                <td colspan="2" style="height:40%; width:60%;">
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
                                    </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table style="width:100%">
                                        <tr>
                                            <td style="width:20%">&nbsp;</td>
                                            <td>
                                                <asp:UpdatePanel ID="UpdatePanel33" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:Button ID="btnAceptarCronograma" runat="server" Width="70" Text="Aceptar" Class="btn btn-primary"  OnClientClick="SalirPopupNuevoCronograma()" /></td>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
                                            <td style="width:80px">
                                            </td>
                                            <td>
                                                <asp:Button ID="btnCancelarCronograma" runat="server" Width="70" Text="Cancelar" Class="btn btn-primary" OnClientClick="SalirPopupNuevoCronograma()" />
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
                                        <asp:UpdatePanel ID="UpdatePanel51" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtDealer" runat="server" style="width:50px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel52" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtNameDealer" runat="server" style="width:220px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td>                                        
                                        <asp:UpdatePanel ID="UpdatePanel53" runat="server" UpdateMode="Conditional">
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
                                            <asp:UpdatePanel ID="UpdatePanel55" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:Button ID="btnAceptar_Dealer" runat="server" Width="70" Text="Aceptar" Class="btn btn-primary" OnClientClick="SalirEmergenteDealer()" OnClick="btnAceptar_Dealer_Click"/></td>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                        <td style="width:80px">
                                        </td>    
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel56" runat="server" UpdateMode="Conditional">
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

            $(function () {
                $("#emergente").draggable({ handle: 'div.undraggable' });
                $("#emerLocalSubscriber").draggable({ handle: 'div.undraggable' });
                $("#emerDealer").draggable({ handle: 'div.undraggable' });
            });

            function mostrarPopupSubscriber(titulo, ancho, alto) {
                $("#tdemergentecerrar").show();
                $("#fondoemergente").css('display', 'block');
                $("#titcabemergente").html(titulo);
                mostrarCentrarDiv('emergente', ancho, alto);
            }

            function mostrarPopupNuevoCronograma(titulo, ancho, alto) {
                $("#tdemerNuevoCronogramacerrar").show();
                $("#fondoemergente").css('display', 'block');
                $("#titcabemerNuevoCronograma").html(titulo);
                mostrarCentrarDiv('emerNuevoCronograma', ancho, alto);
            }

            function mostrarEmergenteabon(titulo, ancho, alto) {
                $("#tdemergentecerrarabon").show();
                $("#fondoemergenteasc").css('display', 'block');
                $("#titcabemergenteabon").html(titulo);
                mostrarCentrarDiv('emergenteabon', ancho, alto);
                document.getElementById('ContentPlaceHolder1_txtBusAbon').value = "";
                document.getElementById('ContentPlaceHolder1_txtBusOfi').value = "";
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

            function SalirPopupNuevoCronograma() {
                $("#fondoemergente").hide();
                $("#emerNuevoCronograma").hide();
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
