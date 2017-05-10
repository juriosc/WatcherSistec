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
    public partial class repOTsPorOficinaEntidad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Listar_Reporte();

                int dia_h, mes_h;
                string sdia_h, smes_h;

                dia_h = DateTime.Now.Day;
                mes_h = DateTime.Now.Month;


                if (dia_h < 10)
                {
                    sdia_h = "0" + dia_h.ToString();
                }
                else
                {
                    sdia_h = dia_h.ToString();
                }

                if (mes_h < 10)
                {
                    smes_h = "0" + mes_h.ToString();
                }
                else
                {
                    smes_h = mes_h.ToString();
                }

                txtFechaIni.Text = sdia_h + "/" + smes_h + "/" + DateTime.Now.Year.ToString();
                txtFechaFin.Text = sdia_h + "/" + smes_h + "/" + DateTime.Now.Year.ToString();
            }
        }

        private void Listar_Reporte()
        {
            brReportes br = new brReportes();
            string BeginDate, EndDate;

            BeginDate = txtFechaIni.Text;
            EndDate = txtFechaFin.Text;

            List<beReportes> lbeReportes = br.ListarReporte_xOficinaEntidad(BeginDate, EndDate, txtCsid.Text.ToString());

            gvReporte.DataSource = lbeReportes;
            gvReporte.DataBind();
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

        private void Listar_Grilla_Subscriber(string subscribername, string dealername, string addressStreet)
        {
            brSubscriber br = new brSubscriber();
            List<beSubscriber> lstListarSubscriber = br.ListarSubscriber(subscribername, dealername, addressStreet);
            gvSubscriber.DataSource = lstListarSubscriber;
            gvSubscriber.DataBind();
        }

        protected void btnBuscarSubscriber_Click(object sender, EventArgs e)
        {
            Listar_Grilla_Subscriber(txtBusOficina.Text, txtBusDistribuidor.Text, txtBusDireccion.Text);
        }

        protected void btnAceptarSubscriber_Click(object sender, EventArgs e)
        {
            txtCsid.Text = gvSubscriber.Rows[gvSubscriber.SelectedIndex].Cells[1].Text;
            txtSubscriberName.Text = gvSubscriber.Rows[gvSubscriber.SelectedIndex].Cells[2].Text;
            txtDealercode.Text = gvSubscriber.Rows[gvSubscriber.SelectedIndex].Cells[4].Text;
            txtDealerName.Text = gvSubscriber.Rows[gvSubscriber.SelectedIndex].Cells[0].Text;
        }

        protected void gvSubscriber_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSubscriber.PageIndex = e.NewPageIndex;
            Listar_Grilla_Subscriber(txtBusOficina.Text, txtBusDistribuidor.Text, txtBusDireccion.Text);
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

        protected void gvDealer_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDealer.PageIndex = e.NewPageIndex;
            Listar_Grilla_Dealer(txtDealer.Text, txtNameDealer.Text);
        }

        protected void btnAceptar_Dealer_Click(object sender, EventArgs e)
        {
            txtDealercode.Text = gvDealer.Rows[gvDealer.SelectedIndex].Cells[0].Text;
            txtDealerName.Text = gvDealer.Rows[gvDealer.SelectedIndex].Cells[1].Text;
            txtCsid.Text = "";
            txtSubscriberName.Text = "";
        }

    }
}