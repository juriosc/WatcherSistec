<%@ Page Title="" Language="C#" MasterPageFile="~/General/Principal.Master" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="WatcherSistec.Seguridad.Perfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        .auto-style1 {
            height: 22px;
            width: 237px;
        }
        .auto-style11 {
        height: 22px;
        width: 64px;
    }
    .auto-style13 {
             height: 22px;
             width: 127px;
         }
         .auto-style15 {
             height: 22px;
             width: 42px;
         }
         .auto-style17 {
             height: 22px;
         }

        
   

         .auto-style18 {
             height: 23px;
         }

        
   

         .auto-style19 {
             height: 23px;
             width: 127px;
         }
         .auto-style20 {
             width: 127px;
         }

        .btGrisNegrita{
    background-color: #1B90B4;
    color: #FFFFFF;
    font-size: 13px;
    border: 5px solid #1B90B4;
}

 .txtGrisNegrita{
    background-color: #060202;
    color: #FFFFFF;
    font-size: 13px;
    border: 5px solid #060202;
} 

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br>
     <div background="#1A0E0E"  align="center" >  <asp:Button ID="Button1" runat="server" Text="Perfil de Usuario" 
             Width="733px"  Height="24px" CssClass="txtGrisNegrita" ValidationGroup="valNPieza" OnClick="btnAddTRATAMIENTO_Click"/></div>
    <br>
    <br>
     <div align="center" >Mantenimiento de Perfil</div>
    <br>
    <table align="center"; >
        
        <tr>
            <td class="auto-style13"></td>
            <td class="auto-style11"></td>
            <td class="auto-style15"></td>
            <td class="auto-style1" rowspan="3" align="left">

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField HeaderText="ID" />
                        <asp:BoundField HeaderText="Nombre Perfil" />
                        <asp:BoundField HeaderText="Estado" />
                        <asp:CommandField ShowEditButton="true" />
                        <asp:CommandField ShowDeleteButton="true" />
                    </Columns>
                </asp:GridView>

            </td>
            <td>
                 <asp:Button ID="btnAddTRATAMIENTO" runat="server" Text="Añadir" 
             Width="133px"  Height="24px" CssClass="btGrisNegrita" ValidationGroup="valNPieza" OnClick="btnAddTRATAMIENTO_Click"/> 
            
            </td>
        </tr>
        <tr>
            <td class="auto-style13">clave:</td>
            <td class="auto-style11">
                <asp:TextBox ID="TextBox1" runat="server" Width="112px"></asp:TextBox>
            </td>
            
            <td class="auto-style15"></td>
            <td class="auto-style17">
                <asp:Button ID="btnAddTRATAMIENTO2" runat="server" CssClass="btGrisNegrita"
                     Height="24px" OnClick="btnAddTRATAMIENTO_Click" Text="Modificar" ValidationGroup="valNPieza" Width="133px" />
            </td>
            
           
        </tr>
        <tr>
            <td class="auto-style13">Nombre de Perfil:</td>
            
            <td class="auto-style11">
                <asp:TextBox ID="TextBox2" runat="server" Width="112px"></asp:TextBox>
            </td>
            <td class="auto-style17"></td>
            <td>
                <asp:Button ID="btnAddTRATAMIENTO1" runat="server" CssClass="btGrisNegrita" 
                    Height="24px" OnClick="btnAddTRATAMIENTO_Click" Text="Guardar" ValidationGroup="valNPieza" Width="133px" />
            </td>
            <tr>
            <td class="auto-style19"></td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <asp:Button ID="btnAddTRATAMIENTO3" runat="server" CssClass="btGrisNegrita" Height="24px" OnClick="btnAddTRATAMIENTO_Click" Text="Quitar" ValidationGroup="valNPieza" Width="133px" />
                </td>

                <tr>
                <td class="auto-style19" >Estado: </td>
                <td class="auto-style18" >
                    <asp:RadioButton ID="RadioButton1" runat="server" Text="Activo" CssClass="radiobutton"  />
                     <td class="auto-style18">
                    
                </td>

                  <td class="auto-style18"></td>
                    <td class="auto-style18">
                        <asp:Button ID="btnAddTRATAMIENTO4" runat="server" CssClass="btGrisNegrita" Height="24px" 
                            OnClick="btnAddTRATAMIENTO_Click" Text="Cancelar" ValidationGroup="valNPieza" Width="133px" />
                    </td>
              </tr>

        <tr>
            <td class="auto-style13"></td>
            <td class="auto-style17"><asp:RadioButton ID="RadioButton2" runat="server" Text="Inactivo" CssClass="radiobutton"  /></td>
        <td class="auto-style17"></td>
            <td class="auto-style17"></td>
            <td class="auto-style17"></td>
        </tr>  
        <br>
        <tr>
            <td class="auto-style20"></td>
            <td></td>
            <td></td>
            <td></td>
             <td></td>
        </tr>   
         <tr>
            <td class="auto-style13">
                <asp:Label ID="Label1" runat="server" Text="Usuario  de Perfil:"></asp:Label>
                <br>

             </td>

             

            <td class="auto-style17"></td>
            <td class="auto-style17"></td>
            <td class="auto-style17"></td>
             <td class="auto-style17"></td>
        </tr> 

        <tr>

                        <td class="auto-style20"></td>
            <td></td>
            <td></td>
             <td></td>

        </tr>

<tr>

         <td class="auto-style20">s
                <asp:Label ID="Label2" runat="server" Text="Usuario  Asignado:"></asp:Label>
             </td>
            <td></td>
            <td></td>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Usuario No Asignados"></asp:Label>
         </td>
             <td></td>
        </tr>
        <tr>
            <td class="auto-style20"></td>
            <td></td>
            <td></td>
             <td></td>
        </tr>
        <br>
        <tr>
            <td class="auto-style20">
                <asp:GridView ID="GridView2" runat="server">
                    <Columns>
                        <asp:BoundField HeaderText="Usuario" />
                        <asp:BoundField HeaderText="Nombre de Usuario" />
                    </Columns>
                </asp:GridView>
                
            </td>
            <td></td>
            <td></td>
            <td><asp:GridView ID="GridView3" runat="server">
                <Columns>
                    <asp:BoundField HeaderText="Usuario" />
                    <asp:BoundField HeaderText="Nombre de Usuario" />
                </Columns>
                </asp:GridView>
            </td>
            
            </tr> 
             
           
        </table>
    <br>
    <div align="center">
   
    </div>

    <table align="center";  >
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </table>
   
    
    
  

</asp:Content>

