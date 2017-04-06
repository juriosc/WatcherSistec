<%@ Page Title="" Language="C#" MasterPageFile="~/General/Principal.Master" AutoEventWireup="true" CodeBehind="FichaSupervision.aspx.cs" Inherits="WatcherSistec.Control_Tecnico.FichaSupervision" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .ColumnaOculta {display:none;}

        .auto-style2 {
            width: 24px;
        }

        /*nuevo*/
       .tooltip {
    display: inline;
    position: relative;
  }
  .tooltip:hover:after {
    bottom: 26px;
    content: attr(title); /* este es el texto que será mostrado */
    left: 20%;
    position: absolute;
    z-index: 98;
    /* el formato gráfico */
    background: black;/*rgba(255,255,255, 0.2);*/ /* el color de fondo */
    border-radius: 5px;
    color: #FFF; /* el color del texto */
    font-family: Georgia;
    font-size: 12px;
    padding: 5px 15px;
    text-align: center;
    text-shadow: 1px 1px 1px #000;
    width: 150px;
  }
  .tooltip:hover:before {
    bottom: 20px;
    content: "";
    left: 50%;
    position: absolute;
    z-index: 99;
    /* el triángulo inferior */
    border: solid;
    border-color: rgba(255,255,255, 0.2) transparent;
    border-width: 6px 6px 0 6px;
  }

    .auto-style4 {
        height: 28px;
    }

    </style>




<script type="text/javascript">
    $(document).ready(function () {
        $('#ContentPlaceHolder1_txtFechaI').datetimepicker();
        $('#ContentPlaceHolder1_txtFechaS').datetimepicker();
    });
</script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="fondoemergente" class="fondo">&nbsp;</div>
    <div style="height:100%">
        <table style="height:1px">
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel57" runat="server">
                        <ContentTemplate>
                            <asp:Timer ID="tmrActualizarZonas" runat="server" Interval="2000" OnTick="tmrActualizarZonas_Tick"></asp:Timer>
                        </ContentTemplate>
                    </asp:UpdatePanel>                    
                </td>
            </tr>
        </table>
        <table class="cab_context" style="width:100%">
            <tr>
                <td style="width:300px">
                    FICHA DE SUPERVISION NRO :
                </td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel29" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:TextBox ID="txtID_Ficha" runat="server"></asp:TextBox>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnGuardar" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
                <td style="width:25px">

                </td>
                <td style="width:150px">
                    <asp:UpdatePanel ID="UpdatePanel26" runat="server">
                        <ContentTemplate>
                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar"  Width="110px" Height="30px" OnClick="btnGuardar_Click" />
                        </ContentTemplate>
                    </asp:UpdatePanel>                    
                </td>
                <td style="width:150px">
                     <asp:UpdatePanel ID="UpdatePanel27" runat="server">
                        <ContentTemplate>
                            <asp:Button ID="btnCancelar" CssClass="btn btn-primary" runat="server" Text="Cancelar Ficha" Width="110px"  />        
                        </ContentTemplate>
                    </asp:UpdatePanel>                        
                </td>
                <td style="width:150px">
                    <asp:UpdatePanel ID="UpdatePanel28" runat="server">
                        <ContentTemplate>
                            <asp:Button ID="btnPendiente" CssClass="btn btn-primary" runat="server" Text="Ficha Pendiente" Width="110px" />
                        </ContentTemplate>
                    </asp:UpdatePanel>                                            
                </td>
                 <td style="width:150px">
                    <asp:Button ID="btnConcluir" CssClass="btn btn-primary" runat="server" Text="Concluir Ficha" Width="110px" />
                </td>
                
                <td style="width:150px">
                    <asp:CheckBox ID="chksms" runat="server" Text="SMS AUTO" CssClass="Etiqueta" />
                </td>
                <td style="width:150px">
                    <asp:CheckBox ID="chktlf" runat="server" Text="TLF. 9 DIG" CssClass="Etiqueta" />
                </td>
                <td style="width:150px">
                    <asp:Button ID="btnsms" CssClass="btn btn-primary" runat="server" Text="SMS" />
                </td>

            </tr>
        </table>

        <table style="width:100%">
            <tr>
                <td>
                    <fieldset>
                        <legend>
                            TÉCNICO
                        </legend>
                        <table style="width:100%">                                  
                        <tr>
                            <td style="height:100px;vertical-align:top">                                                
                                <table>
                                    <tr>
                                        <td class="auto-style4" >PROVEEDOR</td>
                                        <td class="auto-style4">
                                            <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                                                <ContentTemplate>
                                                    <asp:TextBox ID="txtProveedorID" runat="server" style="display:none;" ></asp:TextBox>
                                                    <asp:TextBox ID="txtProv" runat="server" ReadOnly="true"></asp:TextBox>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                        <td class="auto-style4" >FECHA INGRESO</td>
                                        <td class="auto-style4">
                                            <asp:UpdatePanel ID="UpdatePanel8" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:TextBox ID="txtFechaI" runat="server" ></asp:TextBox>                                                    
                                                    
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td >NOMBRES</td>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                                <ContentTemplate>
                                                    <asp:TextBox ID="txtPersonalID" runat="server" style="display:none;"></asp:TextBox>
                                                    <asp:TextBox ID="txtNombre" runat="server" ReadOnly="true" Height="19px" Width="365px"></asp:TextBox>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                        <td>FECHA SALIDA</td>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:TextBox ID="txtFechaS" runat="server"></asp:TextBox>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            TELEFONO
                                        </td>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel30" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:TextBox ID="txtNro_Telefono" runat="server"></asp:TextBox>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align:top">OBSERVACIÓN</td>
                                        <td colspan ="3">
                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:TextBox ID="txtObs_Tec" runat="server" Width="105%" Height="55px" TextMode="MultiLine"></asp:TextBox>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                </table>                                                
                            </td>
                            <td >

                            </td>
                            <td style="vertical-align:top" >
                                <asp:UpdatePanel ID="UpdatePanel31" runat="server">
                                    <ContentTemplate>
                                        <asp:ImageButton ID="btnAgregar" ToolTip="Adicionar" runat="server" ImageUrl="../Images/Mantenimiento/icon.ico" CssClass="ImagenBoton" OnClientClick="mostrarPopupTecnico('Lista de Técnicos',500,300);" OnClick="btnAgregar_Click1"/>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                    </fieldset>
                    
                </td>
               <td style="width:50%">
                   <fieldset>
                       <legend>
                           LISTADO DE ATENCIONES
                       </legend>
                       <table>
                        <tr>                                
                            <td style="width:90%;vertical-align:top">
                                <div style="width:100%; height:100px; overflow:auto">
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:GridView ID="gvAtenciones" runat="server"  AutoGenerateColumns="False" CellPadding="4" AllowPaging="True" PageSize="5" ShowHeaderWhenEmpty="True" onpageindexchanging="gvAtenciones_PageIndexChanging" BackColor="White" BorderColor="gray" BorderStyle="None" BorderWidth="1px" Width="575px" >
                                                <HeaderStyle Height="30px" />
                                                <Columns>                                                    
                                                    <asp:BoundField HeaderText="ID_Aten"/>                                                    
                                                    <asp:BoundField HeaderText="Abonado"/>
                                                    <asp:BoundField HeaderText="Fecha_Inicio"/>
                                                    <asp:BoundField HeaderText="Estado_Inicio"/>
                                                    <asp:BoundField HeaderText="Fecha_Fin"/>
                                                    <asp:BoundField HeaderText="Estado_Fin"/>
                                                    <asp:BoundField HeaderText="Observacion"/>
                                                </Columns>
                                                <EmptyDataTemplate></EmptyDataTemplate>
                                                <FooterStyle BackColor="#99CCCC" HorizontalAlign="Center" ForeColor="#003399" />
                                                <HeaderStyle BackColor="black" Font-Size="9pt"  ForeColor="white" Font-Bold="True"  />
                                                <PagerSettings FirstPageText="l&lt;" LastPageText="&gt;l" NextPageText="&gt;" PreviousPageText="&lt;" />
                                                <PagerStyle BackColor="black" ForeColor="white" HorizontalAlign="Left" Font-Size="8pt"  />
                                                <RowStyle BackColor="black" Font-Size="8pt" ForeColor="white" />
                                                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                                <SortedDescendingHeaderStyle BackColor="#002876" />
                                            </asp:GridView>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </td>
                        </tr>
                        <tr>
                                
                            <td colspan="2">
                                <asp:UpdatePanel  runat="server">
                                    <ContentTemplate>
                                        <asp:Button ID="btnIniciar" runat="server" Text="Iniciar" CssClass="btn btn-primary" Width="86px" OnClientClick="mostrarEmergenteTEnvioMsm('Envio automático MSM','350','170')" />
                                        <asp:Button ID="btnDetener" runat="server" Text="Detener" CssClass="btn btn-primary" Width="86px"/>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                
                            </td>
                        </tr>
                    </table>

                   </fieldset>
                                                    
                                                                      
                </td>
            </tr>
            <tr>
                <td style="width:100%">
                    <fieldset style="vertical-align:top">
                        <legend>
                            ABONADO(S)
                        </legend>
                        <table style="width:100%;height:140px" >
                        
                                                        
                                <asp:UpdatePanel ID="UpdatePanel24" runat="server">
                                    <ContentTemplate>
                                        <asp:HiddenField ID="hdfMantEstado" runat="server" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>                                
                                <asp:UpdatePanel ID="UpdatePanel25" runat="server">
                                    <ContentTemplate>
                                        <asp:HiddenField ID="hdfIndex" runat="server" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>                                
                        
                        <tr>
                            <td style="vertical-align:top;width:100%">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:GridView ID="gvAbonado" runat="server" AutoGenerateColumns="False" CellPadding="4" AllowPaging="True" PageSize="5" ShowHeaderWhenEmpty="True" OnPageIndexChanging="gvAbonado_PageIndexChanging" Width="99%" OnRowCommand="gvAbonado_RowCommand" BackColor="White" BorderColor="gray" BorderStyle="None" BorderWidth="1px">
                                            <Columns>
                                                <asp:BoundField HeaderText="Distri." DataField="DealerCode">
                                                <HeaderStyle Height="30px" />
                                                </asp:BoundField>
                                                <asp:BoundField HeaderText="Id. Local" DataField="LocalID"/>
                                                <asp:BoundField HeaderText="Id. Abonado" DataField="csid"/>
                                                <asp:BoundField HeaderText="Oficina" DataField="subscribername"/>
                                                <asp:BoundField HeaderText="Observacion" DataField="Observaciones"/>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="btnEditar" runat="server" ImageUrl="~/Images/Mantenimiento/edit.png"
                                                            CommandName="EditarAbon"
                                                            CausesValidation="false"
                                                            CommandArgument="<%# ((GridViewRow)Container).RowIndex %>"
                                                            ToolTip="Editar"
                                                            />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="btnEliminar" runat="server" ImageUrl="~/Images/Mantenimiento/delete.png"
                                                            CommandName="EliminarAbon"
                                                            CausesValidation="false"
                                                            CommandArgument="<%# ((GridViewRow)Container).RowIndex %>"
                                                            ToolTip="Eliminar"
                                                            OnClientClick="return confirm('¿Desea eliminar el registro?');"
                                                            />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                            </Columns>
                                                
                                            <EmptyDataTemplate></EmptyDataTemplate>
                                            <FooterStyle BackColor="#99CCCC" HorizontalAlign="Center" ForeColor="#003399" />
                                            <HeaderStyle BackColor="black" Font-Size="9pt"  ForeColor="white" Font-Bold="True"  />
                                            <PagerSettings FirstPageText="l&lt;" LastPageText="&gt;l" NextPageText="&gt;" PreviousPageText="&lt;" />
                                            <PagerStyle BackColor="black" ForeColor="white" HorizontalAlign="center" Font-Size="8pt"  />
                                            <RowStyle Font-Size="8pt" BackColor="White" ForeColor="black" />
                                            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                            <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                            <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                            <SortedDescendingHeaderStyle BackColor="#002876" />
                                        </asp:GridView>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnAceptarListarSub" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>

                           <td class="auto-style2">

                            </td>
                                                 
                            <td style="vertical-align: top"  >
                                                                
                                <asp:UpdatePanel ID="UpdatePanel33" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:ImageButton ID="btnAdicionar" ToolTip="Adicionar" runat="server" ImageUrl="../Images/Mantenimiento/add_16_h.ico" CssClass="ImagenBotonMargin" OnClientClick="mostrarPopupAbonado('AGREGANDO ABONADO ...',920,550);" OnClick="btnAdicionar_Click"/>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>                                                            
                        </tr>
                    </table>
                    </fieldset>
                    
                </td>
                <td style="vertical-align:central">
                    <fieldset>
                        <legend>
                            RECEPCIÓN DE SEÑALES
                        </legend>
                        <table style="width:99%;height:40px">
                        
                        <tr>
                              <td style=" vertical-align:central">                               
                                <table style="width:100%;font-size:12PX">
                                    <tr>
                                        <td>TIEMPO FALTANTE : 0 SEGUNDOS</td>
                                    </tr>
                                </table>                                
                            </td>
                        </tr>
                    </table>
                    </fieldset>
                    
                        

                </td>
            </tr>
            
            <tr>
                <td>
                    <table style="width:99%;height:140px; border: 1px solid #999999;border-radius:5px">
                        <tr>
                            <td>
                                <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Height="100%" Width="100%">
                        <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="Reporte Tecnico" >
                            <ContentTemplate>
                                <table style="width:100%">
                                    <tr>
                                        <td style="width:50%">
                                            <div>
                                                <table class="CabeceraScroll" style="background-color:black; font-size:11px; color:white; width:100%">
                                                    <tr>
                                                        <td>
                                                            Tipo Mantenimiento
                                                        </td>
                                                    </tr>
                                                </table>
                                                    
                                            </div>
                                            <div style="height:120px; overflow:auto">
                                                <asp:GridView ID="gvTipoMantenimiento" runat="server" AutoGenerateColumns="False" CellPadding="4" onpageindexchanging="gvTipoMantenimiento_PageIndexChanging" SkinID="gvwBusqueda" CssClass="mGrid" ShowHeader="False" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" ForeColor="Black" GridLines="Horizontal" >
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
                                            </div>
                                        </td>
                                        <td style="width:10%; padding-left:6%">
                                            <asp:CheckBoxList ID="chkCaidas" runat="server">
                                                    
                                                <asp:ListItem Text="ALT" Value="ALT"></asp:ListItem>
                                                <asp:ListItem Text="BB" Value="BB"></asp:ListItem>
                                                <asp:ListItem Text="FAC" Value="FAC"></asp:ListItem>
                                                <asp:ListItem Text="RED" Value="RED"></asp:ListItem>
                                                <asp:ListItem Text="ACL" Value="ACL"></asp:ListItem>
                                                <asp:ListItem Text="AA" Value="AA"></asp:ListItem>
                                                    
                                            </asp:CheckBoxList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table style="width:100%">
                                                <tr>
                                                    <td style="width:85%">
                                                        <asp:Button ID="btnMarcar" runat="server" Text="Marcar Todos" />
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="btnDesmarcar" runat="server" Text="Desmarcar Todos"/>
                                                    </td>
                                                </tr>
                                            </table>
                                                
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="border-top:solid">&nbsp; </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <table style="width:100%">
                                                <tr>
                                                    <td>
                                                        Panel
                                                    </td>
                                                    <td style="width:45%">
                                                        <asp:TextBox ID="txtPanel" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        Nro. Telefono
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtTelefono" runat="server" ></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2"></td>
                                                    <td>
                                                        Nro. Informe
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtInforme" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                    
                            </ContentTemplate>
                                
                        </asp:TabPanel>
                        <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="Señales Especiales">
                        </asp:TabPanel>
                    </asp:TabContainer>

                            </td>
                        </tr>
                    </table>
                </td>
                
                <td>
                    <table style="width:99%;height:280px; border: 1px solid #999999;border-radius:5px">
                        <tr>
                            <td >
                                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="imjusttext">Trabajos Pendiente: GENERALES</asp:HyperLink>
                            </td>
                            <td style="width:20px">&nbsp;</td>
                            <td >
                                <asp:HyperLink ID="HyperLink2" runat="server" CssClass="imjusttext">Observaciones</asp:HyperLink>
                            </td>
                            <td style="width:150px">&nbsp;</td>
                            <td>
                                <asp:Button ID="btnHistorial" runat="server" CssClass="btn btn-primary" Text="Historial de Señales" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5" style="vertical-align:central">
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server" >
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
                </td>
            
            </tr>
        
        </table>
    </div>

    <div id="emergente" class="ventana">
        <div class="undraggable" style="width:100%;">
			<table style="width:100% ; border-spacing:0px 0px; ">
				<tr style="background:linear-gradient(#525252,black);" onmouseover="this.style.cursor='move'">
					<td style="width:100%; height:30px; text-align:center; font: bold 14px Tahoma;color:white;">&nbsp;&nbsp;
					<span id="titcabemergente">&nbsp;</span>&nbsp;&nbsp;</td>
					<td id="tdemergentecerrar" class="cerrar" style="width:24px; height:30px ; background-image:url('../Images/equisx.png'); background-repeat:no-repeat; cursor:pointer; text-align:right" onclick="SalirPopupComentario();">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
			</table>
		</div>

        <div id="emergentecuerpo">
            <table style="width:100%"> 
                <tr>                                        
                    <td>
                        <div>
                            <table style="width:100%">
                                <tr>
                                    <td>                                        
                                        <asp:UpdatePanel ID="UpdatePanel39" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:ImageButton ID="btnNuevo" ToolTip="Nuevo" runat="server" ImageUrl="../Images/Mantenimiento/NewDoc.png" CssClass="ImagenBoton"/>
                                                <asp:Button ID="btZona" runat="server" Text="Button" style="display:none" OnClick="btZona_Click"  />
                                                <asp:TextBox id="txtZonaC" runat="server" Width="45px" style="display:none" ></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>        
                            </table>                        
                            <table style="width:100%">
                                <tr>
                                    <td style="vertical-align:top;width:100%;">
                                        <asp:UpdatePanel ID="UpdatePanel40" runat="server" >
                                            <ContentTemplate>
                                                <asp:GridView ID="gvComentario" runat="server" AllowPaging="True" CssClass="mGrid" AutoGenerateColumns="False" Width="800px" OnPageIndexChanging="gvComentario_PageIndexChanging">
                                                    <Columns>                                    
                                                        <asp:BoundField HeaderText="Fecha" DataField="Fecha" />
                                                        <asp:BoundField HeaderText="Comentario" DataField="Comentario" />
                                                        <asp:BoundField HeaderText="Usuario" DataField="Usuario" />
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
                                                <asp:Button ID="btnAceptarComentario" runat="server" Width="70" Text="Aceptar" Class="btn btn-primary" OnClientClick="SalirPopupComentario()"/></td>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td style="width:80px">
                                    </td>    
                                    <td>
                                        <asp:Button ID="btnCancelarComentario" runat="server" Width="70" Text="Cancelar" Class="btn btn-primary" OnClientClick="SalirPopupComentario()" />                                        
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

    <div id="emerTecnico" class="ventana" >
        <div class="undraggable" style="width:100%;">
			<table style="width:100% ; border-spacing:0px 0px; ">
				<tr style="background: linear-gradient(#525252,black);" onmouseover="this.style.cursor='move'">
					<td style="width:100%; height:30px; text-align:center; font: bold 14px Tahoma;color:white;">&nbsp;&nbsp;
					<span id="titcabemerTecnico">&nbsp;</span>&nbsp;&nbsp;</td>
					<td id="tdemerTecnicocerrar" class="cerrar" style="width:24px; height:30px ; background-image:url('../Images/equisx.png'); background-repeat:no-repeat; cursor:pointer; text-align:right" onclick="SalirPopupTecnico();">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
			</table>
		</div>
        <div id="fondoemergenteTec" class="fondo">&nbsp;</div>
        <div id="emerTecnicocuerpo">
            <table style="width:100%"> 
                <tr>                                        
                    <td>
                        
                        <div>
                            <table style="width:100%">
                                <tr>
                                    <td>
                                        Proveedor
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtBsProveedorName" runat="server" onkeyup="ListarTecnico();" ></asp:TextBox>
                                    </td>
                                    <td>
                                        Técnico
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtBNombres" runat="server" onkeyup="ListarTecnico();"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                                            <ContentTemplate>
                                                <asp:Button ID="btnListarTecnico" runat="server" Text="Buscar" OnClick="btnListarTecnico_Click" style="display:none;" />
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        
                                    </td>
                                </tr>
                                <tr>
            
                                    <td colspan="5" style="height:190px">
                                        <div style="overflow:scroll;height:180px;width:100%">
                                            <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                                            <ContentTemplate>
                                                <asp:GridView ID="gvListadoTecnicos" runat="server" Width="100%" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                                                    <Columns>
                                                        <asp:BoundField DataField="ProveedorID" HeaderText="ProveedorID">
                                                        <HeaderStyle CssClass="ColumnaOculta" />
                                                        <ItemStyle CssClass="ColumnaOculta" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="sProveedorName" HeaderText="Proveedor" />
                                                        
                                                        <asp:BoundField DataField="PersonalID" HeaderText="PersonalID">
                                                        <HeaderStyle CssClass="ColumnaOculta" />
                                                        <ItemStyle CssClass="ColumnaOculta" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="Nombres" HeaderText="Técnico" />
                                                        <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" ButtonType="Image" SelectImageUrl="../Images/Select.png"></asp:CommandField>
                                                    </Columns>
                                                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
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
                        </div>
                        
                        <div>
                            <table style="margin: 0 auto;">
                                <tr>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:Button ID="btnAceptarListarTec" runat="server" Width="70" Text="Aceptar" Class="btn btn-primary" OnClientClick="SalirPopupTecnico()" OnClick="btnAceptarListarTec_Click"/></td>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td style="width:80px">
                                    </td>    
                                    <td>
                                        <asp:Button ID="btnCancelarListarTec" runat="server" Width="70" Text="Cancelar" Class="btn btn-primary" OnClientClick="SalirPopupTecnico()" />                                        
                                    </td>                                
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
         </div>
    </div>

    <div id="emerAbonado" class="ventana" >
        <div class="undraggable" style="width:100%;">
			<table style="width:100% ; border-spacing:0px 0px; ">
				<tr style="background: linear-gradient(#525252,black);" onmouseover="this.style.cursor='move'">
					<td style="width:100%; height:30px; text-align:center; font: bold 14px Tahoma;color:white;">&nbsp;&nbsp;
					<span id="titcabemerAbonado">&nbsp;</span>&nbsp;&nbsp;</td>
					<td id="tdemerAbonadocerrar" class="cerrar" style="width:24px; height:30px ; background-image:url('../Images/equisx.png'); background-repeat:no-repeat; cursor:pointer; text-align:right" onclick="SalirPopupAbonado();">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
			</table>
		</div>
        <div id="fondoemergenteAbon" class="fondo">&nbsp;</div>
        <div id="emerAbonadocuerpo">
            <table style="width:100%"> 
                <tr>                                        
                    <td>                
                        <div >                            
                            <table style="width:100%">
                                <tr>                                    
                                    <td>
                                        <div>
                                            <fieldset style="border-color:black">
                                                 <legend style="font-weight:bold;">
                                                    REGISTRO(S)
                                                </legend>
                                                <table style="width:100%" >
                                                <tr>
                                    
                                    <td>
                                       COD. DISTRIB.
                                    </td>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel12" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtBDealerCode" onkeyup="ListarSubscriber();" runat="server"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td>
                                        ABONADO
                                    </td>      
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel13" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtBCsid" runat="server" onkeyup="ListarSubscriber();"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>                              
                                    <td>
                                        OFICINA
                                    </td>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel14" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtBSubscriberName" runat="server" onkeyup="ListarSubscriber();"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td >
                                        <asp:UpdatePanel ID="UpdatePanel16" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:Button ID="btnListarSubcriber" runat="server" Text="Buscar" style="display:none;" OnClick="btnListarSubcriber_Click"  />
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>                                
                                <tr>
                                    <td colspan="6" style="height:200px;width:100%;vertical-align:top" >
                                        
                                            <asp:UpdatePanel ID="UpdatePanel15" runat="server" UpdateMode="Conditional" >
                                            <ContentTemplate>
                                                <asp:GridView ID="gvListarSubscriber" runat="server" Width="100%" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" AllowPaging="True" OnPageIndexChanging="gvListarSubscriber_PageIndexChanging" GridLines="Horizontal" PageSize="5" OnSelectedIndexChanged="gvListarSubscriber_SelectedIndexChanged">
                                                    <Columns>
                                                        <asp:BoundField DataField="DealerCode" HeaderText="COD. DISTRIB." />
                                                        <asp:BoundField DataField="DealerName" HeaderText="DISTRIBUIDOR" />
                                                        <asp:BoundField DataField="csid" HeaderText="ABONADO" />
                                                        <asp:BoundField DataField="SubscriberName" HeaderText="OFICINA" />
                                                        <asp:BoundField DataField="Localid" HeaderText="COD. LOCAL" />
                                                        <asp:BoundField DataField="LocalDes" HeaderText="DESCRIP. LOCAL" />                                                        
                                                        <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" ButtonType="Image" SelectImageUrl="../Images/Select.png"></asp:CommandField>
                                                    </Columns>
                                                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="Black" ForeColor="White" HorizontalAlign="Center" />
                                                    <PagerSettings Mode="NumericFirstLast" />
                                                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                                    <SortedDescendingHeaderStyle BackColor="#242121" />
                                                </asp:GridView>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnListarSubcriber" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="btnAdicionar" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                                                               
                                    </td>
                                </tr>
                                            </table>
                                            </fieldset>
                                            
                                        </div>
                                    </td>
                                </tr>

                                
                                
                                <tr>
                                    <td colspan="6" style="text-align:left">
                                        <div>
                                            <fieldset style="border-color:black">
                                                <legend style="font-weight:bold;">
                                                    DATOS DEL REGISTRO SELECCIONADO
                                                </legend>
                                                <table style="text-align:left">

                                                <tr>
                                    <td>
                                        COD. DISTRIB.
                                    </td>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel19" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtSelDealercode" runat="server" Height="17px" Width="80px" ReadOnly="true"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>                                    
                                    <td>
                                        DISTRIBUIDOR
                                    </td>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel17" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtSelDealerName" runat="server" ReadOnly="true"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>                                    

                                </tr>
                                <tr>
                                    <td>
                                        ABONADO
                                    </td>

                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel20" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtSelCsid" runat="server" Height="17px" Width="80px" ReadOnly="true"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td>
                                        OFICINA
                                    </td>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel18" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtSelSubscriberName" runat="server" Height="18px" Width="405px" ReadOnly="true"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                              <tr>
                                  <td>
                                      COD. LOCAL
                                  </td>
                                  <td>
                                      <asp:UpdatePanel ID="UpdatePanel22" runat="server">
                                          <ContentTemplate>
                                              <asp:TextBox ID="txtSelLocalid" runat="server" ReadOnly="true"></asp:TextBox>
                                          </ContentTemplate>
                                      </asp:UpdatePanel>
                                  </td>
                                  <td>
                                      DESCRIP. LOCAL
                                  </td>
                                  <td>
                                      <asp:UpdatePanel ID="UpdatePanel23" runat="server">
                                          <ContentTemplate>
                                              <asp:TextBox ID="txtSelLocaldes" runat="server" ReadOnly="true"></asp:TextBox>
                                          </ContentTemplate>
                                      </asp:UpdatePanel>
                                  </td>
                              </tr>

                               <tr>
                                    <td style="vertical-align:top" >
                                        OBSERVACIÓN
                                    </td>
                                    <td colspan="4">
                                        <asp:UpdatePanel ID="UpdatePanel21" runat="server" UpdateMode="Conditional" >
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtSelObservacion" runat="server" TextMode="MultiLine" Height="61px" Width="324px"></asp:TextBox>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="gvAbonado" EventName="RowCommand" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>

                                            </table>
                                            </fieldset>
                                            
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="width:100%">
                                        <div style="margin-top: 20px" >
                                            <table style="margin: 0 auto;">
                                            <tr>
                                                <td>
                                                    <asp:UpdatePanel ID="UpdatePanel43" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:Button ID="btnAceptarListarSub" runat="server" Width="70" Text="Aceptar" Class="btn btn-primary" OnClientClick="SalirPopupAbonado()" OnClick="btnAceptarListarSub_Click"/></td>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                                <td style="width:80px">
                                                </td>    
                                                <td>
                                                    <asp:Button ID="btnCancelarListarSub" runat="server" Width="70" Text="Cancelar" Class="btn btn-primary" OnClientClick="SalirPopupAbonado()" />                                        
                                                </td>                                
                                            </tr>
                                        </table>
                                        </div>                                        
                                    </td>                                    
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
         </div>
    </div>

    <div id="emerSubs" class="ventana">
        <div class="undraggable" style="width:100%;">
			<table style="width:100% ; border-spacing:0px 0px; ">
				<tr style="background: linear-gradient(#525252,black);" onmouseover="this.style.cursor='move'">
					<td style="width:100%; height:30px; text-align:center; font: bold 14px Tahoma;color:white;">&nbsp;&nbsp;
					<span id="titcabemerSubs">&nbsp;</span>&nbsp;&nbsp;</td>
					<td id="tdemerSubscerrar" class="cerrar" style="width:24px; height:30px ; background-image:url('../Images/equisx.png'); background-repeat:no-repeat; cursor:pointer; text-align:right" onclick="SalirEmergenteSubs();">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
			</table>
		</div>

        <div id="emerSubscuerpo">
            <table style="width:100%"> 
                <tr>                                        
                    <td>
                        <div style="width:100%">
                            <table style="width:100%">
                                <tr>
                                    <td class="EtiquetaPop">
                                        Distribuidor                                        
                                    </td>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel49" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtDCode" runat="server" style="width:50px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel51" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtDName" ReadOnly="true" runat="server" style="width:220px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td class="EtiquetaPop">
                                        Abonado
                                    </td>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel52" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtACode" runat="server" style="width:50px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel53" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtAName" runat="server" style="width:220px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td>                                        
                                        <asp:UpdatePanel ID="UpdatePanel34" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:Button ID="btnBuscarSubscriber" runat="server" Width="70" Text="Buscar" Class="btn btn-primary" OnClick="btnBuscarSubscriber_Click" /></td>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>        
                            </table>                        
                            <table style="width:100%; height:380px">
                                <tr>
                                    <td style="vertical-align:top;width:100%;">
                                        <asp:UpdatePanel ID="UpdatePanel35" runat="server" >
                                            <ContentTemplate>
                                                <asp:GridView ID="gvSubscriber" runat="server" AllowPaging="True" CssClass="mGrid" AutoGenerateColumns="False" Width="100%" OnPageIndexChanging="gvSubscriber_PageIndexChanging" >
                                                    <Columns>                                    
                                                        <asp:BoundField HeaderText="Distribuidor" DataField="DealerCode" />
                                                        <asp:BoundField HeaderText="Abonado" DataField="CSID" />
                                                        <asp:BoundField HeaderText="Oficina" DataField="SubscriberName" />
                                                        <asp:BoundField HeaderText="Estado" DataField="estado" />                                                        
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
                            <div style="margin-top:10px;margin-left:270px;">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel36" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:Button ID="btnAceptarSubscriber" runat="server" Width="70" Text="Aceptar" Class="btn btn-primary" OnClientClick="SalirEmergenteSubs()"  /></td>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                        <td style="width:80px">
                                        </td>    
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel37" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:Button ID="btnCancelarSubscriber" runat="server" Width="70" Text="Cancelar" Class="btn btn-primary" OnClientClick="SalirEmergenteSubs()" />                                        
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
                                        <asp:UpdatePanel ID="UpdatePanel47" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtDealer" runat="server" style="width:50px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel48" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtNameDealer" runat="server" style="width:220px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td>                                        
                                        <asp:UpdatePanel ID="UpdatePanel38" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:Button ID="btnBuscarDealer" runat="server" Width="70" Text="Buscar" Class="btn btn-primary" OnClick="btnBuscarDealer_Click" /></td>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>        
                            </table>                        
                            <table style="width:100%; height:215px">
                                <tr>
                                    <td style="vertical-align:top;width:100%;">
                                        <asp:UpdatePanel ID="UpdatePanel44" runat="server" >
                                            <ContentTemplate>
                                                <asp:GridView ID="gvDealer" runat="server" AllowPaging="True" CssClass="mGrid" AutoGenerateColumns="False" Width="100%" OnPageIndexChanging="gvDealer_PageIndexChanging">
                                                    <Columns>                                    
                                                        <asp:BoundField HeaderText="Codigo" DataField="DealerCode" />
                                                        <asp:BoundField HeaderText="Distriuidor" DataField="DealerName" />
                                                        <asp:CommandField ButtonType="Button" SelectText="Seleccionar" ShowSelectButton="True" >
                                                            <ControlStyle CssClass="btn btn-primary" />
                                                            <ItemStyle HorizontalAlign="Center" />
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
                            <div style="margin-top:10px;margin-left:110px;">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel45" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:Button ID="btnAceptar_Dealer" runat="server" Width="70" Text="Aceptar" Class="btn btn-primary" OnClientClick="SalirEmergenteDealer()" OnClick="btnAceptar_Dealer_Click"/></td>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                        <td style="width:80px">
                                        </td>    
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel46" runat="server" UpdateMode="Conditional">
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

    <div id="emerTEnvioMsm" class="ventana">
        <div class="undraggable" style="width:100%;">
			<table style="width:100% ; border-spacing:0px 0px; ">
				<tr style="background: linear-gradient(#525252,black);" onmouseover="this.style.cursor='move'">
					<td style="width:100%; height:30px; text-align:center; font: bold 14px Tahoma;color:white;">&nbsp;&nbsp;
					<span id="titTEnvioMsm">&nbsp;</span>&nbsp;&nbsp;</td>
					<td id="tdTEnvioMsmCerrar" class="cerrar" style="width:24px; height:30px ; background-image:url('../Images/equisx.png'); background-repeat:no-repeat; cursor:pointer; text-align:right" onclick=" SalirPopupTEnvioMsm()();">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
			</table>
		</div>
        <div id="emerTEnvioMsmcuerpo">
            <table>
                <tr>
                    <td style="height:10px">

                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        Indicar dentro de cuantos minutos se empezaran a enviar los MSM de forma automática: 
                    </td>
                </tr>
                <tr>
                    <td style="height:10px">

                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align:center">
                        <asp:UpdatePanel ID="UpdatePanel54" runat="server">
                            <ContentTemplate>
                                <asp:TextBox ID="txtTMSMMinutos" runat="server"></asp:TextBox>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td style="height:10px">

                    </td>
                </tr>
                <tr>
                    <td colspan="4">

                    </td>
                </tr>
                <tr>
                    <td >
                        <table style="margin: 0 auto;">
                            <tr>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel55" runat="server">
                                        <ContentTemplate>
                                            <asp:Button ID="btnAceptarTEnvioMSM" runat="server" Text="Aceptar" CssClass="btn btn-primary" Width="80px" OnClick="btnAceptarTEnvioMSM_Click" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                                <td style="width:35px">

                                </td>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel56" runat="server">
                                        <ContentTemplate>
                                            <asp:Button ID="btnCancelarTEnvioMSM" runat="server" Text="Cancelar" CssClass="btn btn-primary" Width="80px" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>   
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
         </div>
    </div>

    <script type="text/javascript">

        $(function () {
            $("#emergente").draggable({ handle: 'div.undraggable' });
            $("#emerTecnico").draggable({ handle: 'div.undraggable' });
            $("#emerAbonado").draggable({ handle: 'div.undraggable' });
            $("#emerSubs").draggable({ handle: 'div.undraggable' });
            $("#emerDealer").draggable({ handle: 'div.undraggable' });
            $("#emerTEnvioMsm").draggable({ handle: 'div.undraggable' });
        });

        function mostrarPopupComentario(titulo, ancho, alto) {
            $("#tdemergentecerrar").show();
            $("#fondoemergente").css('display', 'block');
            $("#titcabemergente").html('Comentarios y/o Trabajos Pendientes - Zona: ' + titulo);
            document.getElementById('ContentPlaceHolder1_txtZonaC').value = titulo;
            (document.getElementById('ContentPlaceHolder1_btZona')).click();
            mostrarCentrarDiv('emergente', ancho, alto);
        }

        function mostrarPopupTecnico(titulo, ancho, alto) {
            $("#tdemerTecnicocerrar").show();
            $("#fondoemergente").css('display', 'block');
            $("#titcabemerTecnico").html(titulo);
            mostrarCentrarDiv('emerTecnico', ancho, alto);
        }

        function mostrarPopupAbonado(titulo, ancho, alto) {
            $("#tdemerAbonadocerrar").show();
            $("#fondoemergente").css('display', 'block');
            $("#titcabemerAbonado").html(titulo);
            mostrarCentrarDiv('emerAbonado', ancho, alto);
        }

        function mostrarEmergenteSubs(titulo, ancho, alto) {
            $("#tdemerSubscerrar").show();
            $("#fondoemergenteAbon").css('display', 'block');
            $("#titcabemerSubs").html(titulo);
            mostrarCentrarDiv('emerSubs', ancho, alto);
        }

        function mostrarEmergenteDealer(titulo, ancho, alto) {
            $("#tdemerDealercerrar").show();
            $("#fondoemergenteAbon").css('display', 'block');
            $("#titcabemerDealer").html(titulo);
            mostrarCentrarDiv('emerDealer', ancho, alto);
        }

        function mostrarEmergenteTEnvioMsm(titulo, ancho, alto) {
            $("#tdTEnvioMsmcerrar").show();
            $("#fondoemergente").css('display', 'block');
            $("#titTEnvioMsm").html(titulo);
            mostrarCentrarDiv('emerTEnvioMsm', ancho, alto);
        }        

        function SalirPopupComentario() {
            $("#fondoemergente").hide();
            $("#emergente").hide();
        }

        function SalirPopupTecnico() {
            $("#fondoemergente").hide();
            $("#emerTecnico").hide();
        }

        function SalirPopupAbonado() {
            $("#fondoemergente").hide();
            $("#emerAbonado").hide();
        }

        function SalirEmergenteSubs() {
            $("#fondoemergenteAbon").hide();
            $("#emerSubs").hide();
        }

        function SalirEmergenteDealer() {
            $("#fondoemergenteAbon").hide();
            $("#emerDealer").hide();
        }

        function SalirPopupTEnvioMsm() {
            $("#fondoemergente").hide();
            $("#emerTEnvioMsm").hide();
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
        }

        function GetDealer() {

            var disdes = $("#ContentPlaceHolder1_txtDealercode").val();

            if (disdes.length == 0) {
                $("#ContentPlaceHolder1_txtDealerName").val("");
            }
            else {
                (document.getElementById('ContentPlaceHolder1_btnBusCodDistribuidor')).click();
            }
        }

        function ListarTecnico(){

            (document.getElementById('ContentPlaceHolder1_btnListarTecnico')).click();
            
        }

        function ListarSubscriber() {

            (document.getElementById('ContentPlaceHolder1_btnListarSubcriber')).click();

        }

    </script>

</asp:Content>