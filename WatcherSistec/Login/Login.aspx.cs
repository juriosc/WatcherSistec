using BusinessRules;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace WatcherSistec.Login
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
           try
            {
                brLogin brLogin = new brLogin();


                List<beLogin> lLogin = brLogin.ValidarLogin(txtUsuario.Text, txtPassword.Text, txtDstb.Text);                

                int exito = lLogin[0].exito;
                string sUserIden = lLogin[0].sUserIden.ToString();
                int cPrflCode = lLogin[0].cPrflCode;
                string sdealercode = lLogin[0].dealercode.ToString();
                string sdealername = lLogin[0].dealername.ToString();
                

                if (exito == 1)
                {                    
                    Session["sUserIden"] = sUserIden;
                    Session["cPrflCode"] = cPrflCode;
                    Session["dealercode"] = sdealercode;
                    Session["dealername"] = sdealername;

                    lblMensaje.Text = "Ingresando ...";                        
                    Response.Redirect("../General/Menu.aspx");
                }
                else
                {
                    lblMensaje.Text = "Usuario/Password incorrecto";

                }
            }
            catch (Exception ex)
            {
                brLog brLog = new brLog();
                brLog.InsertarLog(ex.HResult.ToString(), ex.Message, "Login", "btnLogin_Click");
            }
        
        }
    }
}