using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessRules;
using System.Data;
using System.Data.OleDb;
using System.Globalization;
using System.IO;
using System.Text;
using System.Data.SqlClient;

namespace WatcherSistec.Reportes
{
    public partial class repOTsPorOficinaEntidad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // PARA QUE FUNCIONE LA EXPORTACION A EXCEL
            ScriptManager scriptManager = ScriptManager.GetCurrent(this.Page);
            scriptManager.RegisterPostBackControl(this.btnExportar);

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
                txtFechaIni.Attributes.Add("ReadOnly", "true");
                txtFechaFin.Attributes.Add("ReadOnly", "true");
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

        protected void btnExportar_Click(object sender, ImageClickEventArgs e)
        {
            string BeginDate, EndDate;

            BeginDate = txtFechaIni.Text;
            EndDate = txtFechaFin.Text;

            Exportar(BeginDate, EndDate, txtCsid.Text.ToString());
        }

        private void Exportar(string pfechad, string pfechah, string pCSID)
        {
            String NombreXLS = "Reporte_FichaPorOficina_" + DateTime.Now.ToString();

            brExportReportes br = new brExportReportes();

            DataTable dt = br.ListarReporte_xOficinaEntidad_Export(pfechad, pfechah, pCSID);

            string attachment = "attachment; filename=" + NombreXLS + ".xls";
            Response.Clear();
            Response.ClearHeaders();
            Response.ClearContent();
            Response.AddHeader("content-disposition", attachment);
            Response.ContentType = "application/vnd.ms-excel";
            Response.ContentEncoding = Encoding.Default;
            Response.AddHeader("Cache-Control", "max-age=0");
            Response.Charset = "UTF-8";

            string html = "<table border='1' style='color:#556DA6';>";
            html = html + "<thead><tr>";
            html = html + "<th style='background-color:#EBEBE9;'>FECHA</th>";
            html = html + "<th style='background-color:#EBEBE9;'>TIPO_MANTENIMIENTO</th>";
            html = html + "<th style='background-color:#EBEBE9;'>DISTRIBUIDOR</th>";
            html = html + "<th style='background-color:#EBEBE9;'>ABONADO</th>";
            html = html + "<th style='background-color:#EBEBE9;'>OFICINA</th>";
            html = html + "<th style='background-color:#EBEBE9;'>PROVEEDOR</th>";
            html = html + "<th style='background-color:#EBEBE9;'>TÉCNICO</th>";
            html = html + "<th style='background-color:#EBEBE9;'>USUARIO</th>";
            html = html + "<th style='background-color:#EBEBE9;'>OBSERVACIONES</th>";
            html = html + "</tr></thead><tbody>";

            if (dt.Rows.Count == 0)
            {
                html = html + "<tr>";
                html = html + "<td colspan='9'>No se encontraron registros</td></tr>";
            }
            else
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    html = html + "<tr>";
                    html = html + "<td style=\"mso-number-format:mm/dd/yyyy hh:mm:ss;\">" + dt.Rows[i][0].ToString() + "</td>";
                    html = html + "<td>" + dt.Rows[i][11].ToString() + "</td>";
                    html = html + "<td>" + dt.Rows[i][3].ToString() + "</td>";
                    html = html + "<td style=\"mso-number-format:'@';\">" + dt.Rows[i][4].ToString() + "</td>";
                    html = html + "<td>" + dt.Rows[i][5].ToString() + "</td>";
                    html = html + "<td>" + dt.Rows[i][7].ToString() + "</td>";
                    html = html + "<td>" + dt.Rows[i][9].ToString() + "</td>";
                    html = html + "<td>" + dt.Rows[i][10].ToString() + "</td>";
                    html = html + "<td>" + dt.Rows[i][12].ToString() + "</td>";

                    html = html + "</tr>";
                }
            }

            html = html + "</tbody></table>";

            Response.Write(html);

            Response.End();

        }

    }
}