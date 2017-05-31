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
    public partial class repOTsPorTipoTrabajo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // PARA QUE FUNCIONE LA EXPORTACION A EXCEL
            ScriptManager scriptManager = ScriptManager.GetCurrent(this.Page);
            scriptManager.RegisterPostBackControl(this.btnExportar);

            if (!IsPostBack)
            {
                ListarTipoMantenimiento();
                //Listar_Reporte();

                int dia_h, mes_h;
                string  sdia_h, smes_h;

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

                txtFechaDesde.Text = sdia_h + "/" + smes_h + "/" + DateTime.Now.Year.ToString();
                txtFechaHasta.Text = sdia_h + "/" + smes_h + "/" + DateTime.Now.Year.ToString();
                txtFechaDesde.Attributes.Add("ReadOnly", "true");
                txtFechaHasta.Attributes.Add("ReadOnly", "true");
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
            string BeginDate, EndDate, Mant = "" ;

            BeginDate = txtFechaDesde.Text;
            EndDate = txtFechaHasta.Text;

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

            List<beReportes> lbeReportes = br.ListarReporte_xTipoTrabajo(BeginDate, EndDate, Mant);

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

        protected void btnExportar_Click(object sender, ImageClickEventArgs e)
        {
            string BeginDate, EndDate, Mant = "";

            BeginDate = txtFechaDesde.Text;
            EndDate = txtFechaHasta.Text;

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

            Exportar(BeginDate, EndDate, Mant);
        }

        private void Exportar(string pfechad, string pfechah, string ptipo_mant)
        {
            String NombreXLS = "Reporte_FichaPorTipoTrabajo_" + DateTime.Now.ToString();

            brExportReportes br = new brExportReportes();

            DataTable dt = br.ListarReporte_xTipoTrabajo_Export(pfechad, pfechah, ptipo_mant);

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