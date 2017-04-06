<%@ Page Title="" Language="C#" MasterPageFile="~/General/Principal.Master" AutoEventWireup="true" CodeBehind="OpcionesPerfil.aspx.cs" Inherits="WatcherSistec.Seguridad.OpcionesPerfil" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <br>

      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
     <link href="~/Content/Perfil.css" rel="stylesheet" />

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    
<div class="container">
  <ul class="nav nav-tabs">
    <li class="active"><a href="#" onclick="salir = 0; window.location = '../Seguridad/Perfil.aspx'">Perfil de Usuario</a></li>
    <li><a href="#" onclick="salir = 0; window.location = '../Seguridad/OpcionesPerfil.aspx'">Opciones del Perfil</a></li>

  </ul>
  <br>
    <br>
    <br>
  </div>

  <div align="center"> 
      <tr>
      <td><asp:Label ID="Label1" runat="server" Text="Perfil"></asp:Label> </td>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <td>  <asp:ComboBox ID="ComboBox1" runat="server"></asp:ComboBox>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </td>
          <td>
              <asp:Button ID="btnPerfil1" class="botonP" runat="server" Text="Marcar Todo" /></td>
          &nbsp;&nbsp;&nbsp;&nbsp;
          <td>
              <asp:Button ID="btnPerfil2" CssClass="botonP" runat="server" Text="Desmarcar todo" /></td>
          </tr>
      
  </div>
    <br>
    
    <div>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <td><asp:Label ID="Label2" runat="server" Text="Opciones de Menú"></asp:Label> </td>
    </div>
    <div border="2px">
                 
    </div>
    <div> 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;
        
            <asp:ListBox ID="ListBox1" runat="server"></asp:ListBox></div>


</asp:Content>
