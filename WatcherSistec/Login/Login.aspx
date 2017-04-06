<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WatcherSistec.Login.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>Login</title>
    <link href="~/Content/Login.css" rel="stylesheet" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
</head>
<body >
   <form id="login" runat="server">
        <h1><strong>SISTEC - Acceso al sistema</strong>            
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <strong style="font-size:11px;text-align:right">Versión 1.001</strong></h1>
        
        <div style="margin:.5em 25px;background:#eee;padding:4px;-moz-border-radius:3px;-webkit-border-radius:3px;border-radius:3px;text-align:left;">
            
            <label  for="login_username" >Usuario</label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtUsuario" runat="server" maxlength="10" class="field required" placeholder="Ingrese SU Usuario" style="text-transform:uppercase;"></asp:TextBox>
        </div>
        <div style="margin:.5em 25px;background:#eee;padding:4px;-moz-border-radius:3px;-webkit-border-radius:3px;border-radius:3px;text-align:left; position:relative;">
            <label for="login_password">Password</label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" maxlength="10" class="field required" placeholder="INGRESE SU PASSWORD"></asp:TextBox>
        </div>
        <div style="margin:.5em 25px;background:#eee;padding:4px;-moz-border-radius:3px;-webkit-border-radius:3px;border-radius:3px;text-align:left; position:relative;">
            <label for="login_dstb">Distribuidor</label>
            &nbsp;
            <asp:TextBox  id="txtDstb" runat="server" class="field required" style="width:50px;margin-right:230px;text-transform:uppercase" placeholder="INGRESE" MaxLength="3" AutoComplete="off" />
        </div>
        <div class="submit">            
            <asp:Button ID="btnLogin" runat="server" CssClass="boton" Text="Ingresar"  OnClick="btnLogin_Click" />            
        </div>
        
        <div>
            <table>
                <tr>
                    <td>
                        &nbsp;
                        &nbsp;
                        &nbsp;
                        &nbsp;
                        &nbsp;
                        &nbsp;
                        &nbsp;
                        &nbsp;

                    </td>
                    <td>
                        <asp:Label ID="lblMensaje" runat="server" Font-Bold="True" ForeColor="#144795"></asp:Label>
                    </td>
                    <td>

                    </td>
                </tr>
                
                
            </table>
            
        </div>
    </form>
</body>
</html>
