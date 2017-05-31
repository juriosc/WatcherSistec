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
    public partial class repEstadTipoTrabOfiEntidad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // PARA QUE FUNCIONE LA EXPORTACION A EXCEL
                ScriptManager scriptManager = ScriptManager.GetCurrent(this.Page);
                scriptManager.RegisterPostBackControl(this.btnExportar);

                ListarTipoMantenimiento();
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

        protected void btnBuscar_Click(object sender, ImageClickEventArgs e)
        {
            Listar_Reporte();
        }

        protected void gvReporte_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvReporte.PageIndex = e.NewPageIndex;
            Listar_Reporte();
        }

        private void Listar_Reporte()
        {
            brReportes br = new brReportes();
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
                    Mant = Mant + row.Cells[0].Text + ",";
                }
            }
            int lmant = Mant.Length;
            if (lmant > 0) { Mant = Mant.Substring(0, lmant - 1); }

            List<beReportes> lbeReportes = br.ListarReporte_Estadistico_xTrabajoEntidad(BeginDate, EndDate, txtProveedor.Text.ToString(), Mant);

            gvReporte.DataSource = lbeReportes;
            gvReporte.DataBind();
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
            brReportes br = new brReportes();
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
                    Mant = Mant + row.Cells[0].Text + ",";
                }
            }
            int lmant = Mant.Length;
            if (lmant > 0) { Mant = Mant.Substring(0, lmant - 1); }

            Exportar(BeginDate, EndDate, txtProveedor.Text.ToString(), Mant);

        }

        private void Exportar(string pfechad, string pfechah, string pProveedorID, string ptipo_mant)
        {
            String NombreXLS = "Reporte_Estadistico_TipoTrabajoxOficina_" + DateTime.Now.ToString();

            brExportReportes br = new brExportReportes();

            DataTable dt = br.ListarReporte_Estadistico_xTrabajoEntidad_Export(pfechad, pfechah, pProveedorID, ptipo_mant);

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
            html = html + "<th style='background-color:#EBEBE9;'>PROVEEDOR</th>";
            html = html + "<th style='background-color:#EBEBE9;'>TIPO_MANTENIMIENTO</th>";
            html = html + "<th style='background-color:#EBEBE9;'>TRABAJOS x TIPO MANT</th>";
            html = html + "<th style='background-color:#EBEBE9;'>TRABAJOS x ENTIDAD</th>";
            html = html + "<th style='background-color:#EBEBE9;'>%(TIPO/ENTIDAD)</th>";
            html = html + "</tr></thead><tbody>";

            if (dt.Rows.Count == 0)
            {
                html = html + "<tr>";
                html = html + "<td colspan='5'>No se encontraron registros</td></tr>";
            }
            else
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    html = html + "<tr>";
                    html = html + "<td>" + dt.Rows[i][0].ToString() + "</td>";
                    html = html + "<td>" + dt.Rows[i][1].ToString() + "</td>";
                    html = html + "<td>" + dt.Rows[i][2].ToString() + "</td>";
                    html = html + "<td>" + dt.Rows[i][3].ToString() + "</td>";
                    html = html + "<td style=\"mso-number-format:'Percent';\">" + dt.Rows[i][4].ToString() + "</td>";

                    html = html + "</tr>";
                }
            }

            html = html + "</tbody></table>";

            Response.Write(html);

            Response.End();

        }
    }
}