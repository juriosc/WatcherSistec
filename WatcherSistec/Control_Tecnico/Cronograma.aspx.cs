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
    public partial class Cronograma : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListarCronograma();
            }
        }

        private void ListarCronograma()
        {
            brCronograma br = new brCronograma();
            string Pend = "", Conc = "", Aten = "", Canc = "", Sup = "";
            string BeginDate, EndDate, PeriodoI, PeriodoF;
            
            PeriodoI=txtPeriodoIni.Text;
            PeriodoF = txtPeriodoFin.Text;
            BeginDate = txtFechaIni.Text;
            EndDate = txtFechaFin.Text;

            if (chkPendiente.Checked)
            {
                Pend = "1";
            }
            else
            {
                Pend = "0";
            }

            if (chkConcluida.Checked)
            {
                Conc = "1";
            }
            else
            {
                Conc = "0";
            }

            if (chkAtencion.Checked)
            {
                Aten = "1";
            }
            else
            {
                Aten = "0";
            }

            if (chkCancelada.Checked)
            {
                Canc = "1";
            }
            else
            {
                Canc = "0";
            }

            if (rbtSupervision.Checked)
            {
                Sup = "1";
            }
            else
            {
                Sup = "0";
            }

            List<beCronograma> lbeCronograma = br.ListarCronograma(PeriodoI, PeriodoF, txtProveedor.Text.ToString(), txtTecnico.Text.ToString(), ddlRutas.Text, Sup, txtCsid.Text.ToString(), BeginDate, EndDate, Pend, Conc, Aten, Canc);

            gvCronograma.DataSource = lbeCronograma;
            gvCronograma.DataBind();
        }
        protected void gvCronograma_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCronograma.PageIndex = e.NewPageIndex;
            ListarCronograma();
        }

        protected void btnBuscar_Click(object sender, ImageClickEventArgs e)
        {
            ListarCronograma();
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
            txtCsid.Text = gvSubscriber.Rows[gvSubscriber.SelectedIndex].Cells[1].Text;
            txtSubscriberName.Text = gvSubscriber.Rows[gvSubscriber.SelectedIndex].Cells[2].Text;
        }

        protected void btnNuevo_Click(object sender, ImageClickEventArgs e)
        {
            ListarNewCronograma("","","","","");
            string script = "mostrarPopupNuevoCronograma('Seleccionar Abonado:',700,520);";
            ScriptManager.RegisterClientScriptBlock(this, typeof(UpdatePanel), "jsMensaje", script, true);
        }

        private void ListarNewCronograma(string Peri, string Prov, string pers, string ruta, string abon)
        {
            brCronograma br = new brCronograma();
            string BeginDate, EndDate;

            BeginDate = txtFechaIni.Text;
            EndDate = txtFechaFin.Text;

            List<beCronograma> lbeCronograma = br.ListarCronogramaDetalle(Peri,Prov,pers,ruta,abon);

            gvCronogramaMantenimiento.DataSource = lbeCronograma;
            gvCronogramaMantenimiento.DataBind();
        }
        protected void gvCronogramaMantenimiento_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCronogramaMantenimiento.PageIndex = e.NewPageIndex;
            ListarNewCronograma("", "", "", "", "");
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

        protected void gvProveedor_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvProveedor.PageIndex = e.NewPageIndex;
            Listar_Grilla_Proveedor(txtDealer.Text, txtNameDealer.Text);
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

        protected void btnAceptar_Prov_Click(object sender, EventArgs e)
        {
            //txtDealercode.Text = gvDealer.Rows[gvSubscriber.SelectedIndex].Cells[1].Text;
            txtProveName.Text = gvProveedor.Rows[gvProveedor.SelectedIndex].Cells[1].Text;
        }

        protected void gvTecnico_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void btnBuscarTecnico_Click(object sender, EventArgs e)
        {

        }

        protected void btnAceptarTec_Click(object sender, EventArgs e)
        {

        }


    }
}