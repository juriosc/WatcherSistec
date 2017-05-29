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
    public partial class repEstadTipoTrabOfiEntidad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListarTipoMantenimiento();
                //Listar_Reporte();

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
    }
}