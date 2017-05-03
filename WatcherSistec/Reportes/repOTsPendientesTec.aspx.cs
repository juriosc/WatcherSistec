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
    public partial class repOTsPendientesTec : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListarTipoMantenimiento();
                Listar_Supervisiones();
            }
        }

        private void ListarTipoMantenimiento()
        {
            brTipoMantenimiento br = new brTipoMantenimiento();
            List<beTipoMant> lbeMantenimiento = br.ComboMantenimiento();

            gvTipoMantenimiento.DataSource = lbeMantenimiento;
            gvTipoMantenimiento.DataBind();
        }
        protected void gvTipoMantenimiento_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTipoMantenimiento.PageIndex = e.NewPageIndex;
            ListarTipoMantenimiento();
        }

        private void Listar_Supervisiones()
        {
            brSupervisiones br = new brSupervisiones();
            string Pend = "", Conc = "", Aten = "", Canc = "", Env = "", Trab = "", Obs = "";
            string BeginDate, EndDate, Mant = "";

            BeginDate = txtFechaIni.Text;
            EndDate = txtFechaFin.Text;

            foreach (GridViewRow row in gvTipoMantenimiento.Rows)
            {
                CheckBox check = row.FindControl("chkSel") as CheckBox;

                beTipoMant P = new beTipoMant();
                string strError = string.Empty;

                if (check.Checked)
                {
                    Mant = Mant + row.Cells[1].Text + ",";
                }
            }
            int lmant = Mant.Length;
            if (lmant > 0) { Mant = Mant.Substring(0, lmant - 1); }

            List<beSupervision> lbeSupervisiones = br.ListarSupervisiones("", txtCsid.Text.ToString(),"", txtProveedor.Text.ToString(), txtTecnico.Text.ToString(), Pend, Conc, Aten, Canc, BeginDate, EndDate, Mant, Obs, Trab, Env);

            gvSupervisiones.DataSource = lbeSupervisiones;
            gvSupervisiones.DataBind();
        }
        protected void gvSupervisiones_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSupervisiones.PageIndex = e.NewPageIndex;
            Listar_Supervisiones();
        }



        protected void gvSupervisiones_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Ver"))
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvSupervisiones.Rows[index];

                string pFichaID = row.Cells[1].Text.ToString();
                Response.Redirect("../Control_Tecnico/FichaSupervision.aspx?FichaID=" + pFichaID);
            }


            if (e.CommandName.Equals("Modificar"))
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvSupervisiones.Rows[index];

                string pFichaID = row.Cells[1].Text.ToString();
                Response.Redirect("../Control_Tecnico/FichaSupervision.aspx?FichaID=" + pFichaID);
            }

        }

        protected void btnBuscarSubscriber_Click(object sender, EventArgs e)
        {
            Listar_Grilla_Subscriber(txtBusOficina.Text, txtBusDistribuidor.Text, txtBusDireccion.Text);
        }

        private void Listar_Grilla_Subscriber(string subscribername, string dealername, string addressStreet)
        {
            brSubscriber br = new brSubscriber();
            List<beSubscriber> lstListarSubscriber = br.ListarSubscriber(subscribername, dealername, addressStreet);
            gvSubscriber.DataSource = lstListarSubscriber;
            gvSubscriber.DataBind();
        }
        protected void gvSubscriber_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSubscriber.PageIndex = e.NewPageIndex;
            Listar_Grilla_Subscriber(txtBusOficina.Text, txtBusDistribuidor.Text, txtBusDireccion.Text);

        }

        protected void btnAceptarSubscriber_Click(object sender, EventArgs e)
        {
            txtCsid.Text = gvSubscriber.Rows[gvSubscriber.SelectedIndex].Cells[1].Text;
            txtSubscriberName.Text = gvSubscriber.Rows[gvSubscriber.SelectedIndex].Cells[2].Text;
        }

        protected void btnBuscar_Click(object sender, ImageClickEventArgs e)
        {
            Listar_Supervisiones();
        }


    }
}