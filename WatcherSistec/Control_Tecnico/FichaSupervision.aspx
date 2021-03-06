﻿<%@ Page Title="" Language="C#" MasterPageFile="~/General/Principal.Master" AutoEventWireup="true" CodeBehind="FichaSupervision.aspx.cs" Inherits="WatcherSistec.Control_Tecnico.FichaSupervision" %>
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

        .auto-style5 {
            height: 18px;
        }

        .auto-style7 {
            height: 18px;
            width: 73px;
        }

        .auto-style9 {
            height: 50px;
            width: 50px;
        }
        
        .auto-style10 {
            width: 61%;
        }
        
        .auto-style11 {
            width: 576px;
        }
        
    </style>

<script type="text/javascript">
    $(document).ready(function () {
        $('#ContentPlaceHolder1_txtUpFechaIngreso').datetimepicker();
        $('#ContentPlaceHolder1_txtUpFechaSalida').datetimepicker();
    });
</script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="fondoemergente" class="fondo">&nbsp;</div>
    <div style="height:100%">
        <table style="height:1px">
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel57" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Timer ID="tmrActualizarZonas" runat="server" Interval="2000" OnTick="tmrActualizarZonas_Tick" ></asp:Timer>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnAceptarTEnvioMSM" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btnAceptarModiAten" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>                    
                </td>
            </tr>
        </table>
        <table class="cab_context" style="width:100%">
            <tr>
                <td style="width:120px">
                    FICHA NRO :
                </td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel29" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:TextBox ID="txtID_Ficha" runat="server" ReadOnly="true" Width="83px"></asp:TextBox>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnGuardar" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
                <td style="width:25px">

                </td>
                <td style="width:150px">
                    <asp:UpdatePanel ID="UpdatePanel26" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar"  Width="120px" Height="30px" OnClick="btnGuardar_Click" />
                        </ContentTemplate>
                    </asp:UpdatePanel>                    
                </td>
                <td style="width:150px">
                     <asp:UpdatePanel ID="UpdatePanel27" runat="server">
                        <ContentTemplate>
                            <asp:Button ID="btnCancelar"  runat="server" Text="Cancelar" Width="120px" Height="30px" Enabled="False" OnClick="btnCancelar_Click"  />        
                        </ContentTemplate>
                    </asp:UpdatePanel>                        
                </td>
                <td style="width:150px">
                    <asp:UpdatePanel ID="UpdatePanel28" runat="server">
                        <ContentTemplate>
                            <asp:Button ID="btnPendiente"  runat="server" Text="Ficha" class="btn btn-success" Width="120px" Height="30px" Enabled="False" OnClick="btnPendiente_Click" />
                        </ContentTemplate>
                    </asp:UpdatePanel>                                            
                </td>
                 <td style="width:150px">
                     <asp:UpdatePanel ID="UpdatePanel82" runat="server">
                         <ContentTemplate>
                             <asp:Button ID="btnConcluir"  runat="server" Text="Concluir" Width="120px" Height="30px" Enabled="False" OnClick="btnConcluir_Click" />
                         </ContentTemplate>
                     </asp:UpdatePanel>
                    
                </td>
                
                <td style="width:150px">
                    <asp:CheckBox ID="chksms" runat="server" Text="SMS AUTO" CssClass="Etiqueta" />
                </td>
                <td style="width:150px">
                    
                </td>
                <td style="width:150px">
                    <asp:Button ID="btnsms" runat="server" Text="SMS" Width="50px" Height="30px" />
                </td>
                <td>

                </td>
                <td style="display:none">
                    <asp:ImageButton ID="imgClose" runat="server" ImageUrl="~/Images/Close.png" />
                </td>
            </tr>
        </table>

        <table style="width:100%">
            <tr>
                <td id="col1">
                    <div>
                        
                        <asp:UpdatePanel ID="UpdatePanel81" runat="server">
                            <ContentTemplate>
                                <asp:HiddenField ID="hdfEstadoFicha" runat="server" />
                            </ContentTemplate>
                        </asp:UpdatePanel>

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
                                                <table style="width:100%">
                                                    <tr>
                                                       <td class="auto-style4" >FEC INGRESO</td>
                                                        <td class="auto-style4">
                                                            <asp:UpdatePanel ID="UpdatePanel8" runat="server" >
                                                                    <ContentTemplate>
                                                                        <asp:TextBox ID="txtFechaIngreso" runat="server" ReadOnly="true"></asp:TextBox>                                                    
                                                                    </ContentTemplate>
                                                                    
                                                                </asp:UpdatePanel>    
                                                        </td>
                                                        <td>FEC SALIDA</td>
                                                        <td >
                                                            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                                                <ContentTemplate>
                                                                    <asp:TextBox ID="txtFechaSalida" runat="server" ReadOnly="true" ></asp:TextBox>
                                                                </ContentTemplate>                                                                
                                                            </asp:UpdatePanel>
                                                        </td>
                                                        <td style="vertical-align:top" >
                                                            <asp:UpdatePanel ID="UpdatePanel31" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:ImageButton ID="btnAgregarTecnico" ToolTip="Adicionar" runat="server" ImageUrl="../Images/Mantenimiento/icon.ico" CssClass="ImagenBoton" OnClientClick="mostrarEmergenteUpTecnico('AGREGANDO TÉCNICO ...',650,180);" OnClick="btnAgregarTecnico_Click"/>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style5" >PROVEEDOR</td>
                                                        <td class="auto-style5">                                            
                                                            <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                                                                <ContentTemplate>
                                                                    <asp:TextBox ID="txtProveedorID" runat="server" style="display:none;" ></asp:TextBox>
                                                                    <asp:TextBox ID="txtProv" runat="server" ReadOnly="true"></asp:TextBox>
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                        <asp:AsyncPostBackTrigger ControlID="btnAceptarUpTecnico" EventName="Click" />
                                                                    </Triggers>
                                                            </asp:UpdatePanel>
                                                        </td>
                                                        <td class="auto-style7">NOMBRES </td>
                                                        <td class="auto-style5">
                                                            <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                                                <ContentTemplate>
                                                                    <asp:TextBox ID="txtPersonalID" runat="server" style="display:none;"></asp:TextBox>
                                                                    <asp:TextBox ID="txtNombre" runat="server" ReadOnly="true" Height="19px" Width="310px"></asp:TextBox>
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                        <asp:AsyncPostBackTrigger ControlID="btnAceptarUpTecnico" EventName="Click" />
                                                                    </Triggers>
                                                            </asp:UpdatePanel>
                                            
                                                        </td>
                                                        <td>
                                                            <asp:UpdatePanel ID="UpdatePanel85" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:ImageButton ID="btnLimpiarTecnico" CssClass="ImagenBoton" runat="server" ImageUrl="~/Images/Limpiar.png" OnClick="btnLimpiarTecnico_Click" />
                                                                </ContentTemplate>                                                    
                                                            </asp:UpdatePanel>
                                                        </td>
                                                        
                                                    </tr>
                                    
                                                    <tr>
                                                        <td style="vertical-align:top">OBSERVACIÓN</td>
                                                        <td colspan ="3">
                                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" >
                                                                <ContentTemplate>
                                                                    <asp:TextBox ID="txtObs_Tec" runat="server" Width="100%" Height="55px" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
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
                        <table style="width:100%">
                            <tr>
                                <td>
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
                                                    <asp:GridView ID="gvAbonado" runat="server" AutoGenerateColumns="False" CellPadding="4" AllowPaging="True" PageSize="5" ShowHeaderWhenEmpty="True" OnPageIndexChanging="gvAbonado_PageIndexChanging" Width="99%" OnRowCommand="gvAbonado_RowCommand" BackColor="White" BorderColor="Gray" BorderStyle="None" BorderWidth="1px" EmptyDataText="No Existen Registros">
                                                        <Columns>
                                                            <asp:BoundField HeaderText="Distri." DataField="DealerCode">
                                                            <HeaderStyle Height="30px" />
                                                            </asp:BoundField>
                                                            <asp:BoundField HeaderText="Id. Local" DataField="LocalID" HtmlEncode="False"/>
                                                            <asp:BoundField HeaderText="Id. Abonado" DataField="csid" HtmlEncode="False"/>
                                                            <asp:BoundField HeaderText="Oficina" DataField="subscribername" HtmlEncode="False"/>
                                                            <asp:BoundField HeaderText="Observacion" DataField="Observaciones" HtmlEncode="False"/>
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
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:RadioButton ID="rbtSelAbonado" GroupName="SuppliersGroup" runat="server" onclick="checkRadioBtn(this);" OnCheckedChanged="rbtSelAbonado_CheckedChanged"/>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                
                                                         <EmptyDataTemplate>
                                              
                                                        </EmptyDataTemplate>
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
                                                    <asp:AsyncPostBackTrigger ControlID="btnAceptarUPAbonado" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </td>

                                       <td class="auto-style2">

                                        </td>
                                                 
                                        <td style="vertical-align: top">
                                                                
                                            <asp:UpdatePanel ID="UpdatePanel33" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:ImageButton ID="btnAdicionar" ToolTip="Adicionar" runat="server" ImageUrl="../Images/Mantenimiento/add_16_h.ico" CssClass="ImagenBotonMargin" OnClientClick="mostrarEmerUpAbonado('AGREGANDO ABONADO ...',750,210);" OnClick="btnAdicionar_Click"/>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>                                                            
                                    </tr>
                                </table>
                                </fieldset>
                                </td>
                            </tr>
                        </table>
                        <table style="width:100% ;height:271px;">
                            <tr>
                                <td style="height:10px">
                                    <b></b>
                                </td>
                            </tr>
                            <tr>
                                <td style="vertical-align:top">
                                    <asp:UpdatePanel ID="UpdatePanel83" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Height="100%" Width="100%" BorderColor="#DEDEDE" >
                                                <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="REPORTE TÉCNICO" >
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
                                                            <td>

                                                            </td>
                                                            <td style="text-align:right;padding-right:28px;">
                                                                <asp:UpdatePanel ID="UpdatePanel65" runat="server">
                                                                    <ContentTemplate>
                                                                        <asp:CheckBox ID="chkSeleccion" runat="server" AutoPostBack="True" OnCheckedChanged="chkSeleccion_CheckedChanged" />
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    
                                                </div>
                                                <div style="height:120px; overflow:auto">                                                    
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
                                                </div>
                                            </td>
                                        
                                        </tr>
                                    
                                        <tr>
                                            <td style="border-top:solid">&nbsp; </td>
                                        </tr>
                                        <tr>
                                            <td >
                                                <table style="width:100%;display:none" >
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
                                                    
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    
                                </ContentTemplate>
                                
                            </asp:TabPanel>
                                                <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="SEÑALES ESPECIALES" Visible="false">
                                <ContentTemplate>
                                    <div>
                                        <table>
                                            <tr>
                                                <td>
                                                    TIPO DE CONDICIÓN
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    ABONADO
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:Button ID="Button1" runat="server" Text="Buscar" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:GridView ID="GridView1" runat="server"></asp:GridView>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </ContentTemplate>
                            </asp:TabPanel>
                                            </asp:TabContainer>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>                                    
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>

                <td id="col2">
                    <div>
                        <table>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <table style="width:100%">
                            <tr>
                                <td>
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
                                            <asp:GridView ID="gvAtenciones" runat="server"  AutoGenerateColumns="False" CellPadding="4" AllowPaging="True" ShowHeaderWhenEmpty="True" BackColor="White" BorderColor="Gray" BorderStyle="None" BorderWidth="1px" Width="575px" >
                                                <HeaderStyle Height="30px" />
                                                <Columns>                                                    
                                                    <asp:ImageField DataImageUrlField="ImagenEstado">
                                                    </asp:ImageField>
                                                    <asp:BoundField HeaderText="Nº" DataField="ID_Atencion"/>                                                    
                                                    <asp:BoundField HeaderText="Abonado" DataField="CSID" HtmlEncode="False">
                                                    </asp:BoundField>
                                                    <asp:BoundField HeaderText="Usuario" DataField="Usuario"/>
                                                    <asp:BoundField HeaderText="Fecha Inicio" DataField="Fecha_Inicio"/>
                                                    <asp:BoundField HeaderText="Est Inicio" DataField="Estado_Inicio">
                                                    <HeaderStyle CssClass="ColumnaOculta" />
                                                    <ItemStyle CssClass="ColumnaOculta" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Estado_Inicio_Des" HeaderText="Estado Inicio" />
                                                    <asp:BoundField HeaderText="Fecha Fin" DataField="Fecha_Termino" HtmlEncode="False"/>
                                                    <asp:BoundField HeaderText="Est Fin" DataField="Estado_Termino">
                                                    <HeaderStyle CssClass="ColumnaOculta" />
                                                    <ItemStyle CssClass="ColumnaOculta" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Estado_Termino_Des" HeaderText="Estado Fin">                                                    
                                                    </asp:BoundField>
                                                    <asp:BoundField HeaderText="Observación" DataField="Observaciones"/>
                                                    <asp:BoundField HeaderText="AlarmHistoryID_Inicial" DataField="AlarmHistoryID_Inicial">
                                                    <HeaderStyle CssClass="ColumnaOculta" />
                                                    <ItemStyle CssClass="ColumnaOculta" />
                                                    </asp:BoundField>
                                                    <asp:BoundField HeaderText="b_ALT" DataField="b_ALT">
                                                    <HeaderStyle CssClass="ColumnaOculta" />
                                                    <ItemStyle CssClass="ColumnaOculta" />
                                                    </asp:BoundField>
                                                    <asp:BoundField HeaderText="b_BB" DataField="b_BB">
                                                    <HeaderStyle CssClass="ColumnaOculta" />
                                                    <ItemStyle CssClass="ColumnaOculta" />
                                                    </asp:BoundField>
                                                    <asp:BoundField HeaderText="b_FAC" DataField="b_FAC">
                                                    <HeaderStyle CssClass="ColumnaOculta" />
                                                    <ItemStyle CssClass="ColumnaOculta" />
                                                    </asp:BoundField>
                                                    <asp:BoundField HeaderText="b_RED" DataField="b_RED">
                                                    <HeaderStyle CssClass="ColumnaOculta" />
                                                    <ItemStyle CssClass="ColumnaOculta" />
                                                    </asp:BoundField>
                                                    <asp:BoundField HeaderText="b_ACL" DataField="b_ACL">
                                                    <HeaderStyle CssClass="ColumnaOculta" />
                                                    <ItemStyle CssClass="ColumnaOculta" />
                                                    </asp:BoundField>
                                                    <asp:BoundField HeaderText="b_AA" DataField="b_AA">
                                                    <HeaderStyle CssClass="ColumnaOculta" />
                                                    <ItemStyle CssClass="ColumnaOculta" />
                                                    </asp:BoundField>
                                                </Columns>
                                                <EmptyDataTemplate></EmptyDataTemplate>
                                                <FooterStyle BackColor="#99CCCC" HorizontalAlign="Center" ForeColor="#003399" />
                                                <HeaderStyle BackColor="black" Font-Size="9pt"  ForeColor="white" Font-Bold="True"  />
                                                <PagerSettings FirstPageText="l&lt;" LastPageText="&gt;l" NextPageText="&gt;" PreviousPageText="&lt;" />
                                                <PagerStyle BackColor="black" ForeColor="white" HorizontalAlign="Left" Font-Size="8pt"  />
                                                <RowStyle BackColor="white" Font-Size="8pt" ForeColor="black" />
                                                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                                <SortedDescendingHeaderStyle BackColor="#002876" />
                                            </asp:GridView>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnAceptarTEnvioMSM" EventName="Click" />
                                            <asp:AsyncPostBackTrigger ControlID="btnAceptarModiAten" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                            </td>
                        </tr>
                        <tr>
                                
                            <td colspan="2">
                                <asp:UpdatePanel  runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Button ID="btnIniciar" runat="server" Text="Iniciar"  Width="86px" Height="30px" OnClick="btnIniciar_Click" OnClientClick="mostrarEmergenteTEnvioMsm('Envio de MSM',280,170)" />
                                        <asp:Button ID="btnDetener" runat="server" Text="Detener"  Width="86px" Height="30px" OnClientClick="mostrarEmergenteModiAtencion('Modificar - Supervisión - Atención',300,380)" OnClick="btnDetener_Click" Enabled="False" />
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnAceptarTEnvioMSM" />
                                        <asp:AsyncPostBackTrigger ControlID="btnAceptarModiAten" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                
                            </td>
                        </tr>
                    </table>
                       

                   </fieldset>
                                </td>
                            </tr>
                        </table>
                        <table style="width:100%">
                            <tr>
                                <td>
                                    <fieldset>
                        <legend>
                            ESTADO SEÑALES
                        </legend>
                        <table style="text-align:center">
                           <tr>
                               <td style="width:30px;height:30px; border: black 2px solid;font-size:12px;font-weight:bold; vertical-align:central;text-align:center;border-radius:8px 8px" >
                                   <asp:UpdatePanel ID="UpdatePanel50" runat="server">
                                       <ContentTemplate>                                           
                                           <asp:Label ID="lblALT" runat="server" Text="ALT" ToolTip="Corte de Linea Telefónica" style="width:30px; height:30px; font-size:12px;font-weight:bold; vertical-align:central;text-align:center;padding:15px; border-radius:8px 8px">
                                           </asp:Label>
                                           <asp:Label ID="lblALTColor" runat="server" Text="0" style="display:none"></asp:Label>
                                       </ContentTemplate>                                       
                                   </asp:UpdatePanel>
                               </td>
                               <td>
                                   &nbsp;
                               </td>
                               <td style="width:30px;height:30px; border: black 2px solid;font-size:12px;font-weight:bold; vertical-align:central;text-align:center;border-radius:8px 8px" class="auto-style9">
                                   <asp:UpdatePanel ID="UpdatePanel58" runat="server">
                                       <ContentTemplate>
                                           <asp:Label ID="lblBB" runat="server" Text="BB" ToolTip="Batería Baja" style="width:30px; height:30px; font-size:12px;font-weight:bold; vertical-align:central;text-align:center;padding:15px; border-radius:8px 8px">
                                           </asp:Label>
                                           <asp:Label ID="lblBBColor" runat="server" Text="0" style="display:none"></asp:Label>
                                       </ContentTemplate>                                       
                                   </asp:UpdatePanel>
                               </td>
                               <td>
                                   &nbsp;
                               </td>
                               <td style="width:30px;height:30px; border: black 2px solid;width:30px; height:30px; font-size:12px;font-weight:bold; vertical-align:central;text-align:center;border-radius:8px 8px">
                                   <asp:UpdatePanel ID="UpdatePanel59" runat="server">
                                       <ContentTemplate>
                                           <asp:Label ID="lblFAC" runat="server" Text="FAC" ToolTip="Falta Corriente" style="width:30px; height:30px; font-size:12px;font-weight:bold; vertical-align:central;text-align:center;padding:15px; border-radius:8px 8px">
                                           </asp:Label>
                                           <asp:Label ID="lblFACColor" runat="server" Text="0" style="display:none"></asp:Label>
                                       </ContentTemplate>                                       
                                   </asp:UpdatePanel>
                               </td>
                               <td>
                                   &nbsp;
                               </td>
                               <td style="border: black 2px solid;width:30px; height:30px; font-size:12px;font-weight:bold; vertical-align:central;text-align:center;border-radius:8px 8px">
                                   <asp:UpdatePanel ID="UpdatePanel60" runat="server">
                                       <ContentTemplate>
                                           <asp:Label ID="lblRED" runat="server" Text="RED" ToolTip="RED" style="width:30px; height:30px; font-size:12px;font-weight:bold; vertical-align:central;text-align:center;padding:15px; border-radius:8px 8px">
                                           </asp:Label>
                                           <asp:Label ID="lblREDColor" runat="server" Text="0" style="display:none"></asp:Label>
                                       </ContentTemplate>                                       
                                   </asp:UpdatePanel>
                               </td>
                               <td>
                                   &nbsp;
                               </td>
                               <td style="border: black 2px solid;width:30px; height:30px; font-size:12px;font-weight:bold; vertical-align:central;text-align:center;border-radius:8px 8px">
                                   <asp:UpdatePanel ID="UpdatePanel61" runat="server">
                                       <ContentTemplate>
                                           <asp:Label ID="lblACL" runat="server" Text="ACL" ToolTip="Corte de Línea Celular" style="width:30px; height:30px; font-size:12px;font-weight:bold; vertical-align:central;text-align:center;padding:15px; border-radius:8px 8px">
                                           </asp:Label>
                                           <asp:Label ID="lblACLColor" runat="server" Text="0" style="display:none"></asp:Label>
                                       </ContentTemplate>                                       
                                   </asp:UpdatePanel>
                               </td>
                               <td>
                                   &nbsp;
                               </td>
                               <td style="border: black 2px solid;width:30px; height:30px; font-size:12px;font-weight:bold; vertical-align:central;text-align:center;border-radius:8px 8px">
                                   <asp:UpdatePanel ID="UpdatePanel62" runat="server">
                                       <ContentTemplate>
                                           <asp:Label ID="lblAA" runat="server" Text="AA" ToolTip="Alarma Ambush" style="width:30px; height:30px; font-size:12px;font-weight:bold; vertical-align:central;text-align:center;padding:15px; border-radius:8px 8px">
                                           </asp:Label>
                                           <asp:Label ID="lblAAColor" runat="server" Text="0" style="display:none"></asp:Label>
                                       </ContentTemplate>                                       
                                   </asp:UpdatePanel>
                               </td>

                           </tr>
                       </table>
                    </fieldset>
                                </td>
                            </tr>
                        </table>
                        <table style="width:100%">
                            <tr>
                                <td style="vertical-align:central">
                    <fieldset>
                        <legend>
                            RECEPCIÓN DE SEÑALES
                        </legend>
                        <table style="width:99%;height:40px">
                        
                        <tr>
                              <td style=" vertical-align:central">                               
                                <table style="width:40%;font-size:12px">
                                    <tr>
                                        <td>TIEMPO RESTANTE :</td>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel42" runat="server" UpdateMode="Conditional" >
                                                <ContentTemplate>
                                                    <asp:Label ID="lblTiempoFaltante" runat="server" Text="0" style="font-size:15px;font-weight:bold;font-family:Tahoma" ></asp:Label>
                                                </ContentTemplate>                                                
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="tmrRecepSeniales" EventName="Tick" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </td>
                                        <td>SEGUNDOS</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel32" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:Timer ID="tmrRecepSeniales" runat="server" Enabled="False" Interval="1000" OnTick="tmrRecepSeniales_Tick"></asp:Timer>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btnAceptarTEnvioMSM" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="btnAceptarModiAten" EventName="Click" />
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
                            </tr>
                        </table>
                        <table style="width:100%;height:280px; border: 1px solid #DEDEDE;border-radius:3px">
                        <tr>                            
                            <td>
                                <table style="margin: 0 auto;">
                                    <tr>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel86" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:Button ID="btnTrabGenerales" runat="server" Text="Trabajos Pendiente: GENERALES" Height="30px" Width="250px" OnClick="btnTrabGenerales_Click" />
                                                </ContentTemplate>
                                            </asp:UpdatePanel>                                
                                        </td>
                                    </tr>
                                </table>                                
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td style="width:100%">
                                <table style="width:100%" >
                                    <tr>
                                        <td >
                                            <asp:Label ID="lblRojo" runat="server" style="width:30px; height:30px; font-size:12px;font-weight:bold; vertical-align:central;text-align:center;padding:3px; color:red" Text="ROJO: Señales sin restore"></asp:Label><br />
                                        </td>
                                        <td >
                                            <asp:Label ID="Label2" runat="server" style="width:30px; height:30px; font-size:12px;font-weight:bold; vertical-align:central;text-align:center;padding:3px;color:#F5F579;background-color:#DEDEDE" Text="FONDO AMARILLO: Comentarios"></asp:Label><br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td >
                                            <asp:Label ID="Label1" runat="server" style="width:30px; height:30px; font-size:12px;font-weight:bold; vertical-align:central;text-align:center;padding:3px; color:blue" Text="AZUL: Restore si señal"></asp:Label><br />
                                        </td>
                                        <td >
                                            <asp:Label ID="Label3" runat="server" style="width:30px; height:30px; font-size:12px;font-weight:bold; vertical-align:central;text-align:center;padding:3px; color:green" Text="VERDE: Prueba de Zona OK (Señal + Restore)"></asp:Label><br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" style="width:30px; height:30px; font-size:12px;font-weight:bold; vertical-align:central;text-align:center;padding:3px; color:black" Text="NEGRO: Zona sin prueba"></asp:Label><br />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label5" runat="server" style="width:30px; height:30px; font-size:12px;font-weight:bold; vertical-align:central;text-align:center;padding:3px; color:#00FFFF" Text="FONDO CELESTE: Trabajos Pendientes"></asp:Label><br />
                                        </td>
                                    </tr>                                    
                                    
                                </table>
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
                    </div>
                </td>
            </tr>
        </table>        
    </div>

    

    <div id="emerUpAbonado" class="ventana">

         <div class="undraggable" style="width:100%;">
			<table style="width:100% ; border-spacing:0px 0px; ">
				<tr style="background: linear-gradient(#525252,black);" onmouseover="this.style.cursor='move'">
					<td style="width:100%; height:30px; text-align:center; font: bold 14px Tahoma;color:white;">&nbsp;&nbsp;
					<span id="titcabemerUpAbonado">&nbsp;</span>&nbsp;&nbsp;</td>
					<td id="tdemerUpAbonadocerrar" class="cerrar" style="width:24px; height:30px ; background-image:url('../Images/equisx.png'); background-repeat:no-repeat; cursor:pointer; text-align:right" onclick="SalirEmerUpAbonado();">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
			</table>
		</div>
        
        <div id="fondoemerListarAbonados" class="fondo"></div>

        <div id="emerUpAbonadoCuerpo">
                        
            <table style="text-align:left">
                <tr>
                    <td>
                        COD. DISTRIB.
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel19" runat="server">
                            <ContentTemplate>
                                <asp:TextBox ID="txtUpDealercode" runat="server" Height="17px" Width="80px" ReadOnly="true"></asp:TextBox>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>                                    
                    <td>
                        DISTRIBUIDOR
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel17" runat="server">
                            <ContentTemplate>
                                <asp:TextBox ID="txtUpDealerName" runat="server" ReadOnly="true"></asp:TextBox>
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
                                <asp:TextBox ID="txtUpCsid" runat="server" Height="17px" Width="80px" ReadOnly="true"></asp:TextBox>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                    <td>
                        OFICINA
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel18" runat="server">
                            <ContentTemplate>
                                <asp:TextBox ID="txtUpSubscriberName" runat="server" Height="18px" Width="405px" ReadOnly="true"></asp:TextBox>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel78" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Button ID="btnListarAbonados" runat="server" Text="..." onclientClick="mostrarEmerListarAbonados('Lista de Abonados','750','300');" OnClick="btnListarTecnicos_Click"/>
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
                                <asp:TextBox ID="txtUpLocalid" runat="server" ReadOnly="true"></asp:TextBox>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                    <td>
                        DESCRIP. LOCAL
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel23" runat="server">
                            <ContentTemplate>
                                <asp:TextBox ID="txtUpLocaldes" runat="server" ReadOnly="true"></asp:TextBox>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>

                <tr>
                    <td style="vertical-align:top" >
                        OBSERVACIÓN
                    </td>
                    <td colspan="4">
                        <asp:UpdatePanel ID="UpdatePanel21" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:TextBox ID="txtUpObservacion" runat="server" TextMode="MultiLine" Height="61px" Width="620px"></asp:TextBox>
                            </ContentTemplate>
                                           
                        </asp:UpdatePanel>
                    </td>
                </tr>

                            </table>
            <table style="margin: 0 auto;">
                                <tr>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel79" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:Button ID="btnAceptarUPAbonado" runat="server" Width="70" Text="Aceptar" Class="btn btn-primary" OnClientClick="SalirEmerUpAbonado()" OnClick="btnAceptarUPAbonado_Click"/></td>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td style="width:80px">
                                    </td>    
                                    <td>
                                        <asp:Button ID="btnCancelarUpAbonado" runat="server" Width="70" Text="Cancelar" Class="btn btn-primary" OnClientClick="SalirEmerUpAbonado()"/>                                        
                                    </td>                                
                                </tr>
                            </table>
                                           


        </div>

    </div>

    <div id="emerListarAbonados" class="ventana" >
        <div class="undraggable" style="width:100%;">
			<table style="width:100% ; border-spacing:0px 0px; ">
				<tr style="background: linear-gradient(#525252,black);" onmouseover="this.style.cursor='move'">
					<td style="width:100%; height:30px; text-align:center; font: bold 14px Tahoma;color:white;">&nbsp;&nbsp;
					<span id="titcabemerListarAbonados">&nbsp;</span>&nbsp;&nbsp;</td>
					<td id="tdemerListarAbonadoscerrar" class="cerrar" style="width:24px; height:30px ; background-image:url('../Images/equisx.png'); background-repeat:no-repeat; cursor:pointer; text-align:right" onclick="SalirEmerListarAbonados();">
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
                                        </div>
                                    </td>
                                </tr>                           
                                
                                <tr>
                                    <td colspan="6" style="width:100%">
                                        <div style="margin-top: 3px" >
                                            <table style="margin: 0 auto;">
                                            <tr>
                                                <td>
                                                    <asp:UpdatePanel ID="UpdatePanel43" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:Button ID="btnAceptarListarSub" runat="server" Width="70" Text="Aceptar" Class="btn btn-primary" OnClick="btnAceptarListarSub_Click"/></td>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                                <td style="width:80px">
                                                </td>    
                                                <td> <asp:UpdatePanel ID="UpdatePanel80" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:Button ID="btnCancelarListarSub" runat="server" Width="70" Text="Cancelar" Class="btn btn-primary" OnClientClick="SalirEmerListarAbonados();"/>                                        
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
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
                        <asp:UpdatePanel ID="UpdatePanel54" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:TextBox ID="txtTMSMMinutos" onkeypress="soloNumerosCompleto(this,event,'0');" runat="server"></asp:TextBox>
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
                                    <asp:UpdatePanel ID="UpdatePanel55" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Button ID="btnAceptarTEnvioMSM" runat="server" Text="Aceptar" Width="80px" Height="30px" OnClick="btnAceptarTEnvioMSM_Click" OnClientClick="SalirPopupTEnvioMsm();" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                                <td style="width:35px">

                                </td>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel56" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Button ID="btnCancelarTEnvioMSM" runat="server" Text="Cancelar" Width="80px" Height="30px" OnClientClick="SalirPopupTEnvioMsm();"/>
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
    
    <div id="emerModiAtencion" class="ventana">
        <div class="undraggable" style="width:100%;">
			<table style="width:100% ; border-spacing:0px 0px; ">
				<tr style="background: black;" onmouseover="this.style.cursor='move'">
					<td style="width:100%; height:30px; text-align:center; font: bold 14px Tahoma;color:white;">&nbsp;&nbsp;
					<span id="titModiAtencion">&nbsp;</span>&nbsp;&nbsp;</td>
					<td id="tdModiAtencionCerrar" class="cerrar" style="width:24px; height:30px ; background-image:url('../Images/equisx.png'); background-repeat:no-repeat; cursor:pointer; text-align:right" onclick="SalirPopupModiAtencion();">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
			</table>
		</div>
        <div id="emerModiAtencioncuerpo" >
            <table>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        ATENCION ID
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel30" runat="server">
                            <ContentTemplate>
                                <asp:TextBox ID="txtIdAtencion" runat="server" Width="50px" ReadOnly="true"></asp:TextBox>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                    <td> 

                    </td>
                </tr>
                <tr>
                    <td>
                        USUARIO
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel67" runat="server">
                            <ContentTemplate>
                                <asp:TextBox ID="txtUsuario" runat="server" Width="200px" ReadOnly="true"></asp:TextBox>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                    <td> 

                    </td>
                </tr>   
                <tr>
                    <td>
                        F. TÉRMINO 
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel68" runat="server">
                            <ContentTemplate>
                                <asp:TextBox ID="txtFechaTermino" runat="server" Width="170" ReadOnly="true"></asp:TextBox>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                    <td> 

                    </td>
                </tr>                
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                          <asp:UpdatePanel ID="UpdatePanel70" runat="server">
                            <ContentTemplate>
                                <asp:TextBox ID="txtCsidAtencion" runat="server" Width="170"></asp:TextBox>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <fieldset>
                            <legend style="font-size:11px">
                                ESTADO
                            </legend>
                             <asp:UpdatePanel ID="UpdatePanel69" runat="server">
                                <ContentTemplate>
                                    <table>
                                <tr>
                                    <td>
                                        <asp:RadioButton ID="rbtPendiente" runat="server" text="PENDIENTE" AutoPostBack="True" GroupName="Estados" Checked="True" />
                                    </td>
                                    <td>
                                        <asp:RadioButton ID="rbtCancelada" runat="server" text="CANCELADA" AutoPostBack="True" GroupName="Estados" />
                                    </td>
                                    <td>
                                        <asp:RadioButton ID="rbtConcluida" runat="server" text="CONCLUIDA" AutoPostBack="True" GroupName="Estados" />
                                    </td>
                                </tr>
                            </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            
                            
                        </fieldset>                        
                    </td>
                    
                </tr>                                
                 <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align:top">
                        OBSERVACIÓN
                    </td>
                    <td>
                        <asp:TextBox ID="txtObsAtencion" runat="server" TextMode="MultiLine" Width="200px" Height="120px"></asp:TextBox>
                    </td>
                    <td>

                    </td>
                </tr>
            </table>
         </div>
        <div>
            <table>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </div>
        <div >
            <table style="margin: 0 auto;">
                <tr>
                    <td >
                        <table >
                            <tr>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel63" runat="server">
                                        <ContentTemplate>
                                            <asp:Button ID="btnAceptarModiAten" runat="server" Text="Aceptar" class="btn btn-success" Width="80px" OnClick="btnAceptarModiAten_Click" OnClientClick="SalirPopupModiAtencion();" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                                <td style="width:35px">

                                </td>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel66" runat="server">
                                        <ContentTemplate>
                                            <asp:Button ID="CancelarModiAten" runat="server" Text="Cancelar" class="btn btn-success" Width="80px" OnClientClick="SalirPopupModiAtencion();" />
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

    <div id="emerUpTecnico" class="ventana" >
        
        <div class="undraggable" style="width:100%;">
			<table style="width:100% ; border-spacing:0px 0px; ">
				<tr style="background: linear-gradient(#525252,black);" onmouseover="this.style.cursor='move'">
					<td style="width:100%; height:30px; text-align:center; font: bold 14px Tahoma;color:white;">&nbsp;&nbsp;
					<span id="titUpTecnico">&nbsp;</span>&nbsp;&nbsp;</td>
					<td id="tdUpTecnicoCerrar" class="cerrar" style="width:24px; height:30px ; background-image:url('../Images/equisx.png'); background-repeat:no-repeat; cursor:pointer; text-align:right" onclick=" SalirPopupUpTecnico()();">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
			</table>
		</div>
        <div id="fondoemergenteListarTecnico" class="fondo"></div>
        <div id="emerUpTecnicoCuerpo">
            <table style="width:100%">                                  
                                        <tr>
                                            <td style="height:100px;vertical-align:top">                                                
                                                <table style="width:100%">
                                                    <tr>
                                                        <td>
                                                            <table style="display:none">
                                                                <tr>
                                                                     <td class="auto-style4" >FEC INGRESO</td>
                                                        <td class="auto-style4">
                                                            <asp:UpdatePanel ID="UpdatePanel71" runat="server" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        <asp:TextBox ID="txtUpFechaIngreso" runat="server" ></asp:TextBox>                                                    
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>    
                                                        </td>
                                                        <td>FEC SALIDA</td>
                                                        <td >
                                                            <asp:UpdatePanel ID="UpdatePanel72" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:TextBox ID="txtUpFechaSalida" runat="server" ></asp:TextBox>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                      
                                        
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style5" >PROVEEDOR</td>
                                                        <td class="auto-style5">                                            
                                                            <asp:UpdatePanel ID="UpdatePanel73" runat="server">
                                                                <ContentTemplate>
                                                                    <asp:TextBox ID="txtUpProveedorID" runat="server" style="display:none;" ></asp:TextBox>
                                                                    <asp:TextBox ID="txtUpProv" runat="server" ReadOnly="true"></asp:TextBox>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </td>
                                                        <td class="auto-style7">NOMBRES </td>
                                                        <td class="auto-style5">
                                                            <asp:UpdatePanel ID="UpdatePanel74" runat="server">
                                                                <ContentTemplate>
                                                                    <asp:TextBox ID="txtUpPersonalID" runat="server" style="display:none;"></asp:TextBox>
                                                                    <asp:TextBox ID="txtUpNombre" runat="server" ReadOnly="true" Height="19px" Width="310px"></asp:TextBox>                                                                    
                                                                </ContentTemplate>                                                                
                                                            </asp:UpdatePanel> 
                                                        </td>
                                                        <td>
                                                            <asp:UpdatePanel ID="UpdatePanel76" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:Button ID="btnListarTecnicos" runat="server" Text="..." onclientClick="mostrarPopupTecnico('Lista de Técnicos','700','300');" OnClick="btnListarTecnicos_Click"/>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </td>
                                                    </tr>
                                    
                                                    <tr>
                                                        <td style="vertical-align:top">OBSERVACIÓN</td>
                                                        <td colspan ="3">
                                                            <asp:UpdatePanel ID="UpdatePanel75" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:TextBox ID="txtUpObs_Tec" runat="server" Width="100%" Height="55px" TextMode="MultiLine"></asp:TextBox>
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="btnAgregarTecnico" EventName="Click" />
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                        </td>
                                                    </tr>
                                                </table>                                                
                                            </td>
                                            <td >

                                            </td>                                         
                                        </tr>
                                    </table>
        </div>
        <div>
                            <table style="margin: 0 auto;">
                                <tr>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel77" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:Button ID="btnAceptarUpTecnico" runat="server" Width="70" Text="Aceptar" Class="btn btn-primary" OnClientClick="SalirPopupUpTecnico()" OnClick="btnAceptarUpTecnico_Click"/></td>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnTrabGenerales" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td style="width:80px">
                                    </td>    
                                    <td>
                                        <asp:Button ID="btnCancelarUpTecnico" runat="server" Width="70" Text="Cancelar" Class="btn btn-primary" OnClientClick="SalirPopupUpTecnico()" />                                        
                                    </td>                                
                                </tr>
                            </table>
                        </div>
    </div>

    <div id="emerListarTecnico" class="ventana" >
        <div class="undraggable" style="width:100%;">
			<table style="width:100% ; border-spacing:0px 0px; ">
				<tr style="background: linear-gradient(#525252,black);" onmouseover="this.style.cursor='move'">
					<td style="width:100%; height:30px; text-align:center; font: bold 14px Tahoma;color:white;">&nbsp;&nbsp;
					<span id="titcabemerListarTecnico">&nbsp;</span>&nbsp;&nbsp;</td>
					<td id="tdemerListarTecnicocerrar" class="cerrar" style="width:24px; height:30px ; background-image:url('../Images/equisx.png'); background-repeat:no-repeat; cursor:pointer; text-align:right" onclick="SalirPopupTecnico();">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
			</table>
		</div>
        
        <div id="emerListarTecnicocuerpo">
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
                                        <asp:UpdatePanel ID="UpdatePanel64" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtBsProveedorName" runat="server" onkeyup="ListarTecnico();" ></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>                                        
                                    </td>
                                    <td>
                                        Técnico
                                    </td>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel84" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:TextBox ID="txtBNombres" runat="server" onkeyup="ListarTecnico();"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        
                                    </td>
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel11" runat="server" UpdateMode="Conditional">
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
                                        <asp:UpdatePanel ID="UpdatePanel96" runat="server">
                                            <ContentTemplate>
                                                <asp:Button ID="btnCancelarListarTec" runat="server" Width="70" Text="Cancelar" Class="btn btn-primary" OnClientClick="SalirPopupTecnico()" />                                        
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>                                
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
         </div>
    </div>

    <div id="Comentario" class="ventana">
        <div class="undraggable" style="width:100%;">
			<table style="width:100% ; border-spacing:0px 0px; ">
				<tr style="background: linear-gradient(#525252,black);" onmouseover="this.style.cursor='move'">
					<td style="width:100%; height:30px; text-align:center; font: bold 14px Tahoma;color:white;">&nbsp;&nbsp;
					<span id="titcabComentario">&nbsp;</span>&nbsp;&nbsp;</td>
					<td id="tdComentariocerrar" class="cerrar" style="width:24px; height:30px ; background-image:url('../Images/equisx.png'); background-repeat:no-repeat; cursor:pointer; text-align:right" onclick="SalirPopupComentario();">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
			</table>
		</div>

        <div id="Comentariocuerpo">
            <table>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel87" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:ImageButton ID="btnAddComent" CssClass="ImagenBoton" runat="server" ImageUrl="~/Images/ComnAdd.png" OnClick="btnAddComent_Click" />
                            </ContentTemplate>
                        </asp:UpdatePanel>                        
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel88" runat="server">
                            <ContentTemplate>
                                <asp:ImageButton ID="btnEditComent" CssClass="ImagenBoton" runat="server" ImageUrl="~/Images/ComnEdit.png" OnClick="btnEditComent_Click" />
                            </ContentTemplate>
                        </asp:UpdatePanel>                        
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel89" runat="server">
                            <ContentTemplate>
                                <asp:ImageButton ID="btnDelComent" CssClass="ImagenBoton" runat="server" ImageUrl="~/Images/ComnDel.png" OnClick="btnDelComent_Click" />
                            </ContentTemplate>
                        </asp:UpdatePanel>                        
                    </td>
                    <td>                     
                        <asp:UpdatePanel ID="UpdatePanel40" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Button ID="btnListarComentariosZona" runat="server" Text="Button" style="display:none"  OnClick="btnListarComentariosZona_Click" />                                            
                            </ContentTemplate>   
                        </asp:UpdatePanel>
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel90" runat="server">
                            <ContentTemplate>
                                <asp:HiddenField ID="hdfEstadoComentario" runat="server" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel39" runat="server">
                            <ContentTemplate>
                                <asp:HiddenField ID="hdfZonaComentario" runat="server" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
            <table style="width: 100%;height:150px">
                <tr>
                    <td style="vertical-align:top">
                        <asp:UpdatePanel ID="UpdatePanel41" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:GridView ID="gvComentario" runat="server" AutoGenerateColumns="False" Width="100%" OnSelectedIndexChanged="gvComentario_SelectedIndexChanged" >
                                    <Columns>
                                        <asp:ImageField DataImageUrlField="ImageTipoComentario"></asp:ImageField>
                                        <asp:BoundField DataField="fecha" HeaderText="FECHA"></asp:BoundField>
                                        <asp:BoundField DataField="usuario" HeaderText="USUARIO"></asp:BoundField>
                                        <asp:BoundField DataField="comentario" HeaderText="COMENTARIO"></asp:BoundField>
                                        <asp:BoundField DataField="ID_Coment" HeaderText="ID COMENT">
                                            <HeaderStyle CssClass="ColumnaOculta"></HeaderStyle>
                                            <ItemStyle CssClass="ColumnaOculta"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="b_Pendiente" HeaderText="PENDIENTE">
                                            <HeaderStyle CssClass="ColumnaOculta"></HeaderStyle>

                                            <ItemStyle CssClass="ColumnaOculta"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="b_Completado" HeaderText="COMPLETADO">
                                            <HeaderStyle CssClass="ColumnaOculta"></HeaderStyle>

                                            <ItemStyle CssClass="ColumnaOculta"></ItemStyle>
                                        </asp:BoundField>
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
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnListarComentariosZona" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="gvComentario" EventName="SelectedIndexChanged" />
                                <asp:AsyncPostBackTrigger ControlID="btnAceptarComentario" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="btnDelComent" EventName="Click" />                                
                            </Triggers>
                        </asp:UpdatePanel>                
                    </td>
                </tr>
                
            </table>
            <table style="width:100%">
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel93" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:RadioButton ID="rbtComentario" runat="server" Text="Comentario" GroupName="CatComentario" />
                            </ContentTemplate>
                            <Triggers>                                
                                <asp:AsyncPostBackTrigger ControlID="gvComentario" EventName="SelectedIndexChanged" />                                
                            </Triggers>
                        </asp:UpdatePanel>
                        
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel94" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:RadioButton ID="rbtTrabPendiente" runat="server" Text="Trabajo Pendiente" GroupName="CatComentario" AutoPostBack="True" />
                            </ContentTemplate>
                            <Triggers>                                
                                <asp:AsyncPostBackTrigger ControlID="gvComentario" EventName="SelectedIndexChanged" />                                
                            </Triggers>
                        </asp:UpdatePanel>                        
                    </td>
                    <td>

                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel95" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:CheckBox ID="chkCompletado" runat="server" Text="Completado" AutoPostBack="true" />
                            </ContentTemplate>
                              <Triggers>                                
                                <asp:AsyncPostBackTrigger ControlID="gvComentario" EventName="SelectedIndexChanged" />                                
                            </Triggers>
                        </asp:UpdatePanel>                        
                    </td>
                </tr>
            </table>
            <table style="width:100%">
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel91" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:TextBox ID="txtComentario" runat="server" Height="67px" TextMode="MultiLine" Width="99%" Enabled="False"></asp:TextBox>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnAddComent" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="btnEditComent" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="btnAceptarComentario" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="btnCancelarComentario" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="gvComentario" EventName="SelectedIndexChanged" />
                                <asp:AsyncPostBackTrigger ControlID="gvBloqueZonas" EventName="RowCommand" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
            <asp:UpdatePanel ID="UpdatePanel92" runat="server">
                <ContentTemplate>
                    <table>
                <tr>
                    <td>
                        <asp:Button ID="btnAceptarComentario" runat="server" Text="Aceptar" Width="80px" Height="30px" Visible="false" OnClick="btnAceptarComentario_Click"/>
                    </td>
                    <td>
                        <asp:Button ID="btnCancelarComentario" runat="server" Text="Cancelar" Width="80px" Height="30px" Visible="false" OnClick="btnCancelarComentario_Click" />
                        <asp:Button ID="btnCerrar" runat="server" Text="Cerrar" visible="true" Width="80px" Height="30px" OnClientClick="SalirPopupComentario();"/>
                    </td>
                </tr>
            </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

    </div>

    <script type="text/javascript">

        $(function () {
            $("#emergente").draggable({ handle: 'div.undraggable' });
            $("#emerListarTecnico").draggable({ handle: 'div.undraggable' });
            $("#emerAbonado").draggable({ handle: 'div.undraggable' });
            $("#emerSubs").draggable({ handle: 'div.undraggable' });
            $("#emerDealer").draggable({ handle: 'div.undraggable' });
            $("#emerTEnvioMsm").draggable({ handle: 'div.undraggable' });
            $("#emerModiAtencion").draggable({ handle: 'div.undraggable' });
            $("#emerUpTecnico").draggable({ handle: 'div.undraggable' });
            $("#emerUpAbonado").draggable({ handle: 'div.undraggable' });
            $("#emerListarAbonados").draggable({ handle: 'div.undraggable' });
            $("#Comentario").draggable({ handle: 'div.undraggable' });
        });

        function mostrarPopupComentario(titulo, ancho, alto) {
            //$("#tdemergentecerrar").show();
            //$("#fondoemergente").css('display', 'block');
            //$("#titcabemergente").html('Comentarios y/o Trabajos Pendientes - Zona: ' + titulo);
            //document.getElementById('ContentPlaceHolder1_txtZonaC').value = titulo;
            //(document.getElementById('ContentPlaceHolder1_btZona')).click();
            //mostrarCentrarDiv('emergente', ancho, alto);                       
        }


        function mostrarEmerUpAbonado(titulo, ancho, alto) {
            $("#tdemerUpAbonadocerrar").show();
            $("#fondoemergente").css('display', 'block');
            $("#titcabemerUpAbonado").html(titulo);
            mostrarCentrarDiv('emerUpAbonado', ancho, alto);
        }

        function mostrarEmerListarAbonados(titulo, ancho, alto) {
            $("#tdemerListarAbonadoscerrar").show();
            $("#fondoemerListarAbonados").css('display', 'block');
            $("#titcabemerListarAbonados").html(titulo);
            mostrarCentrarDiv('emerListarAbonados', ancho, alto);
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

            var disdes = $("#ContentPlaceHolder1_txtID_Ficha").val();

            if (disdes.length == 0) {
                alert('Debe guardar los datos y generar la ficha');
            }
            else
            {
                $("#tdTEnvioMsmcerrar").show();
                $("#fondoemergente").css('display', 'block');
                $("#titTEnvioMsm").html(titulo);
                mostrarCentrarDiv('emerTEnvioMsm', ancho, alto);                
                $("#ContentPlaceHolder1_txtTMSMMinutos").focus();
            }
        }        

        function mostrarEmergenteModiAtencion(titulo, ancho, alto) {
            $("#tdModiAtencioncerrar").show();
            $("#fondoemergente").css('display', 'block');
            $("#titModiAtencion").html(titulo);
            mostrarCentrarDiv('emerModiAtencion', ancho, alto);
        }
        function mostrarEmergenteUpTecnico(titulo, ancho, alto) {
            $("#tdUpTecnicocerrar").show();
            $("#fondoemergente").css('display', 'block');
            $("#titUpTecnico").html(titulo);
            mostrarCentrarDiv('emerUpTecnico', ancho, alto);
        }

        function mostrarPopupTecnico(titulo, ancho, alto) {
            $("#tdemerListarTecnicocerrar").show();
            $("#fondoemergenteListarTecnico").css('display', 'block');
            $("#titcabemerListarTecnico").html(titulo);
            mostrarCentrarDiv('emerListarTecnico', ancho, alto);
        }
        
        function mostrarComentario(titulo, zona, ancho, alto) {
            document.getElementById('ContentPlaceHolder1_hdfZonaComentario').value = zona;
            $("#tdComentariocerrar").show();
            $("#fondoemergente").css('display', 'block');
            $("#titcabComentario").html(titulo);
            mostrarCentrarDiv('Comentario', ancho, alto);
            document.getElementById('ContentPlaceHolder1_txtComentario').value = "";
            (document.getElementById('ContentPlaceHolder1_btnListarComentariosZona')).click();
        }

        function SalirPopupComentario() {
            $("#fondoemergente").hide();
            $("#Comentario").hide();
        }

        

        function SalirPopupTecnico() {
            $("#fondoemergenteListarTecnico").hide();
            $("#emerListarTecnico").hide();
        }

        function SalirEmerUpAbonado() {
            $("#fondoemergente").hide();
            $("#emerUpAbonado").hide();
        }

        function SalirEmerListarAbonados() {
            $("#fondoemerListarAbonados").hide();
            $("#emerListarAbonados").hide();
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

            //var datolleno = $("#ContentPlaceHolder1_txtTMSMMinutos").val();

            //if (datolleno.length == 0)
            //{
            //    alert("No se ha ingresado los minutos");
            //}
            //else
            //{
                $("#fondoemergente").hide();
                $("#emerTEnvioMsm").hide();
            //}
            
        }

        function SalirPopupModiAtencion() {
            $("#fondoemergente").hide();
            $("#emerModiAtencion").hide();
        }

        function SalirPopupUpTecnico() {
            $("#fondoemergente").hide();
            $("#emerUpTecnico").hide();
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


                
    function checkRadioBtn(id) {
       var gv = document.getElementById('<%=gvAbonado.ClientID %>');

        for (var i = 1; i < gv.rows.length; i++) {
            var radioBtn = gv.rows[i].cells[7].getElementsByTagName("input");

            // Check if the id not same
            if (radioBtn[0].id != id.id) {
                radioBtn[0].checked = false;
            }
        }
    }





    </script>

</asp:Content>