<%@ Page Title="" Language="C#" MasterPageFile="~/General/Principal.Master" AutoEventWireup="true" CodeBehind="repOTsPorTipoTrabajo.aspx.cs" Inherits="WatcherSistec.Reportes.repOTsPorTipoTrabajo" %>

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
                                            <td style="width:80%">
                                                <asp:Button ID="btnMarcar" runat="server" Text="Marcar Todos" CssClass="btn btn-primary" />
                                            </td>
                                            <td>
                                                <asp:Button ID="btnDesmarcar" runat="server" Text="Desmarcar Todos" CssClass="btn btn-primary"/>
                                            </td>
                                        </tr>
                                    </table >
                                
       
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
                                </td>
                            </tr>                      
                                 
                    </table>
                    </fieldset>
                    </td>              

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
 