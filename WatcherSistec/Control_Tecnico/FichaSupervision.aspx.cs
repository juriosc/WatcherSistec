﻿using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessRules;
using System.Data;
using System.Globalization;

namespace WatcherSistec.Control_Tecnico
{    
    public partial class FichaSupervision : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["FichaID"] != null)
                {
                    string IdFicha = Request.QueryString["FichaID"];

                    ListarTipoMantenimiento();

                    Ficha_Supervision(IdFicha);
                    Ficha_Abonados(IdFicha);                    
                    FichaTipoMant(IdFicha);                    
                    Ficha_Atenciones(IdFicha);
                    Ficha_Comentario(IdFicha);

                    txtID_Ficha.Text = IdFicha;
                    Bloque_Zona(gvAbonado.Rows[Convert.ToInt32(gvAbonado.Rows.Count) - 1].Cells[2].Text.ToString());
                }
                else
                {
                    ListarTipoMantenimiento();
                    Ficha_Atenciones("");
                    Bloque_Zona("");
                }
                
                
                //Listar_Atenciones();

                TabContainer1.ActiveTabIndex = 0;

                //if (Session["ListaAbonado"]!=null)
                //{
                //    gvAbonado.DataSource = (List<beFichaAbonado>)Session["ListaAbonado"];
                //    gvAbonado.DataBind();
                //}

                //if (Session["Select_Ficha_Supervision"] != null)
                //{
                //    List<beFichaSupervision> Ficha_Supervision = (List<beFichaSupervision>)Session["Select_Ficha_Supervision"];

                //    txtProv.Text = Ficha_Supervision[1].sProveedorName.ToString();
                //    txtNombre.Text = Ficha_Supervision[2].Nombres.ToString();
                //    txtFechaI.Text = Ficha_Supervision[3].Hora_Ingreso.ToString();
                //    txtFechaS.Text = Ficha_Supervision[4].Hora_Salida.ToString();
                //    txtObs_Tec.Text = Ficha_Supervision[5].Obs_Tec.ToString();
                //    txtPanel.Text = Ficha_Supervision[6].Panel.ToString();
                //    txtTelefono.Text = Ficha_Supervision[7].Nro_Telefono.ToString();
                //    txtInforme.Text = Ficha_Supervision[8].Nro_Informe.ToString();

                //}


            }
            //else
            //{

            //    beFichaAbonado.FAbonado = (List<beFichaAbonado>)Session["ListaAbonado"];
            //}
           
        }

        private void Ficha_Supervision(string FichaId)
        {
            try
            {
                brFichaSupervision br = new brFichaSupervision();
                
                List<beSupervision> Ficha_Supervision = br.Select_Ficha_Supervision(FichaId);

                if (Ficha_Supervision != null)
                {
                    txtProv.Text = Ficha_Supervision[0].sProveedorName.ToString();
                    txtNombre.Text = Ficha_Supervision[0].Nombres.ToString();
                    txtFechaI.Text = Ficha_Supervision[0].Hora_Ingreso.ToString();
                    txtFechaS.Text = Ficha_Supervision[0].Hora_Salida.ToString();
                    txtObs_Tec.Text = Ficha_Supervision[0].Obs_Tec.ToString();
                    txtPanel.Text = Ficha_Supervision[0].Panel.ToString();
                    txtTelefono.Text = Ficha_Supervision[0].Nro_Telefono.ToString();
                    txtInforme.Text = Ficha_Supervision[0].Nro_Informe.ToString();

                   //Session["Select_Ficha_Supervision"] = Ficha_Supervision;

                }
            }
            catch (Exception ex)
            {
                brLog brLog = new brLog();
                brLog.InsertarLog(ex.HResult.ToString(), ex.Message, "Ficha_Supervision", "SelectFicha");
            }
        }

        private void ListarTipoMantenimiento()
        {
            brTipoMantenimiento br = new brTipoMantenimiento();
            List<beTipoMant> lbeMantenimiento = br.ComboMantenimiento();

            gvTipoMantenimiento.DataSource = lbeMantenimiento;
            gvTipoMantenimiento.DataBind();
        }

        private void FichaTipoMant(string ID_FICHA)
        {
            brFichaTipoMant br = new brFichaTipoMant();
            List<beTipoMant> lbeFichaTipoMant = br.Select_Ficha_TipoMant(ID_FICHA);

            foreach (GridViewRow fila in gvTipoMantenimiento.Rows)
            {
                foreach (var a in lbeFichaTipoMant)
                {
                    if (a.TipoMant_ID.ToString() == fila.Cells[0].Text)
                    {
                        CheckBox check = fila.FindControl("chkSel") as CheckBox;
                        check.Checked = true;
                    }
                }
            }
            
        }

        protected void gvTipoMantenimiento_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTipoMantenimiento.PageIndex = e.NewPageIndex;
            ListarTipoMantenimiento();
        }

        private void Ficha_Abonados(string ID_Ficha)
        {
            brFichaAbonado br = new brFichaAbonado();
            //int ID_Ficha = txtHora.Text.Trim().Equals("") ? 0 : Convert.ToInt32(txtHora.Text);            

            List<beAbonado> ListarFicha_Abonados = br.ListarFichaAbonado(ID_Ficha);
            gvAbonado.DataSource = ListarFicha_Abonados;
            gvAbonado.DataBind();
        }
        protected void gvAbonado_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAbonado.PageIndex = e.NewPageIndex;
            Ficha_Abonados(txtID_Ficha.Text);
        }
        private void Ficha_Comentario(string Ficha)
        {
            brComentario br = new brComentario();

            List<beComentario> ListarComentario = br.ListarComentario(Convert.ToInt32(Ficha));
        }

        private void ListarFicha_Comentario_Zona(string Ficha, string Zona)
        {
            brComentario br = new brComentario();

            List<beComentario> ListarComentarioZona = br.ListarComentarioZona(Convert.ToInt32(Ficha),Convert.ToInt32(Zona));
            gvComentario.DataSource = ListarComentarioZona;
            gvComentario.DataBind();
        }


        private void Ficha_Atenciones(string ID_Ficha)
        {
            brFichaAtenciones brFA = new brFichaAtenciones();
            gvAtenciones.DataSource = brFA.ListarFichaAtencion(ID_Ficha);
            gvAtenciones.DataBind();
        }

        protected void gvComentario_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvComentario.PageIndex = e.NewPageIndex;
            //ListarFicha_Comentario_Zona();
        }

        //private void Listar_Atenciones()
        //{
        //    brFichaAtenciones br = new brFichaAtenciones();            

        //    List<beAtenciones> ListarFichaAtencion = br.ListarFichaAtencion("");
        //    gvAtenciones.DataSource = ListarFichaAtencion;
        //    gvAtenciones.DataBind();
        //}
        protected void gvAtenciones_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAtenciones.PageIndex = e.NewPageIndex;
            Ficha_Atenciones(txtID_Ficha.Text);
            //Listar_Atenciones();
        }

        
        private void Bloque_Zona(string csid)
        {
            brBloqueZona br = new brBloqueZona();
            
            List<beBloqueZona> ListarBloqueZona = br.ListarBloqueZona(csid);
            gvBloqueZonas.DataSource = ListarBloqueZona;
            gvBloqueZonas.DataBind();
        }
        
        protected void btZona_Click(object sender, EventArgs e)
        {
            string Ficha = txtID_Ficha.Text;
            string Zona = txtZonaC.Text;
            ListarFicha_Comentario_Zona(Ficha,Zona);
        }

      
        protected void btnAgregar_Click(object sender, ImageClickEventArgs e)
        {
            //string script = "mostrarPopupTecnico('Nuevo - Ficha Supervisión - Tecnico:',500,300);";
            //ScriptManager.RegisterClientScriptBlock(this, typeof(UpdatePanel), "jsMensaje", script, true);
            
        }

        protected void btnAdicionar_Click(object sender, ImageClickEventArgs e)
        {
            //string script = "mostrarPopupAbonado('Nuevo - Ficha Supervisión - Abonado:',500,235);";
            //ScriptManager.RegisterClientScriptBlock(this, typeof(UpdatePanel), "jsMensaje", script, true);
            Listar_Grilla_Subscriber(txtBDealerCode.Text, txtBCsid.Text, txtBSubscriberName.Text);
            hdfMantEstado.Value = "NUEVO";
        }

        private void Listar_Grilla_Subscriber(string dealercode, string csid, string subscribername)
        {
            brSubscriber br = new brSubscriber();
            List<beSubscriber> lstListarSubscriber = br.ListarSubscriber(dealercode, csid, subscribername);
            gvListarSubscriber.DataSource = lstListarSubscriber;
            gvListarSubscriber.DataBind();
        }
        protected void gvSubscriber_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSubscriber.PageIndex = e.NewPageIndex;
            Listar_Grilla_Subscriber(txtDCode.Text, txtACode.Text, txtAName.Text);
        }

        protected void btnBuscarSubscriber_Click(object sender, EventArgs e)
        {
            Listar_Grilla_Subscriber(txtDCode.Text, txtACode.Text, txtAName.Text);
        }
        private void Listar_Grilla_Dealer(string pDcode, string pDname)
        {
            brDealer br = new brDealer();
            List<beDealer> lstListarDealer = br.ListarDealer(pDcode, pDname);
            gvDealer.DataSource = lstListarDealer;
            gvDealer.DataBind();
        }

        private void Listar_Grilla_Tecnico(string psProveedorName, string pNombres)
        {
            brFichaTecnico br = new brFichaTecnico();
            List<beTecnico> lstListarTecnico = br.ListarTecnico(psProveedorName,pNombres);
            gvListadoTecnicos.DataSource = lstListarTecnico;
            gvListadoTecnicos.DataBind();
        }

        protected void gvDealer_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDealer.PageIndex = e.NewPageIndex;
            Listar_Grilla_Dealer(txtDealer.Text, txtNameDealer.Text);
        }

        protected void btnBuscarDealer_Click(object sender, EventArgs e)
        {
            Listar_Grilla_Dealer(txtDealer.Text, txtNameDealer.Text);
        }

        protected void btnAceptar_Dealer_Click(object sender, EventArgs e)
        {
           // txtDealercode.Text =  HttpUtility.HtmlDecode(gvDealer.Rows[gvDealer.SelectedIndex].Cells[0].Text);
           // txtDealerName.Text = HttpUtility.HtmlDecode(gvDealer.Rows[gvDealer.SelectedIndex].Cells[1].Text);
        }

        protected void btnBusCodDistribuidor_Click(object sender, EventArgs e)
        {
            
        }

        protected void gvBloqueZonas_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#CFCFCF'");
                //e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;");

                for (int i = 1; i <= 39; i++)
                {

                    string[] Propiedad = e.Row.Cells[i].Text.Split('|');

                    if (Propiedad[0].Equals("N"))
                    {
                        e.Row.Cells[i - 1].ForeColor = System.Drawing.Color.Black;
                        e.Row.Cells[i - 1].Font.Bold = true;
                        e.Row.Cells[i - 1].Attributes.Add("onclick", "mostrarPopupComentario('" + e.Row.Cells[i - 1].Text + "',600,560);");
                        e.Row.Cells[i - 1].Attributes["style"] = "cursor:pointer";
                        e.Row.Cells[i - 1].Attributes.Add("Title", Propiedad[1].ToString());
                    }

                }
            }

        }

        protected void btnAceptarTEnvioMSM_Click(object sender, EventArgs e)
        {
            bool updatedAT;


            string outID_Atencion = "";


            foreach (GridViewRow fila in gvAbonado.Rows)
            {

                RadioButton rbt = fila.FindControl("rbtSelAbonado") as RadioButton;

                if (rbt.Checked)
                {

                    brFichaAtenciones brAT = new brFichaAtenciones();

                    updatedAT = brAT.InsertarFichaAtencion(
                        Convert.ToInt64(txtID_Ficha.Text)
                        , HttpUtility.HtmlDecode(fila.Cells[2].Text)
                        , HttpUtility.HtmlDecode(Session["sUserIden"].ToString())                        
                        , out outID_Atencion);


                    string men = "";

                    if (updatedAT == false)
                    {
                        men = "Hubo un problema al momento de intentar registrar el Tipo Mantenimiento";
                    }
                    else
                    {
                        men = "Tipo Mantenimiento registrado correctamente";
                    }

                    string script2 = "alert('Mensaje: ' " + men + "');";
                    ScriptManager.RegisterClientScriptBlock(this, typeof(UpdatePanel), "jsMensaje", script2, true);

                }
            }                        

            Ficha_Atenciones(txtID_Ficha.Text);

            tmrRecepSeniales.Enabled = true;
            lblTiempoFaltante.Text = "60";
        }

        protected void tmrActualizarZonas_Tick(object sender, EventArgs e)
        {
            if (Request.QueryString["FichaID"] != null)
            {
                Bloque_Zona(gvAbonado.Rows[Convert.ToInt32(gvAbonado.Rows.Count) - 1].Cells[2].Text.ToString());
            }
        }

        protected void btnListarTecnico_Click(object sender, EventArgs e)
        {
            Listar_Grilla_Tecnico(txtBsProveedorName.Text, txtBNombres.Text);
        }

        protected void btnAgregar_Click1(object sender, ImageClickEventArgs e)
        {
            Listar_Grilla_Tecnico(txtBsProveedorName.Text, txtBNombres.Text);
        }

        protected void btnAceptarListarTec_Click(object sender, EventArgs e)
        {
            try
            {
                txtProveedorID.Text = gvListadoTecnicos.Rows[gvListadoTecnicos.SelectedIndex].Cells[0].Text;
                txtProv.Text = HttpUtility.HtmlDecode(gvListadoTecnicos.Rows[gvListadoTecnicos.SelectedIndex].Cells[1].Text);
                txtPersonalID.Text = gvListadoTecnicos.Rows[gvListadoTecnicos.SelectedIndex].Cells[2].Text;
                txtNombre.Text = HttpUtility.HtmlDecode(gvListadoTecnicos.Rows[gvListadoTecnicos.SelectedIndex].Cells[3].Text);
            }
            catch (Exception)
            {
                string script = "alert('No selecciono ningun registro');";
                ScriptManager.RegisterClientScriptBlock(this, typeof(UpdatePanel), "jsMensaje", script, true);
            }
        }

        protected void gvListarSubscriber_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvListarSubscriber.PageIndex = e.NewPageIndex;
            btnListarSubcriber_Click(null, null);   
        }

        protected void btnListarSubcriber_Click(object sender, EventArgs e)
        {
            Listar_Grilla_Subscriber(txtBDealerCode.Text, txtBCsid.Text, txtBSubscriberName.Text);
        }

        protected void gvListarSubscriber_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvListarSubscriber.SelectedRow;
            txtSelDealercode.Text = HttpUtility.HtmlDecode(row.Cells[0].Text);
            txtSelDealerName.Text = HttpUtility.HtmlDecode(row.Cells[1].Text);
            txtSelCsid.Text = HttpUtility.HtmlDecode(row.Cells[2].Text);
            txtSelSubscriberName.Text = HttpUtility.HtmlDecode(row.Cells[3].Text);
            txtSelLocalid.Text = HttpUtility.HtmlDecode(row.Cells[4].Text);
            txtSelLocaldes.Text = HttpUtility.HtmlDecode(row.Cells[5].Text);
        }

        protected void btnAceptarListarSub_Click(object sender, EventArgs e)
        {

            beAbonado fa = new beAbonado();

            if (hdfMantEstado.Value=="NUEVO")
            {
                fa.CSID = txtSelCsid.Text;
                fa.SubscriberName = txtSelSubscriberName.Text;
                fa.DealerCode = txtSelDealercode.Text;
                fa.LocalID = txtSelLocalid.Text;            
                fa.Observaciones = txtSelObservacion.Text;
                beAbonado.FAbonado.Add(fa);
            }
            else
            {
                beAbonado.FAbonado[Convert.ToInt16(hdfIndex.Value)].DealerCode = txtSelDealercode.Text;
                beAbonado.FAbonado[Convert.ToInt16(hdfIndex.Value)].CSID = txtSelCsid.Text;
                beAbonado.FAbonado[Convert.ToInt16(hdfIndex.Value)].SubscriberName = txtSelSubscriberName.Text;
                beAbonado.FAbonado[Convert.ToInt16(hdfIndex.Value)].LocalID = txtSelLocalid.Text;
                beAbonado.FAbonado[Convert.ToInt16(hdfIndex.Value)].Observaciones = txtSelObservacion.Text;

            }
            

            Session["ListaAbonado"] = beAbonado.FAbonado;

            gvAbonado.DataSource = beAbonado.FAbonado;
            gvAbonado.DataBind();
        }

        protected void gvAbonado_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            string script1;

            switch (e.CommandName)
            {
                case "EditarAbon":

                    hdfMantEstado.Value = "EDITAR";
                    hdfIndex.Value = rowIndex.ToString();
                    txtSelDealercode.Text = HttpUtility.HtmlDecode(gvAbonado.Rows[rowIndex].Cells[0].Text);
                    txtSelLocalid.Text = HttpUtility.HtmlDecode(gvAbonado.Rows[rowIndex].Cells[1].Text);
                    txtSelCsid.Text = HttpUtility.HtmlDecode(gvAbonado.Rows[rowIndex].Cells[2].Text);
                    txtSelSubscriberName.Text = HttpUtility.HtmlDecode(gvAbonado.Rows[rowIndex].Cells[3].Text);
                    txtSelObservacion.Text = HttpUtility.HtmlDecode(gvAbonado.Rows[rowIndex].Cells[4].Text);

                    script1 = "mostrarPopupAbonado('MODIFICAR ABONADO ...',920,520);";
                    ScriptManager.RegisterClientScriptBlock(this, typeof(UpdatePanel), "jsMensaje", script1, true);

                break;

                case "EliminarAbon":
                    beAbonado.FAbonado.Remove(beAbonado.FAbonado[rowIndex]);

                    Session["ListaAbonado"]=beAbonado.FAbonado;
                    gvAbonado.DataSource = beAbonado.FAbonado;
                    gvAbonado.DataBind();

                break;

            }

            
        }

        protected void btnAdicionar_Command(object sender, CommandEventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            brFichaSupervision br = new brFichaSupervision();
            string outID_Ficha = "";            
            string men = "";
            
            IFormatProvider culture = new CultureInfo("es-PE", true);
            DateTime fechaI = DateTime.ParseExact(txtFechaI.Text, "dd/MM/yyyy HH:mm", culture);
            DateTime fechaS = DateTime.ParseExact(txtFechaS.Text, "dd/MM/yyyy HH:mm", culture);
            
            //GUARDANDO FICHA SUPÈRVISION
            bool updated = br.InsertarFichaSupervision(
                Convert.ToInt32(txtProveedorID.Text), Convert.ToInt32(txtPersonalID.Text), fechaI
                , fechaS , txtObs_Tec.Text, 1,txtTelefono.Text, txtPanel.Text, ""
                , out outID_Ficha);
            if (updated == false)
            {
                men = "Hubo un problema al momento de intentar registrar la alarma";
            }            
            else
            {
                men = "La alarma se registro correctamente";
            }

            txtID_Ficha.Text = outID_Ficha;

            string script = "alert('Mensaje: ' "+ men+ "');";
            ScriptManager.RegisterClientScriptBlock(this, typeof(UpdatePanel), "jsMensaje", script, true);

            //GUARDANDO FICHA ABONADO

            foreach (GridViewRow fila in gvAbonado.Rows)
            {
                brFichaAbonado brFA = new brFichaAbonado();
                bool updatedFA = brFA.InsertarFichaAbonado(Convert.ToInt32(txtID_Ficha.Text), HttpUtility.HtmlDecode(fila.Cells[0].Text), HttpUtility.HtmlDecode(fila.Cells[2].Text), HttpUtility.HtmlDecode(fila.Cells[1].Text), HttpUtility.HtmlDecode(fila.Cells[4].Text));

                if (updated == false)
                {
                    men = "Hubo un problema al momento de intentar registrar el Abonado";
                }
                else
                {
                    men = "Abonados registrados correctamente";
                }

            }

            string script1 = "alert('Mensaje: ' " + men + "');";
            ScriptManager.RegisterClientScriptBlock(this, typeof(UpdatePanel), "jsMensaje", script1, true);

            //GUARDANDO FICHA TIPO MANTENIMIENTO

            foreach (GridViewRow fila in gvTipoMantenimiento.Rows)
            {

                CheckBox check = fila.FindControl("chkSel") as CheckBox;

                if (check.Checked)
                {

                    brFichaTipoMant brTM = new brFichaTipoMant();

                    bool updatedTM = brTM.InsertarFichaTipoMant(Convert.ToInt64(txtID_Ficha.Text), Convert.ToInt64(fila.Cells[0].Text));

                    if (updated == false)
                    {
                        men = "Hubo un problema al momento de intentar registrar el Tipo Mantenimiento";
                    }
                    else
                    {
                        men = "Tipo Mantenimiento registrado correctamente";
                    }

                }
            }

            string script2 = "alert('Mensaje: ' " + men + "');";
            ScriptManager.RegisterClientScriptBlock(this, typeof(UpdatePanel), "jsMensaje", script2, true);


        }

        protected void btnIniciar_Click(object sender, EventArgs e)
        {

        }

        protected void tmrRecepSeniales_Tick(object sender, EventArgs e)
        {

            if (Convert.ToInt16(lblTiempoFaltante.Text) > 0)
            {
                lblTiempoFaltante.Text = Convert.ToString(Convert.ToInt16(lblTiempoFaltante.Text) - 1);
            }
            else
            {
                lblTiempoFaltante.Text = "59";
            }

            string UFilaID_Atencion = gvAtenciones.Rows[Convert.ToInt32(gvAtenciones.Rows.Count) - 1].Cells[0].Text.ToString();
            string UFilaCSID = gvAtenciones.Rows[Convert.ToInt32(gvAtenciones.Rows.Count) - 1].Cells[1].Text.ToString();
            Int64 UFilaAlarmHistoryID = Convert.ToInt64(gvAtenciones.Rows[Convert.ToInt32(gvAtenciones.Rows.Count) - 1].Cells[7].Text);
            
            //INSERTAR SEÑALES
            brSeniales brSE = new brSeniales();
            brSE.Insertar_Señales_Aten(Convert.ToInt64(txtID_Ficha.Text), Convert.ToInt16(UFilaID_Atencion), UFilaCSID, UFilaAlarmHistoryID);

            //VERIFICAR SEÑALES PARA CAMBIAR COLORES ALT, BB, FAC ....
            List<beSeniales> lstVerificarSeniales = brSE.Verificar_Seniales_Aten(UFilaAlarmHistoryID, UFilaCSID);

            for (int i = 0; i <= lstVerificarSeniales.Count-1; i++)
            {
                string SignalIdentifier = lstVerificarSeniales[i].SignalIdentifier;
                string FLAG_TIPO = lstVerificarSeniales[i].FLAG_TIPO;

                    if (SignalIdentifier.Equals("LT"))
                    {
                        lblALT.BackColor = System.Drawing.Color.Red;
                    }

                    if (SignalIdentifier.Equals("LR"))
                    {                        
                        lblALT.BackColor = System.Drawing.Color.Green;
                    }

                    if (SignalIdentifier.Equals("LT"))
                    {
                        lblALT.BackColor = System.Drawing.Color.Red;
                    }

                    if (SignalIdentifier.Equals("LR"))
                    {
                        lblALT.BackColor = System.Drawing.Color.Green;
                    }


            }

        }

        protected void btnMarcar_Click(object sender, EventArgs e)
        {
           
        }

        protected void btnDesmarcar_Click(object sender, EventArgs e)
        {
            
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

        protected void btnDetener_Click(object sender, EventArgs e)
        {
            txtIdAtencion.Text = gvAtenciones.Rows[Convert.ToInt32(gvAtenciones.Rows.Count) - 1].Cells[0].Text.ToString();
            txtUsuario.Text = gvAtenciones.Rows[Convert.ToInt32(gvAtenciones.Rows.Count) - 1].Cells[2].Text.ToString();
            txtFechaTermino.Text = DateTime.Now.ToString("dd-MM-yyyy HH:mm");

        }

    }
}