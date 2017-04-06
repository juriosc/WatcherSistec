<%@ Page Title="" Language="C#" MasterPageFile="~/General/Principal.Master" AutoEventWireup="true" CodeBehind="Mantenimiento.aspx.cs" Inherits="WatcherSistec.Seguridad.Mantenimiento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body>
        <br>
       
    <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Text="Filtros"></asp:Label>
    </div>
        <br>
        
    <div>
        <td>
            <tr>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="RadioButton1" runat="server" Text="Proveedor" /></tr> &nbsp;
            <tr>
                <asp:RadioButton ID="RadioButton2" runat="server"  Text="Entidad"/></tr>
        </td>
        <td>
            &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server" Height="18px" Width="113px"></asp:TextBox></td>
        <td>
            &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" Height="16px" Width="257px"></asp:TextBox></td>
   &nbsp;&nbsp;&nbsp;&nbsp;
        <td><asp:ImageButton ID="btnbuscar" runat="server" ImageUrl="../Images/Mantenimiento/view.png" Width="19px" Height="22px" /></td>

        
        
    </div>

        <div align="center">
            <br>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;
                <asp:Button ID="Button1" runat="server" Text="Buscar" />
            <td>
        </div>

         <div>
        <td>
            <asp:GridView ID="GridView1" runat="server">
                <Columns>
                    <asp:BoundField HeaderText="Proveedor/Usuario" />
                    <asp:BoundField />
                    <asp:BoundField HeaderText="Usuario" />
                    <asp:BoundField HeaderText="Nombre Completo" />
                    <asp:BoundField HeaderText="estado" />
                    <asp:BoundField HeaderText="Telf. movil" />
                </Columns>
             </asp:GridView>
       </td>
    </div>
        <br>
        <br>
        <br>
        <div align="center">
            
            <td>
                <asp:Button ID="Button2" runat="server" Text="Nuevo" />
            </td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<td>
                <asp:Button ID="Button3" runat="server" Text="Editar" />
            </td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<td>
                <asp:Button ID="Button4" runat="server" Text="Eliminar" />
            </td>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <td><asp:Button ID="Button5" runat="server" Text="salir" /></td>

        </div>
        </body>

   


</asp:Content>

