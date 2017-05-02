<%@ Page Title="" Language="C#" MasterPageFile="~/General/Principal.Master" AutoEventWireup="true" CodeBehind="repEstadSalidasNoReportadas.aspx.cs" Inherits="WatcherSistec.Reportes.repEstadSalidasNoReportadas" %>

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
                                    Técnico
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
                                            <asp:TextBox ID="txtProveName" runat="server" style="width:220"></asp:TextBox>
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
                                            <asp:ImageButton ID="btnPopupTecnico" runat="server" ImageUrl="../Images/search.png" CssClass="ImagenBotonBuscar" OnClientClick="mostrarPopupSubscriber('Buscar Tecnico:',810,480); " />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                               
                            </tr>
                         </table>
                        <table style="width:80%; margin-top:10px">
                         <tr>
                                <td colspan="2" style="font-size:3px;" class="auto-style1">
                                    &nbsp;
                                </td>
                            </tr>
                            </table>
                        <table style="width:40%; margin-top:10px" >
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
                                        <asp:BoundField HeaderText="Cod Técnico" DataField="Cod Técnico" />
                                        <asp:BoundField HeaderText="Técnico" DataField="Técnico" />
                                        <asp:BoundField HeaderText="Total Trabajos x Tecnicos" DataField="Total Trabajos x Tecnicos" />
                                        <asp:BoundField HeaderText="Salida no Reportadas x Técnico" DataField="Salida no Reportadas x Técnico" />
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
</asp:Content>
