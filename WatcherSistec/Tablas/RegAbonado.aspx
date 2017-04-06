<%@ Page Title="" Language="C#" MasterPageFile="~/General/Principal.Master" AutoEventWireup="true" CodeBehind="RegAbonado.aspx.cs" Inherits="WatcherSistec.Tablas.RegAbonado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 22px;
            width: 485px;
        }
        .auto-style6 {
        height: 22px;
        width: 198px;
    }
        .auto-style7 {
            width: 198px;
        }
        .auto-style10 {
            width: 485px;
        }
    .auto-style11 {
        height: 22px;
        width: 64px;
    }
    .auto-style12 {
        width: 64px;
    }
    .auto-style13 {
        height: 22px;
        width: 72px;
    }
    .auto-style14 {
        width: 72px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>FILTRO DE BUSQUEDA</div>
    <table style="width: 100%;" align="center">
        
        <tr>
            <td class="auto-style13"></td>
            <td class="auto-style11"></td>
            <td class="auto-style6"></td>
            <td class="auto-style1"></td>
        </tr>
        <tr>
            <td class="auto-style13">Proveedor</td>
            <td class="auto-style11">
                <asp:TextBox ID="TextBox1" runat="server" Width="112px"></asp:TextBox>
            </td>
            <td class="auto-style6">
                <asp:TextBox ID="TextBox4" runat="server" Width="283px" Height="20px"></asp:TextBox>
            </td>
            
            <td><asp:Button ID="Button2" runat="server" Text="Buscar" OnClick="Button1_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style14">Distribuidor</td>
            <td class="auto-style12">
                <asp:TextBox ID="TextBox2" runat="server" Width="112px"></asp:TextBox>
            </td>
            <td class="auto-style7">
                <asp:TextBox ID="TextBox5" runat="server" Width="282px"></asp:TextBox>
            </td>
            <td class="auto-style10">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">Abonado</td>
            <td class="auto-style11">
                <asp:TextBox ID="TextBox3" runat="server" Width="111px"></asp:TextBox>
            </td>
            <td class="auto-style6">
                <asp:TextBox ID="TextBox6" runat="server" Width="282px"></asp:TextBox>
            </td>
            <td class="auto-style1"></td>


           
        </tr>
    
    </table>
    <br>
    <div align="center">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField HeaderText="Proveedor" />
        <asp:BoundField HeaderText="Distribuidor" />
        <asp:BoundField HeaderText="Cód.Abonado" />
        <asp:BoundField HeaderText="Abonado" />
        <asp:BoundField HeaderText="Acitvo" />
        <asp:BoundField HeaderText="FechaActivación" />
        <asp:BoundField HeaderText="FechaDesactivado" />
        <asp:CommandField ShowEditButton="true" />
        <asp:CommandField ShowDeleteButton="true" />
        </Columns>
    </asp:GridView>
 
    </div>
    

</asp:Content>
