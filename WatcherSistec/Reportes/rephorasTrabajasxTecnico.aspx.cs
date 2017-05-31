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
    public partial class rephorasTrabajasxTecnico : System.Web.UI.Page
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

            List<beReportes> lbeReportes = br.ListarReporte_HorasTrabxTecnico(BeginDate, EndDate, txtProveedor.Text.ToString(), txtTecnico.Text.ToString());

            gvReporte.DataSource = lbeReportes;
            gvReporte.DataBind();
        }
        protected void gvReporte_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvReporte.PageIndex = e.NewPageIndex;
            Listar_Reporte();
        }

        protected void btnBuscar_Click(object sender, ImageClickEventArgs e)
        {
            Listar_Reporte();
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
            Listar_Grilla_Proveedor(txtProveedor.Text, txtProveName.Text);
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

        protected void btnExportar_Click(object sender, ImageClickEventArgs e)
        {
            string BeginDate, EndDate;

            BeginDate = txtFechaIni.Text;
            EndDate = txtFechaFin.Text;

            Exportar(BeginDate, EndDate, txtProveedor.Text.ToString(), txtTecnico.Text.ToString());
        }

        private void Exportar(string pfechad, string pfechah, string pProveedorID, string pPersonalID)
        {
            String NombreXLS = "Reporte_HorasTrabajadasxTecnico_" + DateTime.Now.ToString();

            brExportReportes br = new brExportReportes();

            DataTable dt = br.ListarReporte_HorasTrabxTecnico_Export(pfechad, pfechah, pProveedorID, pPersonalID);

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
            html = html + "<th style='background-color:#EBEBE9;'>DISTRIBUIDOR</th>";
            html = html + "<th style='background-color:#EBEBE9;'>PROVEEDOR</th>";
            html = html + "<th style='background-color:#EBEBE9;'>TÉCNICO</th>";
            html = html + "<th style='background-color:#EBEBE9;'>FECHA/HORA_INGRESO</th>";
            html = html + "<th style='background-color:#EBEBE9;'>FECHA/HORA_SALIDA</th>";
            html = html + "<th style='background-color:#EBEBE9;'>HORA(s)</th>";
            html = html + "<th style='background-color:#EBEBE9;'>MINUTO(s)</th>";
            html = html + "</tr></thead><tbody>";

            if (dt.Rows.Count == 0)
            {
                html = html + "<tr>";
                html = html + "<td colspan='8'>No se encontraron registros</td></tr>";
            }
            else
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    html = html + "<tr>";
                    html = html + "<td style=\"mso-number-format:mm/dd/yyyy hh:mm:ss;\">" + dt.Rows[i][0].ToString() + "</td>";
                    html = html + "<td>" + dt.Rows[i][1].ToString() + "</td>";
                    html = html + "<td>" + dt.Rows[i][5].ToString() + "</td>";
                    html = html + "<td>" + dt.Rows[i][7].ToString() + "</td>";
                    html = html + "<td style=\"mso-number-format:mm/dd/yyyy hh:mm:ss;\">" + dt.Rows[i][8].ToString() + "</td>";
                    html = html + "<td style=\"mso-number-format:mm/dd/yyyy hh:mm:ss;\">" + dt.Rows[i][9].ToString() + "</td>";
                    html = html + "<td>" + dt.Rows[i][10].ToString() + "</td>";
                    html = html + "<td>" + dt.Rows[i][11].ToString() + "</td>";

                    html = html + "</tr>";
                }
            }

            html = html + "</tbody></table>";

            Response.Write(html);

            Response.End();

        }
    }
}