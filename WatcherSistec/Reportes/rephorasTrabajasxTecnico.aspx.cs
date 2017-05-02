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
    public partial class rephorasTrabajasxTecnico : System.Web.UI.Page
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
            //              List<beSupervisiones> lbeSupervisiones = br.ListarSupervisiones(txtCodAtencion.Text.ToString(), txtCsid.Text.ToString(), txtOperador.Text.ToString(), txtProveedor.Text.ToString(), txtTecnico.Text.ToString(), Pend, Conc, Aten, Canc, BeginDate, EndDate, Mant, Obs, Trab, Env);

            //      gvSupervisiones.DataSource = lbeSupervisiones;
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

        protected void gvSupervisiones_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //if (e.CommandName.Equals("Ver"))
            //{
            //    int index = Convert.ToInt32(e.CommandArgument);
            //    GridViewRow row = gvSupervisiones.Rows[index];

            //    string pFichaID = row.Cells[1].Text.ToString();
            //    Response.Redirect("../Control_Tecnico/FichaSupervision.aspx?FichaID=" + pFichaID);
            //}


            //if (e.CommandName.Equals("Modificar"))
            //{
            //    int index = Convert.ToInt32(e.CommandArgument);
            //    GridViewRow row = gvSupervisiones.Rows[index];

            //    string pFichaID = row.Cells[1].Text.ToString();
            //    Response.Redirect("../Control_Tecnico/FichaSupervision.aspx?FichaID=" + pFichaID);
            //}
            Listar_Supervisiones();
        }

        protected void gvSupervisiones_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSupervisiones.PageIndex = e.NewPageIndex;
            Listar_Supervisiones();
        }
    }
}