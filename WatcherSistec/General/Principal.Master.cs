using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WatcherSistec.General
{
    public partial class Principal : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["cPrflCode"] == null || Session["sUserIden"] == null)
                {
                    Response.Redirect("../Login/Login.aspx");
                }
                else
                {
                    lblCodPerfil.Text = Session["cPrflCode"].ToString();
                    lblUsuario.Text = Session["sUserIden"].ToString();
                }

            }
        }

        protected void lnkSalir_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Login/Login.aspx");
        }

        protected void btnSalir_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("../Login/Login.aspx");            
        }
    }
}