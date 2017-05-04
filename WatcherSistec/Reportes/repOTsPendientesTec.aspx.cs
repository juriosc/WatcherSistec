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
                Listar_Reporte();
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

        private void Listar_Reporte()
        {
            brReportes br = new brReportes();
            string BeginDate, EndDate, Mant = "", Check = ""; 

            BeginDate = txtFechaIni.Text;
            EndDate = txtFechaFin.Text;

            if (chkComent.Checked == true)
            {
                Check = "1";
            }

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

            List<beReportes> lbeReportes = br.ListarReporte_FichaPxT(BeginDate, EndDate, txtProveedor.Text.ToString(), txtTecnico.Text.ToString(), Mant, txtCsid.Text.ToString(), Check, ddlEstado.SelectedValue.ToString());

            gvReporte.DataSource = lbeReportes;
            gvReporte.DataBind();
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
            Listar_Reporte();
        }

        protected void gvReporte_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvReporte.PageIndex = e.NewPageIndex;
            Listar_Reporte();
        }

        protected void gvDealer_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDealer.PageIndex = e.NewPageIndex;
            Listar_Grilla_Dealer(txtDealer.Text, txtNameDealer.Text);
        }

        protected void btnAceptar_Dealer_Click(object sender, EventArgs e)
        {
            txtDealercode.Text = gvDealer.Rows[gvDealer.SelectedIndex].Cells[0].Text;
            txtDealerName.Text = gvDealer.Rows[gvDealer.SelectedIndex].Cells[1].Text;
        }
        private void Listar_Grilla_Dealer(string Dealer, string dealername)
        {
            brDealer br = new brDealer();
            List<beDealer> lstListarDealer = br.ListarDealer(Dealer, dealername);
            gvDealer.DataSource = lstListarDealer;
            gvDealer.DataBind();
        }

        protected void btnBuscarDealer_Click(object sender, EventArgs e)
        {
            Listar_Grilla_Dealer(txtDealer.Text, txtNameDealer.Text);
        }

        private void Listar_Grilla_Proveedor(string Codigo, string Proveedor)
        {
            brProveedor br = new brProveedor();
            List<beProveedor> lstListarProveedor = br.ListarProveedor(Codigo, Proveedor);
            gvProveedor.DataSource = lstListarProveedor;
            gvProveedor.DataBind();
        }

        protected void btnBuscarProv_Click(object sender, EventArgs e)
        {
            Listar_Grilla_Proveedor("", txtProvName.Text);
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

        protected void btnBuscarTecnico_Click(object sender, EventArgs e)
        {
            Listar_Grilla_Tecnico(txtProv.Text, txtNameTecnico.Text);
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
    }
}