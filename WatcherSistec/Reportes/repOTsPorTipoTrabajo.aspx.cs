﻿using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessRules;

namespace WatcherSistec.Reportes
{
    public partial class repOTsPorTipoTrabajo : System.Web.UI.Page
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

            gvSupervisiones.DataBind();
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

        protected void gvSupervisiones_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSupervisiones.PageIndex = e.NewPageIndex;
            Listar_Supervisiones();
        }

        private void Listar_Grilla_Subscriber()
        {
            brSubscriber br = new brSubscriber();
            //  List<beSubscriber> lstListarSubscriber = br.ListarSubscriber(subscribername, dealername, addressStreet);

        }
        protected void gvSubscriber_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            Listar_Grilla_Subscriber();

        }

        protected void btnBuscar_Click(object sender, ImageClickEventArgs e)
        {
            Listar_Supervisiones();
        }

        protected void btnNuevo_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("../Control_Tecnico/FichaSupervision.aspx");
        }
    }
}