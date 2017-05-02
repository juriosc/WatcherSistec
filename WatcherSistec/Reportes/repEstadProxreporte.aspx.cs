using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessRules;

namespace WatcherSistec.Reportes
{
    public partial class repEstadProxreporte : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                Listar_Supervisiones();
            }

        }

        private void Listar_Supervisiones()
        {
            brSupervisiones br = new brSupervisiones();
            string SinAt = "", Exten = "", Falt = "", Canc = "", FichGe = "";
            string BeginDate, EndDate;

            BeginDate = txtFechaIni.Text;
            EndDate = txtFechaFin.Text;

            if (chkSinAtencion.Checked)
            {
                SinAt = "1";
            }
            else
            {
                SinAt = "0";
            }

            if (chkExtendido.Checked)
            {
                Exten = "1";
            }
            else
            {
                Exten = "0";
            }

            if (chkFalta.Checked)
            {
                Falt = "1";
            }
            else
            {
                Falt = "0";
            }

            if (chkCancelado.Checked)
            {
                Canc = "1";
            }
            else
            {
                Canc = "0";
            }

            if (chkFichagenerada.Checked)
            {
                FichGe = "1";
            }
            else
            {
                FichGe = "0";
            }

            //      List<beSupervisiones> lbeSupervisiones = br.ListarSupervisiones(SinAt, Exten, Falt, Canc, FichGe); 
            gvSupervisiones.DataBind();
        }

        protected void btnBuscar_Click(object sender, ImageClickEventArgs e)
        {
            Listar_Supervisiones();
        }

        protected void btnNuevo_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("../Control_Tecnico/FichaSupervision.aspx");
        }

        protected void gvSupervisiones_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSupervisiones.PageIndex = e.NewPageIndex;
            Listar_Supervisiones();
        }

        protected void gvSupervisiones_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}