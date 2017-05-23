using Entity;
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
                    Ficha_TipoMant(IdFicha);                    
                    Ficha_Atenciones(IdFicha);
                    //Ficha_Comentario(IdFicha);

                    txtID_Ficha.Text = IdFicha;
                    
                    if(gvAtenciones.Rows.Count>0)
                    {
                        Bloque_Zona(gvAbonado.Rows[Convert.ToInt32(gvAbonado.Rows.Count) - 1].Cells[2].Text.ToString(), gvAtenciones.Rows[Convert.ToInt32(gvAtenciones.Rows.Count) - 1].Cells[11].Text.ToString());
                    }
                    else 
                    {
                        Bloque_Zona("", "");
                    }

                    btnAgregarTecnico.Enabled = false;
                    btnAgregarTecnico.BackColor = System.Drawing.Color.DimGray;
                    btnLimpiarTecnico.Enabled = false;
                    btnLimpiarTecnico.BackColor = System.Drawing.Color.DimGray;
                    btnAdicionar.Enabled = false;
                    
                }
                else
                {
                    beAbonado.FAbonado.Clear();
                    hdfEstadoFicha.Value = "1";
                    ListarTipoMantenimiento();
                    Ficha_Atenciones("");
                    Bloque_Zona("","");
                    Ficha_Abonados("");

                    btnGuardar.Enabled = true;
                    btnPendiente.Enabled = false;
                    btnCancelar.Enabled = false;
                    btnConcluir.Enabled = false;

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
                    string fechaing = string.Format("{0:yyyy/MM/dd 00:00}", Ficha_Supervision[0].Hora_Ingreso.ToString());
                    string fechasal = string.Format("{0:yyyy/MM/dd 00:00}", Ficha_Supervision[0].Hora_Salida.ToString());

                    txtProv.Text = Ficha_Supervision[0].sProveedorName.ToString();
                    txtNombre.Text = Ficha_Supervision[0].Nombres.ToString();
                    txtFechaIngreso.Text = fechaing; //Ficha_Supervision[0].Hora_Ingreso.ToString();
                    txtFechaSalida.Text = fechasal; //Ficha_Supervision[0].Hora_Salida.ToString();
                    txtObs_Tec.Text = Ficha_Supervision[0].Obs_Tec.ToString();
                    txtPanel.Text = Ficha_Supervision[0].Panel.ToString();
                    txtTelefono.Text = Ficha_Supervision[0].Nro_Telefono.ToString();
                    hdfEstadoFicha.Value = Ficha_Supervision[0].Estado_Ficha.ToString();
                    //txtInforme.Text = Ficha_Supervision[0].Nro_Informe.ToString();
                   //Session["Select_Ficha_Supervision"] = Ficha_Supervision;

                    switch (Ficha_Supervision[0].Estado_Ficha.ToString())
                    {
                        case "1": //PENDIENTE
                            btnGuardar.Enabled = false;
                            btnPendiente.Enabled = true;
                            btnCancelar.Enabled = true;
                            btnConcluir.Enabled = true;
                            break;
                        case "2"://EN ATENCION
                            btnGuardar.Enabled = false;
                            btnPendiente.Enabled = true;
                            btnCancelar.Enabled = true;
                            btnConcluir.Enabled = true;
                            break;
                        case "3"://CONCLUIDO
                            btnGuardar.Enabled = false;
                            btnPendiente.Enabled = false;
                            btnCancelar.Enabled = false;
                            btnConcluir.Enabled = false;
                            break;
                        case "4"://CANCELADO
                            btnGuardar.Enabled = false;
                            btnPendiente.Enabled = false;
                            btnCancelar.Enabled = false;
                            btnConcluir.Enabled = false;
                            break;

                    }



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

        private void Ficha_TipoMant(string ID_FICHA)
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
            //brComentario br = new brComentario();

            //List<beComentario> ListarComentarioZona = br.ListarComentarioZona(Convert.ToInt32(Ficha),Convert.ToInt32(Zona));
            //gvComentario.DataSource = ListarComentarioZona;
            //gvComentario.DataBind();
        }


        private void Ficha_Atenciones(string ID_Ficha)
        {
            brFichaAtenciones brFA = new brFichaAtenciones();
            gvAtenciones.DataSource = brFA.ListarFichaAtencion(ID_Ficha);
            gvAtenciones.DataBind();

            if ((gvAtenciones.Rows.Count)>=1)
            {

                if (gvAtenciones.Rows[Convert.ToInt32(gvAtenciones.Rows.Count) - 1].Cells[7].Text.Trim().Equals("&nbsp;")) 
                {
                    btnIniciar.Enabled = false;
                    btnDetener.Enabled = true;
                }
            }


        }

        protected void gvComentario_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //gvComentario.PageIndex = e.NewPageIndex;
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

        
        private void Bloque_Zona(string csid, string alarmhistoryidinicial)
        {
            brBloqueZona br = new brBloqueZona();            
            List<beBloqueZona> ListarBloqueZona = br.ListarBloqueZona(csid, alarmhistoryidinicial);
            gvBloqueZonas.DataSource = ListarBloqueZona;
            gvBloqueZonas.DataBind();
        }
        
        protected void btZona_Click(object sender, EventArgs e)
        {
            //string Ficha = txtID_Ficha.Text;
           // string Zona = txtZonaC.Text;
            //ListarFicha_Comentario_Zona(Ficha,Zona);
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

            txtUpDealercode.Text = "";
            txtUpDealerName.Text = "";
            txtUpCsid.Text = "";
            txtUpSubscriberName.Text = "";
            txtUpLocalid.Text = "";
            txtUpLocaldes.Text = "";
            txtUpObservacion.Text = "";
            
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
                        if (Propiedad[0].ToString().Equals("P"))
                        {                            
                            e.Row.Cells[i - 1].Font.Bold = true;
                            e.Row.Cells[i - 1].Attributes.Add("onclick", "mostrarComentario('Trabajo(s) / comentario(s) - Zona: " + e.Row.Cells[i - 1].Text + "', '"+ e.Row.Cells[i - 1].Text +"' ,600,370);");
                            e.Row.Cells[i - 1].Attributes["style"] = "cursor:pointer";
                            e.Row.Cells[i - 1].Attributes.Add("Title", Propiedad[1].ToString());
                            e.Row.Cells[i - 1].ForeColor = ColorLetra(Propiedad[2].ToString());
                            if(Convert.ToInt16(Propiedad[3].ToString())>0 && Convert.ToInt16(Propiedad[4].ToString())>0)
                            {
                                e.Row.Cells[i - 1].BackColor = System.Drawing.Color.Pink;
                            }
                            else
                            {
                                if(Convert.ToInt16(Propiedad[3].ToString())>0 && Convert.ToInt16(Propiedad[4].ToString())==0)
                                {
                                    e.Row.Cells[i - 1].BackColor = System.Drawing.Color.FromArgb(245, 245, 121); 
                                } 
                                else
                                {
                                    if(Convert.ToInt16(Propiedad[3].ToString())==0 && Convert.ToInt16(Propiedad[4].ToString())>0)
                                    {
                                        e.Row.Cells[i - 1].BackColor = System.Drawing.Color.FromArgb(0, 255, 255);
                                    }
                                    else
                                    {
                                        e.Row.Cells[i - 1].BackColor = System.Drawing.Color.White;

                                    }

                                }
                            }
                        }
                      


                }
            }

        }

        public System.Drawing.Color ColorLetra(string Letra)
        {
            System.Drawing.Color Color;

            switch (Letra)
            {
                case "N":
                    Color = System.Drawing.Color.Black;
                    break;
                case "R":
                    Color = System.Drawing.Color.Red;
                    break;
                case "A":
                    Color = System.Drawing.Color.Blue;
                    break;
                case "V":
                    Color = System.Drawing.Color.Green;
                    break;
                default:
                    Color = System.Drawing.Color.Black;
                    break;
            }

            return Color;
        }
        
        protected void btnAceptarTEnvioMSM_Click(object sender, EventArgs e)
        {
            bool updatedAT;
            string outID_Atencion = "";
            bool ActualizarAten=false;

            foreach (GridViewRow fila in gvAbonado.Rows)
            {

                RadioButton rbt = fila.FindControl("rbtSelAbonado") as RadioButton;

                if (rbt.Checked)
                {
                    ActualizarAten = true;
                }
            }



            if (ActualizarAten==true)
            {
                //CUANDO SE INICIA LA ATENCION, SE DEBE COLOCAR EL ESTADO DE LA FICHA EN ATENCION

                brFichaSupervision br = new brFichaSupervision();
                string men = "";

                bool updated = br.ActualizarFichaSupervision(2, Convert.ToInt32(txtID_Ficha.Text));

                if (updated == false)
                {
                    men = "Hubo un problema al momento de intentar actualizar la atención";
                }
                else
                {
                    men = "La atención se registro correctamente";
                }

                //string script = "alert('Mensaje:  " + men + "');";
                //ScriptManager.RegisterClientScriptBlock(this, typeof(UpdatePanel), "jsMensaje", script, true);

                ////////////

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

                        if (updatedAT == false)
                        {
                            men = "Hubo un problema al momento de intentar registrar el Tipo Mantenimiento";
                        }
                        else
                        {
                            btnIniciar.Enabled = false;
                            btnDetener.Enabled = true;
                            men = "Tipo Mantenimiento registrado correctamente";
                        }

                        //string script2 = "alert('Mensaje:  " + men + "');";
                        //ScriptManager.RegisterClientScriptBlock(this, typeof(UpdatePanel), "jsMensaje", script2, true);

                    }
                }

                Ficha_Atenciones(txtID_Ficha.Text);

                //tmrActualizarZonas.Enabled = true;

                tmrRecepSeniales.Enabled = true;
                lblTiempoFaltante.Text = "60";
            }
            else 
            {
                string script2 = "alert('Debe seleccionar un abonado para iniciar las atenciones');";
                ScriptManager.RegisterClientScriptBlock(this, typeof(UpdatePanel), "jsMensaje", script2, true);
            
            }
            
        }

        protected void tmrActualizarZonas_Tick(object sender, EventArgs e)
        {
            if (Request.QueryString["FichaID"] != null)
            {
                if (gvAtenciones.Rows.Count > 0)
                {
                    Bloque_Zona(gvAbonado.Rows[Convert.ToInt32(gvAbonado.Rows.Count) - 1].Cells[2].Text.ToString(), gvAtenciones.Rows[Convert.ToInt32(gvAtenciones.Rows.Count) - 1].Cells[11].Text.ToString());
                }
                else
                {
                    Bloque_Zona("", "");
                }
            }
            else
            {
                if (gvAbonado.Rows.Count > 0)
                {
                    if (gvAtenciones.Rows.Count > 0)
                    {
                        Bloque_Zona(gvAbonado.Rows[Convert.ToInt32(gvAbonado.Rows.Count) - 1].Cells[2].Text.ToString(), gvAtenciones.Rows[Convert.ToInt32(gvAtenciones.Rows.Count) - 1].Cells[11].Text.ToString());
                    }
                }
                else
                {
                    Bloque_Zona("", "");
                }

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
                txtUpProveedorID.Text = gvListadoTecnicos.Rows[gvListadoTecnicos.SelectedIndex].Cells[0].Text;
                txtUpProv.Text = HttpUtility.HtmlDecode(gvListadoTecnicos.Rows[gvListadoTecnicos.SelectedIndex].Cells[1].Text);
                txtUpPersonalID.Text = gvListadoTecnicos.Rows[gvListadoTecnicos.SelectedIndex].Cells[2].Text;
                txtUpNombre.Text = HttpUtility.HtmlDecode(gvListadoTecnicos.Rows[gvListadoTecnicos.SelectedIndex].Cells[3].Text);
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
          
        }

        protected void btnAceptarListarSub_Click(object sender, EventArgs e)
        {

            GridViewRow row = gvListarSubscriber.SelectedRow;
            txtUpDealercode.Text = HttpUtility.HtmlDecode(row.Cells[0].Text);
            txtUpDealerName.Text = HttpUtility.HtmlDecode(row.Cells[1].Text);
            txtUpCsid.Text = HttpUtility.HtmlDecode(row.Cells[2].Text);
            txtUpSubscriberName.Text = HttpUtility.HtmlDecode(row.Cells[3].Text);
            txtUpLocalid.Text = HttpUtility.HtmlDecode(row.Cells[4].Text);
            txtUpLocaldes.Text = HttpUtility.HtmlDecode(row.Cells[5].Text);

            string script = "SalirEmerListarAbonados();";
            ScriptManager.RegisterClientScriptBlock(this, typeof(UpdatePanel), "jsMensaje", script, true);
            

            /*
            beAbonado fa = new beAbonado();            

            if (hdfMantEstado.Value=="NUEVO")
            {
                fa.CSID = txtUpCsid.Text;
                fa.SubscriberName = txtUpSubscriberName.Text;
                fa.DealerCode = txtUpDealercode.Text;
                fa.LocalID = txtUpLocalid.Text;            
                fa.Observaciones = txtUpObservacion.Text;
                beAbonado.FAbonado.Add(fa);
            }
            else
            {
                beAbonado.FAbonado[Convert.ToInt16(hdfIndex.Value)].DealerCode = txtUpDealercode.Text;
                beAbonado.FAbonado[Convert.ToInt16(hdfIndex.Value)].CSID = txtUpCsid.Text;
                beAbonado.FAbonado[Convert.ToInt16(hdfIndex.Value)].SubscriberName = txtUpSubscriberName.Text;
                beAbonado.FAbonado[Convert.ToInt16(hdfIndex.Value)].LocalID = txtUpLocalid.Text;
                beAbonado.FAbonado[Convert.ToInt16(hdfIndex.Value)].Observaciones = txtUpObservacion.Text;

            }
            

            //Session["ListaAbonado"] = beAbonado.FAbonado;

            gvAbonado.DataSource = beAbonado.FAbonado;
            gvAbonado.DataBind();
             */
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
                    txtUpDealercode.Text = HttpUtility.HtmlDecode(gvAbonado.Rows[rowIndex].Cells[0].Text);
                    txtUpLocalid.Text = HttpUtility.HtmlDecode(gvAbonado.Rows[rowIndex].Cells[1].Text);
                    txtUpCsid.Text = HttpUtility.HtmlDecode(gvAbonado.Rows[rowIndex].Cells[2].Text);
                    txtUpSubscriberName.Text = HttpUtility.HtmlDecode(gvAbonado.Rows[rowIndex].Cells[3].Text);
                    txtUpObservacion.Text = HttpUtility.HtmlDecode(gvAbonado.Rows[rowIndex].Cells[4].Text);

                    script1 = "mostrarEmerUpAbonado('MODIFICAR ABONADO ...',750,250);";
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

            try
            {
                IFormatProvider culture = new CultureInfo("es-PE", true);
                DateTime fechaI = DateTime.Today;

                DateTime fechaS = DateTime.ParseExact("01/01/1900 00:00", "dd/MM/yyyy HH:mm", culture);

                if (txtFechaSalida.Text.Trim().Length > 0)
                {
                    fechaS = DateTime.ParseExact(txtFechaSalida.Text, "dd/MM/yyyy HH:mm", culture);
                }

                //GUARDANDO FICHA SUPÈRVISION
                bool updated = br.InsertarFichaSupervision(
                    Convert.ToInt32(txtProveedorID.Text), Convert.ToInt32(txtPersonalID.Text), fechaI
                    , fechaS, txtObs_Tec.Text, 1, txtTelefono.Text, txtPanel.Text, ""
                    , out outID_Ficha);
                if (updated == false)
                {
                    men = "Hubo un problema al momento de intentar registrar la ficha";
                }
                else
                {
                    men = "La ficha se registro correctamente";
                }

                txtID_Ficha.Text = outID_Ficha;

                string script = "alert('Mensaje:  " + men + "');";
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

                string script1 = "alert('Mensaje:  " + men + "');";
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

                btnGuardar.Enabled = false;
                btnCancelar.Enabled = true;
                btnConcluir.Enabled = true;
                btnPendiente.Enabled = true;

                Ficha_Supervision(outID_Ficha);

                btnAgregarTecnico.Enabled = false;
                btnAgregarTecnico.BackColor = System.Drawing.Color.DimGray;
                btnLimpiarTecnico.Enabled = false;
                btnLimpiarTecnico.BackColor = System.Drawing.Color.DimGray;
                btnAdicionar.Enabled = false;


                string script2 = "alert('Mensaje:  " + men + "');";
                ScriptManager.RegisterClientScriptBlock(this, typeof(UpdatePanel), "jsMensaje", script2, true);

            }
            catch (Exception ex)
            {

                string script2 = "alert('Mensaje:  " + ex.Message + "');";
                ScriptManager.RegisterClientScriptBlock(this, typeof(UpdatePanel), "jsMensaje", script2, true);
            }

           


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


            
            string UFilaID_Atencion = gvAtenciones.Rows[Convert.ToInt32(gvAtenciones.Rows.Count) - 1].Cells[1].Text.ToString();
            string UFilaCSID = gvAtenciones.Rows[Convert.ToInt32(gvAtenciones.Rows.Count) - 1].Cells[2].Text.ToString();
            Int64 UFilaAlarmHistoryID_Inicial = Convert.ToInt64(gvAtenciones.Rows[Convert.ToInt32(gvAtenciones.Rows.Count) - 1].Cells[11].Text);
            
            //INSERTAR SEÑALES
            brSeniales brSE = new brSeniales();
            brSE.Insertar_Señales_Aten(Convert.ToInt64(txtID_Ficha.Text), Convert.ToInt16(UFilaID_Atencion), UFilaCSID, UFilaAlarmHistoryID_Inicial);

            //VERIFICAR SEÑALES PARA CAMBIAR COLORES ALT, BB, FAC ....
            List<beSeniales> lstVerificarSeniales = brSE.Verificar_Seniales_Aten(UFilaAlarmHistoryID_Inicial, UFilaCSID);

            for (int i = 0; i <= lstVerificarSeniales.Count-1; i++)
            {
                string SignalIdentifier = lstVerificarSeniales[i].SignalIdentifier;
                //string FLAG_TIPO = lstVerificarSeniales[i].FLAG_TIPO;
                    
                    //PARA ALT
                    if (SignalIdentifier.Equals("LT"))
                    {
                        lblALT.BackColor = System.Drawing.Color.Red;
                    }

                    if (SignalIdentifier.Equals("LR"))
                    {                        
                        lblALT.BackColor = System.Drawing.Color.Green;
                    }
                    
                    //PARA BB 
                    if (SignalIdentifier.Equals("YT"))
                    {
                        lblBB.BackColor = System.Drawing.Color.Red;
                    }

                    if (SignalIdentifier.Equals("XR"))
                    {
                        lblBB.BackColor = System.Drawing.Color.Green;
                    }
                    
                    //PARA FAC
                    if (SignalIdentifier.Equals("AT"))
                    {
                        lblFAC.BackColor = System.Drawing.Color.Red;
                    }

                    if (SignalIdentifier.Equals("AR"))
                    {
                        lblFAC.BackColor = System.Drawing.Color.Green;
                    }

                    //PARA RED o ACR
                    if (SignalIdentifier.Equals("YC"))
                    {
                        lblRED.BackColor = System.Drawing.Color.Red;
                    }

                    if (SignalIdentifier.Equals("YK"))
                    {
                        lblRED.BackColor = System.Drawing.Color.Green;
                    }
                    
                    //ACL -- NO HAY SEÑALES -- QUE PENDIENTE HASTA LA ACTIVACION DE ESTAS

                    //PARA AA
                    if (SignalIdentifier.Equals("HA"))
                    {
                        lblAA.BackColor = System.Drawing.Color.Red;
                    }

                    if (SignalIdentifier.Equals("HH"))
                    {
                        lblAA.BackColor = System.Drawing.Color.Green;
                    }



            }

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
            txtIdAtencion.Text = gvAtenciones.Rows[Convert.ToInt32(gvAtenciones.Rows.Count) - 1].Cells[1].Text.ToString();
            txtCsidAtencion.Text = gvAtenciones.Rows[Convert.ToInt32(gvAtenciones.Rows.Count) - 1].Cells[2].Text.ToString();
            txtUsuario.Text = gvAtenciones.Rows[Convert.ToInt32(gvAtenciones.Rows.Count) - 1].Cells[3].Text.ToString();
            txtFechaTermino.Text = DateTime.Now.ToString("dd-MM-yyyy HH:mm");

        }

        protected void btnAceptarModiAten_Click(object sender, EventArgs e)
        {
            bool updatedFA;
            string men = "";
            int Estado = 1;

            brFichaAtenciones brFA = new brFichaAtenciones();            

            if(rbtPendiente.Checked)
            {
                Estado = 1;
            }

            if (rbtConcluida.Checked)
            {
                Estado = 3;
            }

            if (rbtCancelada.Checked)
            {
                Estado = 4;
            }

            updatedFA = brFA.ModificarFichaAtencion(Convert.ToInt64(txtID_Ficha.Text), Convert.ToInt16(txtIdAtencion.Text), HttpUtility.HtmlDecode(txtCsidAtencion.Text), Estado, HttpUtility.HtmlDecode(txtObsAtencion.Text));

            if (updatedFA == false)
            {
                men = "Hubo un problema al momento de intentar registrar el Tipo Mantenimiento";
            }
            else
            {
                men = "Tipo Mantenimiento registrado correctamente";

                btnIniciar.Enabled = true;
                btnDetener.Enabled = false;

            }


            //CUANDO SE TERMINA LA ATENCION, EL ESTADO DE LA FICHA SE REGISTRA SEGUN EL ESTADO DEL TERMINO DE LA ATENCION

            brFichaSupervision br = new brFichaSupervision();            

            bool updated = br.ActualizarFichaSupervision(Estado, Convert.ToInt32(txtID_Ficha.Text));

            if (updated == false)
            {
                men = "Hubo un problema al momento de intentar actualizar la Ficha";
            }
            else
            {
                men = "La ficha se registro correctamente";
            }

            //string script = "alert('Mensaje:  " + men + "');";
            //ScriptManager.RegisterClientScriptBlock(this, typeof(UpdatePanel), "jsMensaje", script, true);

            ////////////


            //tmrActualizarZonas.Enabled = false;
            Ficha_Atenciones(txtID_Ficha.Text);
            tmrRecepSeniales.Enabled = false;

            //string script2 = "alert('Mensaje:  " + men + "');";
            //ScriptManager.RegisterClientScriptBlock(this, typeof(UpdatePanel), "jsMensaje", script2, true);

        }

        protected void btnListarTecnicos_Click(object sender, EventArgs e)
        {
            Listar_Grilla_Tecnico(txtBsProveedorName.Text, txtBNombres.Text);
        }

        protected void btnAgregarTecnico_Click(object sender, ImageClickEventArgs e)
        {
            
        }

        protected void btnAceptarUpTecnico_Click(object sender, EventArgs e)
        {
            txtFechaIngreso.Text = txtUpFechaIngreso.Text;
            txtFechaSalida.Text = txtUpFechaSalida.Text;
            txtProveedorID.Text= txtUpProveedorID.Text;
            txtProv.Text = txtUpProv.Text;
            txtPersonalID.Text= txtUpPersonalID.Text;
            txtNombre.Text = txtUpNombre.Text;
            txtObs_Tec.Text = txtUpObs_Tec.Text;
        }

        protected void btnAceptarUPAbonado_Click(object sender, EventArgs e)
        {
            beAbonado fa = new beAbonado();

            if (hdfMantEstado.Value == "NUEVO")
            {
                fa.CSID = txtUpCsid.Text;
                fa.SubscriberName = txtUpSubscriberName.Text;
                fa.DealerCode = txtUpDealercode.Text;
                fa.LocalID = txtUpLocalid.Text;
                fa.Observaciones = txtUpObservacion.Text;
                beAbonado.FAbonado.Add(fa);
            }
            else
            {
                beAbonado.FAbonado[Convert.ToInt16(hdfIndex.Value)].DealerCode = txtUpDealercode.Text;
                beAbonado.FAbonado[Convert.ToInt16(hdfIndex.Value)].CSID = txtUpCsid.Text;
                beAbonado.FAbonado[Convert.ToInt16(hdfIndex.Value)].SubscriberName = txtUpSubscriberName.Text;
                beAbonado.FAbonado[Convert.ToInt16(hdfIndex.Value)].LocalID = txtUpLocalid.Text;
                beAbonado.FAbonado[Convert.ToInt16(hdfIndex.Value)].Observaciones = txtUpObservacion.Text;
            }

            //Session["ListaAbonado"] = beAbonado.FAbonado;

            gvAbonado.DataSource = beAbonado.FAbonado;
            gvAbonado.DataBind();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            brFichaSupervision br = new brFichaSupervision();
            string men="";
            
            bool updated = br.ActualizarFichaSupervision(4, Convert.ToInt32(txtID_Ficha.Text));

            if (updated == false)
            {
                men = "Hubo un problema al momento de intentar actualizar la Ficha";
            }
            else
            {
                men = "La ficha se registro correctamente";
            }

            Ficha_Supervision(txtID_Ficha.Text);

            string script = "alert('Mensaje:  " + men + "');";
            ScriptManager.RegisterClientScriptBlock(this, typeof(UpdatePanel), "jsMensaje", script, true);
        }

        protected void btnPendiente_Click(object sender, EventArgs e)
        {
            brFichaSupervision br = new brFichaSupervision();
            string men = "";

            bool updated = br.ActualizarFichaSupervision(1, Convert.ToInt32(txtID_Ficha.Text));

            if (updated == false)
            {
                men = "Hubo un problema al momento de intentar actualizar la Ficha";
            }
            else
            {
                men = "La ficha se registro correctamente";
            }

            Ficha_Supervision(txtID_Ficha.Text);

            string script = "alert('Mensaje:  " + men + "');";
            ScriptManager.RegisterClientScriptBlock(this, typeof(UpdatePanel), "jsMensaje", script, true);
        }

        protected void btnConcluir_Click(object sender, EventArgs e)
        {
            brFichaSupervision br = new brFichaSupervision();
            string men = "";

            bool updated = br.ActualizarFichaSupervision(3, Convert.ToInt32(txtID_Ficha.Text));

            if (updated == false)
            {
                men = "Hubo un problema al momento de intentar actualizar la Ficha";
            }
            else
            {
                men = "La ficha se registro correctamente";
            }

            Ficha_Supervision(txtID_Ficha.Text);

            string script = "alert('Mensaje:  " + men + "');";
            ScriptManager.RegisterClientScriptBlock(this, typeof(UpdatePanel), "jsMensaje", script, true);
        }

        protected void btnLimpiarTecnico_Click(object sender, ImageClickEventArgs e)
        {
            txtFechaIngreso.Text = "";
            txtFechaSalida.Text = "";
            txtProv.Text = "";
            txtNombre.Text = "";
            txtObs_Tec.Text = "";

        }

        protected void btnAddComent_Click(object sender, ImageClickEventArgs e)
        {
            hdfEstadoComentario.Value = "NUEVO";
            btnAceptarComentario.Visible = true;
            btnCancelarComentario.Visible = true;
            btnCerrar.Visible = false;
            txtComentario.Enabled = true;
            txtComentario.Text = "";
            txtComentario.Focus();
            

        }

        protected void btnCancelarComentario_Click(object sender, EventArgs e)
        {
            hdfEstadoComentario.Value = "";
            btnAceptarComentario.Visible = false;
            btnCancelarComentario.Visible = false;
            btnCerrar.Visible = true;
            txtComentario.Enabled = false;            
        }

        protected void btnAceptarComentario_Click(object sender, EventArgs e)
        {
            brComentario br = new brComentario();
            bool Update = false;
            bool Pendiente;
            bool Comentario;            
            bool Completado;
            bool VerificarAbonado  = false;
            string csid="";

            foreach (GridViewRow fila in gvAbonado.Rows)
            {

                RadioButton rbt = fila.FindControl("rbtSelAbonado") as RadioButton;

                if (rbt.Checked)
                {
                    VerificarAbonado = true;
                }
            }

            if (VerificarAbonado==true)
            {

                    foreach (GridViewRow fila in gvAbonado.Rows)
                    {

                        RadioButton rbt = fila.FindControl("rbtSelAbonado") as RadioButton;

                        if (rbt.Checked)
                        {
                            csid= HttpUtility.HtmlDecode(fila.Cells[2].Text);
                            
                        }
                    }


                    if (rbtTrabPendiente.Checked == true)
                    {
                        Pendiente=true;                        
                    }
                    else
                    {
                        Pendiente=false;                        
                    }

                    if (chkCompletado.Checked==true)
                    {
                        Completado=true;
                    }
                    else
                    {
                        Completado=false;
                    }
                    
                    if (hdfEstadoComentario.Value.Equals("NUEVO"))
                    {
                        Update = br.InsertarComentario(Convert.ToInt64(txtID_Ficha.Text), Convert.ToInt32(hdfZonaComentario.Value), Session["sUserIden"].ToString(), Pendiente, Completado, txtComentario.Text, csid);
                    }
                    else
                    {
                        Update = br.ActualizarComentario(Convert.ToInt64(txtID_Ficha.Text), Convert.ToInt32(hdfZonaComentario.Value),csid, Convert.ToInt16(gvComentario.Rows[gvComentario.SelectedIndex].Cells[4].Text), Session["sUserIden"].ToString(), Pendiente, Completado, txtComentario.Text);
                    }                    
            
                    string men;

                    if (Update== false)
                    {
                        men = "Hubo un problema al registrar el trabajo pendiente ";
                    }
                    else
                    {
                        men = "Se registro el trabajo pendiente";
                    }

                    btnListarComentariosZona_Click(null, null);

                    hdfEstadoComentario.Value = "";
                    btnAceptarComentario.Visible = false;
                    btnCancelarComentario.Visible = false;
                    btnCerrar.Visible = true;
                    txtComentario.Enabled = false;                    
                    

                    string script = "alert('Mensaje:  " + men + "');";
                    ScriptManager.RegisterClientScriptBlock(this, typeof(UpdatePanel), "jsMensaje", script, true);
            }
            else
            {
                string script = "alert('Seleccione un abonado para registrar el trabajo pendiente / comentario');";
                ScriptManager.RegisterClientScriptBlock(this, typeof(UpdatePanel), "jsMensaje", script, true);
            }




        }

        protected void btnListarComentariosZona_Click(object sender, EventArgs e)
        {
             bool VerificarAbonado = false;
             string csid="";

            foreach (GridViewRow fila in gvAbonado.Rows)
            {

                RadioButton rbt = fila.FindControl("rbtSelAbonado") as RadioButton;

                if (rbt.Checked)
                {
                    VerificarAbonado = true;
                }
            }

            if (VerificarAbonado == true) 
            {

                foreach (GridViewRow fila in gvAbonado.Rows)
                {

                    RadioButton rbt = fila.FindControl("rbtSelAbonado") as RadioButton;

                    if (rbt.Checked)
                    {
                        csid = HttpUtility.HtmlDecode(fila.Cells[2].Text);

                    }
                }
                 }
            else
            {
                string script = "alert('No se ha seleccionado abonado para listar trabajo(s) pendiente(s) / comentario(s)');";
                ScriptManager.RegisterClientScriptBlock(this, typeof(UpdatePanel), "jsMensaje", script, true);

            }

            if(csid.Trim().Length>0)
            {
                ListarComentarioZona(Convert.ToInt64(txtID_Ficha.Text), Convert.ToInt32(hdfZonaComentario.Value), csid);
            }

            
        }

        private void ListarComentarioZona(Int64 Ficha, int Zona, string csid)
        {
            brComentario br = new brComentario();
            List<beComentario> ListarComentarioZona = br.ListarComentarioZona(Ficha, Zona, csid);
            gvComentario.DataSource = ListarComentarioZona;
            gvComentario.DataBind();
        }

        protected void btnTrabGenerales_Click(object sender, EventArgs e)
        {
             string script = "mostrarComentario('Trabajo(s) / comentario(s) - General',201,600,370)";
              ScriptManager.RegisterClientScriptBlock(this, typeof(UpdatePanel), "jsMensaje", script, true);
            
        }

        protected void btnEditComent_Click(object sender, ImageClickEventArgs e)
        {
            hdfEstadoComentario.Value = "EDITAR";
            btnAceptarComentario.Visible = true;
            btnCancelarComentario.Visible = true;
            btnCerrar.Visible = false;
            txtComentario.Enabled = true;
            txtComentario.Text = gvComentario.Rows[gvComentario.SelectedIndex].Cells[3].Text;
            txtComentario.Focus();
        }

        protected void gvComentario_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvComentario.SelectedRow;
            txtComentario.Text = HttpUtility.HtmlDecode(row.Cells[3].Text);

            rbtTrabPendiente.Checked =Convert.ToBoolean(Convert.ToInt16(HttpUtility.HtmlDecode(row.Cells[5].Text)));
            rbtComentario.Checked = !Convert.ToBoolean(Convert.ToInt16(HttpUtility.HtmlDecode(row.Cells[5].Text)));
            chkCompletado.Checked = Convert.ToBoolean(Convert.ToInt16(HttpUtility.HtmlDecode(row.Cells[6].Text)));
            

        }

        protected void btnDelComent_Click(object sender, ImageClickEventArgs e)
        {
            brComentario br = new brComentario();
            bool VerificarAbonado=false;
            string csid="";

            foreach (GridViewRow fila in gvAbonado.Rows)
            {

                RadioButton rbt = fila.FindControl("rbtSelAbonado") as RadioButton;

                if (rbt.Checked)
                {
                    VerificarAbonado = true;
                }
            }

            if (VerificarAbonado == true)
            {

                foreach (GridViewRow fila in gvAbonado.Rows)
                {

                    RadioButton rbt = fila.FindControl("rbtSelAbonado") as RadioButton;

                    if (rbt.Checked)
                    {
                        csid = HttpUtility.HtmlDecode(fila.Cells[2].Text);

                    }
                }

                bool Delete;
                Delete = br.EliminarComentario(Convert.ToInt64(txtID_Ficha.Text), Convert.ToInt32(hdfZonaComentario.Value), csid, Convert.ToInt16(gvComentario.Rows[gvComentario.SelectedIndex].Cells[4].Text));

                if (Delete == true) 
                {
                    string script = "alert('El registro fue eliminado')";
                    ScriptManager.RegisterClientScriptBlock(this, typeof(UpdatePanel), "jsMensaje", script, true);
                    btnListarComentariosZona_Click(null, null);
                }
                else
                {
                    string script = "alert('Ocurrio un error al intentar eliminar el registro')";
                    ScriptManager.RegisterClientScriptBlock(this, typeof(UpdatePanel), "jsMensaje", script, true);
                }

            }


            
        }

    }
}