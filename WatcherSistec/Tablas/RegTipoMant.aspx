﻿<%@ Page Title="" Language="C#" MasterPageFile="~/General/Principal.Master" AutoEventWireup="true" CodeBehind="RegTipoMant.aspx.cs" Inherits="WatcherSistec.Tablas.RegTipoMant" %>
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
             width: 186px;
         }
    .auto-style14 {
        height: 22px;
        width: 6px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div>FILTRO DE BUSQUEDA</div>
    <table style="width: 100%;">
        
        <tr>
            <td class="auto-style13"></td>
            <td class="auto-style11"></td>
            <td class="auto-style14"></td>
            <td class="auto-style1"></td>
        </tr>
        <tr>
            <td class="auto-style13">Tipo de Mantenimiento:</td>
            <td class="auto-style11">
                <asp:TextBox ID="TextBox1" runat="server" Width="141px" Height="18px"></asp:TextBox>
            </td>
            <td class="auto-style14">
                <asp:TextBox ID="TextBox4" runat="server" Width="299px" Height="20px"></asp:TextBox>
            </td>
            <td> <asp:Button ID="Button1" runat="server" Text="Buscar" /> </td>
            
            
           
        </tr>
       

    </table>
    <br>
    <div align="center">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField HeaderText="ID" />
        <asp:BoundField HeaderText="tipo de Mantenimiento" />
        <asp:BoundField HeaderText="Abreviatura" />
        <asp:CommandField ShowEditButton="true" />
        <asp:CommandField ShowDeleteButton="true" />
        </Columns>
    </asp:GridView>
 
    </div>
   

</asp:Content>
