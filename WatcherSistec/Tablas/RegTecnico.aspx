<%@ Page Title="" Language="C#" MasterPageFile="~/General/Principal.Master" AutoEventWireup="true" CodeBehind="RegTecnico.aspx.cs" Inherits="WatcherSistec.Tablas.RegTecnico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        .auto-style1 {
             height: 22px;
             width: 314px;
         }
        .auto-style11 {
        height: 22px;
        width: 47px;
    }
    .auto-style13 {
        height: 22px;
        width: 121px;
    }
    .auto-style14 {
        height: 22px;
        width: 6px;
    }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div>Filtro de busqueda:</div>
    <table style="width: 100%;">
        
        <tr>
            <td class="auto-style13"></td>
            <td class="auto-style11"></td>
            <td class="auto-style14"></td>
            <td class="auto-style1"></td>
        </tr>
        <tr>
            <td class="auto-style13">Entidad-Proveedor</td>
            <td class="auto-style11">
                <asp:TextBox ID="TextBox1" runat="server" Width="141px" Height="18px"></asp:TextBox>
            </td>
            <td  class="auto-style14" colspan="2">
                <asp:TextBox ID="TextBox4" runat="server" Width="602px" Height="20px"></asp:TextBox>
            </td>
            <td> <asp:Button ID="Button1" runat="server" Text="Buscar" /> </td>
        </tr>
           <tr>
            <td class="auto-style13">Técnico</td>
            <td class="auto-style11">
                <asp:TextBox ID="TextBox2" runat="server" Width="141px" Height="18px"></asp:TextBox>
            </td>
            <td class="auto-style14">
                <asp:TextBox ID="TextBox3" runat="server" Width="299px" Height="20px"></asp:TextBox>
            </td>
           <td class="auto-style1">
                <asp:TextBox ID="TextBox5" runat="server" Width="299px" Height="20px"></asp:TextBox>
            </td>
        </tr>
       

    </table>
    <br>
    <div align="center">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" >
    <Columns>
        <asp:BoundField HeaderText="Entidad" />
        <asp:BoundField HeaderText="Cod. Técnico" />
        <asp:BoundField HeaderText="Apellido Paterno" />
        <asp:BoundField HeaderText="Apellido Materno" />
        <asp:BoundField HeaderText="Telef. Móvil" />
        <asp:BoundField HeaderText="Telef. Opcional" />
        <asp:BoundField HeaderText="Correo" />
        <asp:CommandField ShowEditButton="true" />
        <asp:CommandField ShowDeleteButton="true" />
        </Columns>
    </asp:GridView>
 
    </div>

</asp:Content>
