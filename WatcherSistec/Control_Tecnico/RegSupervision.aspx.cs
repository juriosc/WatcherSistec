using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessRules;

namespace WatcherSistec.Control_Tecnico
{
    public partial class RegSuperVision : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
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
            string Pend = "", Conc = "", Aten = "", Canc = "", Env = "", Trab = "", Obs = "" ;
            string BeginDate, EndDate, Mant = "";
            
            BeginDate = txtFechaDesde.Text;
            EndDate = txtFechaHasta.Text;

            if (chkPendiente.Checked){
                Pend = "1";
            }else{
                Pend = "0";
            }

            if (chkConcluida.Checked){
                Conc = "1";
            }else{
                Conc = "0";
            }

            if (chkAtencion.Checked){
                Aten = "1";
            }else{
                Aten = "0";
            }

            if (chkCancelada.Checked){
                Canc = "1";
            }else{
                Canc = "0";
            }

            if (chkenviadas.Checked){
                Env = "1";
            }else{
                Env = "0";
            }

            if (chkTrabPend.Checked){
                Trab = "1";
            }else{
                Trab = "0";
            }

            if (chkObservaciones.Checked){
                Obs = "1";
            }else{
                Obs = "0";
            }
            
            foreach (GridViewRow row in gvTipoMantenimiento.Rows)
            {
                CheckBox check = row.FindControl("chkSel") as CheckBox;
                
                beTipoMant P = new beTipoMant();
                string strError = string.Empty;
                
                if (check.Checked)
                {
                    Mant = Mant + row.Cells[0].Text + ",";
                }
            }
            int lmant = Mant.Length;
            if (lmant > 0) { Mant = Mant.Substring(0, lmant - 1); }

            List<beSupervision> lbeSupervisiones = br.ListarSupervisiones(txtCsid.Text.ToString(), txtOperador.Text.ToString(), txtProveedor.Text.ToString(), txtTecnico.Text.ToString(), Pend, Conc, Aten, Canc, BeginDate, EndDate, Mant , Obs, Trab, Env);
            
            gvSupervisiones.DataSource = lbeSupervisiones;
            gvSupervisiones.DataBind();
        }

        protected void gvSupervisiones_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSupervisiones.PageIndex = e.NewPageIndex;
            Listar_Supervisiones();

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

        protected void btnBuscarSubscriber_Click(object sender, EventArgs e)
        {
            Listar_Grilla_Subscriber(txtBusOficina.Text, txtBusDistribuidor.Text, txtBusDireccion.Text);
        }

        protected void btnAceptarSubscriber_Click(object sender, EventArgs e)
        {
            txtDealercode.Text = gvSubscriber.Rows[gvSubscriber.SelectedIndex].Cells[4].Text;
            txtDealerName.Text = gvSubscriber.Rows[gvSubscriber.SelectedIndex].Cells[0].Text;
            txtCsid.Text = gvSubscriber.Rows[gvSubscriber.SelectedIndex].Cells[1].Text;
            txtSubscriberName.Text = gvSubscriber.Rows[gvSubscriber.SelectedIndex].Cells[2].Text;
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
            if (e.CommandName.Equals("Ver"))
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvSupervisiones.Rows[index];

                string pFichaID = row.Cells[2].Text.ToString();
                Response.Redirect("../Control_Tecnico/FichaSupervision.aspx?FichaID=" + pFichaID);
            }


            if (e.CommandName.Equals("Modificar"))
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvSupervisiones.Rows[index];

                string pFichaID = row.Cells[2].Text.ToString();
                Response.Redirect("../Control_Tecnico/FichaSupervision.aspx?FichaID=" + pFichaID);
            }

        }

        protected void btnBuscarDealer_Click(object sender, EventArgs e)
        {
            Listar_Grilla_Dealer(txtDealer.Text, txtNameDealer.Text);
        }

        protected void btnAceptar_Dealer_Click(object sender, EventArgs e)
        {
            txtDealercode.Text = gvDealer.Rows[gvDealer.SelectedIndex].Cells[0].Text;
            txtDealerName.Text = gvDealer.Rows[gvDealer.SelectedIndex].Cells[1].Text;
        }

        protected void gvDealer_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDealer.PageIndex = e.NewPageIndex;
            Listar_Grilla_Dealer(txtDealer.Text, txtNameDealer.Text);
        }

        private void Listar_Grilla_Dealer(string Dealer, string dealername)
        {
            brDealer br = new brDealer();
            List<beDealer> lstListarDealer = br.ListarDealer(Dealer, dealername);
            gvDealer.DataSource = lstListarDealer;
            gvDealer.DataBind();
        }

        private void Listar_Grilla_Proveedor(string Codigo, string Proveedor)
        {
            brProveedor br = new brProveedor();
            List<beProveedor> lstListarProveedor = br.ListarProveedor(Codigo, Proveedor);
            gvProveedor.DataSource = lstListarProveedor;
            gvProveedor.DataBind();
        }

        protected void gvProveedor_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvProveedor.PageIndex = e.NewPageIndex;
            Listar_Grilla_Proveedor(txtDealer.Text, txtNameDealer.Text);
        }

        protected void btnAceptar_Prov_Click(object sender, EventArgs e)
        {
            txtProveedor.Text = gvProveedor.Rows[gvProveedor.SelectedIndex].Cells[0].Text;
            txtProveName.Text = gvProveedor.Rows[gvProveedor.SelectedIndex].Cells[1].Text;
            txtTecnico.Text = "";
            txtTecName.Text = "";
        }

        private void Listar_Grilla_Tecnico(string Proveedor, string Nombre)
        {
            brFichaTecnico br = new brFichaTecnico();
            List<beTecnico> lstListarTecnico = br.ListarTecnico(Proveedor, Nombre);
            gvTecnico.DataSource = lstListarTecnico;
            gvTecnico.DataBind();
        }

        protected void gvTecnico_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTecnico.PageIndex = e.NewPageIndex;
            Listar_Grilla_Tecnico(txtProv.Text, txtNameTecnico.Text);
        }

        protected void btnAceptarTec_Click(object sender, EventArgs e)
        {
            txtTecnico.Text = gvTecnico.Rows[gvTecnico.SelectedIndex].Cells[3].Text;
            txtTecName.Text = HttpUtility.HtmlDecode(gvTecnico.Rows[gvTecnico.SelectedIndex].Cells[2].Text);
            txtProveedor.Text = gvTecnico.Rows[gvTecnico.SelectedIndex].Cells[4].Text;
            txtProveName.Text = HttpUtility.HtmlDecode(gvTecnico.Rows[gvTecnico.SelectedIndex].Cells[0].Text);
        }

        protected void btnBuscarProv_Click(object sender, EventArgs e)
        {
            Listar_Grilla_Proveedor("", txtProvName.Text);
        }

        protected void btnBuscarTecnico_Click(object sender, EventArgs e)
        {
            Listar_Grilla_Tecnico(txtProv.Text, txtNameTecnico.Text);
        }

        protected void chkSeleccion_CheckedChanged(object sender, EventArgs e)
        {
            if (chkSeleccion.Checked)
            {
                foreach (GridViewRow fila in gvTipoMantenimiento.Rows)
                {
                    CheckBox check = fila.FindControl("chkSel") as CheckBox;
                    check.Checked = true;
                }
            }
            else
            {
                if (chkSeleccion.Checked == false)
                {
                    foreach (GridViewRow fila in gvTipoMantenimiento.Rows)
                    {
                        CheckBox check = fila.FindControl("chkSel") as CheckBox;
                        check.Checked = false;
                    }
                }
            }
        }
    }
}