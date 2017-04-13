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
    public partial class Cronograma : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListarCronograma();
                ListarTipoMantenimiento();
                ComboRuta();
                ddlRutas.Items.Insert(0, new ListItem("TODOS", "0"));
                ddlRuta.Items.Insert(0, new ListItem("TODOS", "0"));
                Bloque_Zona("201412");
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

            List<beCronograma> lbeCronograma = br.ListarCronograma(PeriodoI, PeriodoF, txtProveedor.Text.ToString(), txtTecnico.Text.ToString(), ddlRuta.SelectedValue.ToString(), Sup, txtCsid.Text.ToString(), BeginDate, EndDate, Pend, Conc, Aten, Canc);

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
            if(txtFondo3.Text=="1")
            {

                txtNewDealerDesc.Text = gvSubscriber.Rows[gvSubscriber.SelectedIndex].Cells[0].Text;
                txtNewDealer.Text = gvSubscriber.Rows[gvSubscriber.SelectedIndex].Cells[4].Text;
                txtNewAbon.Text = gvSubscriber.Rows[gvSubscriber.SelectedIndex].Cells[1].Text;
                txtNewAbonDesc.Text = gvSubscriber.Rows[gvSubscriber.SelectedIndex].Cells[2].Text;
            }
            else
            {
                txtDealerName.Text = gvSubscriber.Rows[gvSubscriber.SelectedIndex].Cells[0].Text;
                txtDealercode.Text = gvSubscriber.Rows[gvSubscriber.SelectedIndex].Cells[4].Text;
                txtCsid.Text = gvSubscriber.Rows[gvSubscriber.SelectedIndex].Cells[1].Text;
                txtSubscriberName.Text = gvSubscriber.Rows[gvSubscriber.SelectedIndex].Cells[2].Text;
            }
            
        }

        protected void btnNuevo_Click(object sender, ImageClickEventArgs e)
        {
            //ListarNewCronograma("","","","","");
            
            string script = "mostrarPopupNuevoCronograma('Seleccionar Abonado:',750,600);";
            ScriptManager.RegisterClientScriptBlock(this, typeof(UpdatePanel), "jsMensaje", script, true);
            hdfEstado.Value = "NUEVO";
        }

        /*private void ListarNewCronograma(string Peri, string Prov, string pers, string ruta, string abon)
        {
            brCronograma br = new brCronograma();
            string BeginDate, EndDate;

            BeginDate = txtFechaIni.Text;
            EndDate = txtFechaFin.Text;

            List<beCronograma> lbeCronograma = br.ListarCronogramaDetalle(Peri,Prov,pers,ruta,abon);

            gvCronogramaMantenimiento.DataSource = lbeCronograma;
            gvCronogramaMantenimiento.DataBind();
        }*/

        /*protected void gvCronogramaMantenimiento_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCronogramaMantenimiento.PageIndex = e.NewPageIndex;
            ListarNewCronograma("", "", "", "", "");
        }*/

        protected void btnBuscarDealer_Click(object sender, EventArgs e)
        {
            Listar_Grilla_Dealer(txtDealer.Text, txtNameDealer.Text);
        }

        protected void btnAceptar_Dealer_Click(object sender, EventArgs e)
        {
            if(txtFondo4.Text=="1")
            {
                txtNewDealer.Text = gvDealer.Rows[gvDealer.SelectedIndex].Cells[0].Text;
                txtNewDealerDesc.Text = gvDealer.Rows[gvDealer.SelectedIndex].Cells[1].Text;
                txtNewAbon.Text = "";
                txtNewAbonDesc.Text = "";
            }
            else
            {
                txtDealercode.Text = gvDealer.Rows[gvDealer.SelectedIndex].Cells[0].Text;
                txtDealerName.Text = gvDealer.Rows[gvDealer.SelectedIndex].Cells[1].Text;
                txtCsid.Text = "";
                txtSubscriberName.Text = "";
            }
            
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
            if (txtFondo.Text=="1")
            {
                txtNewProv.Text = gvProveedor.Rows[gvProveedor.SelectedIndex].Cells[0].Text;
                txtNewProvDes.Text = gvProveedor.Rows[gvProveedor.SelectedIndex].Cells[1].Text;
                txtNewTec.Text = "";
                txtNewTecNom.Text = "";
            }
            else
            {
                txtProveedor.Text = gvProveedor.Rows[gvProveedor.SelectedIndex].Cells[0].Text;
                txtProveName.Text = gvProveedor.Rows[gvProveedor.SelectedIndex].Cells[1].Text;
                txtTecnico.Text = "";
                txtTecName.Text = "";
            }
            
        }

        protected void gvTecnico_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTecnico.PageIndex = e.NewPageIndex;
            Listar_Grilla_Tecnico(txtProv.Text, txtNameTecnico.Text);
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

        protected void btnAceptarTec_Click(object sender, EventArgs e)
        {
            if(txtFondo1.Text=="1")
            {
                txtNewTec.Text = gvTecnico.Rows[gvTecnico.SelectedIndex].Cells[3].Text;
                txtNewTecNom.Text = HttpUtility.HtmlDecode(gvTecnico.Rows[gvTecnico.SelectedIndex].Cells[2].Text);
                txtNewProvDes.Text = HttpUtility.HtmlDecode(gvTecnico.Rows[gvTecnico.SelectedIndex].Cells[0].Text);
                txtNewProv.Text = gvTecnico.Rows[gvTecnico.SelectedIndex].Cells[4].Text;
            }
            else
            {
                txtTecnico.Text = gvTecnico.Rows[gvTecnico.SelectedIndex].Cells[3].Text;
                txtTecName.Text =HttpUtility.HtmlDecode( gvTecnico.Rows[gvTecnico.SelectedIndex].Cells[2].Text);
                txtProveedor.Text = gvTecnico.Rows[gvTecnico.SelectedIndex].Cells[4].Text;
                txtProveName.Text = HttpUtility.HtmlDecode(gvTecnico.Rows[gvTecnico.SelectedIndex].Cells[0].Text);
            }
            
        }

        private void ComboRuta()
        {
            brRuta br = new brRuta();
            List<beRuta> lstRuta = br.ComboRuta();

            ddlRutas.DataValueField = "Ruta_ID";
            ddlRutas.DataTextField = "Ruta_Des";
            ddlRutas.DataSource = lstRuta;
            ddlRutas.DataBind();
            ddlRuta.DataValueField = "Ruta_ID";
            ddlRuta.DataTextField = "Ruta_Des";
            ddlRuta.DataSource = lstRuta;
            ddlRuta.DataBind();
        }
        private void ListarTipoMantenimiento()
        {
            brTipoMantenimiento br = new brTipoMantenimiento();
            List<beTipoMantenimiento> lbeMantenimiento = br.ComboMantenimiento();

            gvTipoMantenimiento.DataSource = lbeMantenimiento;
            gvTipoMantenimiento.DataBind();
        }
        protected void gvTipoMantenimiento_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTipoMantenimiento.PageIndex = e.NewPageIndex;
            ListarTipoMantenimiento();
        }
        private void Bloque_Zona(string csid)
        {
            brBloqueZona br = new brBloqueZona();

            List<beBloqueZona> ListarBloqueZonaCron = br.ListarBloqueZonaCron(csid);
            gvBloqueZonas.DataSource = ListarBloqueZonaCron;
            gvBloqueZonas.DataBind();
        }
        protected void gvBloqueZonas_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
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

        protected void btnAceptarCronograma_Click(object sender, EventArgs e)
        {
            brCronograma br = new brCronograma();

            string men = "";
            string mes = ddlMes.SelectedValue.ToString();
            string año = txtAño.Text;
            string Periodo = "01/"+mes+"/"+año;
            DateTime fechaV;

            IFormatProvider culture = new CultureInfo("es-PE", true);
            DateTime FPeriodo = DateTime.ParseExact(Periodo, "dd/MM/yyyy", culture);
            DateTime fechaP = DateTime.ParseExact(txtFechaP.Text, "dd/MM/yyyy HH:mm", culture);
            if (txtFechaV.Text == "")
            {
                fechaV = DateTime.ParseExact("01/01/1900", "dd/MM/yyyy", culture);
            }
            else { fechaV = DateTime.ParseExact(txtFechaV.Text, "dd/MM/yyyy HH:mm", culture); }

            if (hdfEstado.Value == "NUEVO")
            {
                bool insert = br.InsertarCronograma(Convert.ToInt32(txtNewProv.Text), Convert.ToInt32(txtNewTec.Text),
                                                     Convert.ToInt32(ddlRutas.SelectedValue.ToString()), txtObs.Text, FPeriodo);
                if (insert == true)
                {
                    bool insertCD = br.InsertarCronogramaDetalle(Convert.ToInt32(txtNewProv.Text), Convert.ToInt32(txtNewTec.Text),
                                                                  Convert.ToInt32(ddlRutas.SelectedValue.ToString()), FPeriodo,
                                                                  txtNewAbon.Text, fechaP, txtNewDealer.Text, fechaV, "");
                    if (insertCD == true)
                    {
                        foreach (GridViewRow fila in gvTipoMantenimiento.Rows)
                        {
                            CheckBox check = fila.FindControl("chkSel") as CheckBox;

                            if (check.Checked)
                            {
                                bool insertTM = br.InsertarCronogramaTipoMant(Convert.ToInt32(txtNewProv.Text), 
                                                                               Convert.ToInt32(txtNewTec.Text),
                                                                               Convert.ToInt32(ddlRutas.SelectedValue.ToString()), 
                                                                               FPeriodo, txtNewAbon.Text, fechaP, 
                                                                               Convert.ToInt64(fila.Cells[1].Text));

                                if (insertTM == false)
                                {
                                    men = "Hubo un problema al momento de intentar registrar el Tipo Mantenimiento";
                                }
                                else
                                {
                                    men = "Tipo Mantenimiento registrado correctamente";
                                }

                            }
                        }
                    }

                }
                else
                {
                    men = "No se pudo registrar el Cronograma";
                }

                string script1 = "alert('Mensaje: ' " + men + "');";
                ScriptManager.RegisterClientScriptBlock(this, typeof(UpdatePanel), "jsMensaje", script1, true);
            }
            else
            {
                if (hdfEstado.Value == "EDITAR")
                {
                    bool updatedCD = br.ActualizarCronograma(Convert.ToInt32(txtNewProv.Text), Convert.ToInt32(txtNewTec.Text),
                                                             Convert.ToInt32(ddlRutas.SelectedValue.ToString()), FPeriodo,
                                                             txtNewAbon.Text, fechaP, txtNewDealer.Text, fechaV, txtObs.Text);
                    if (updatedCD == true)
                    {
                        foreach (GridViewRow fila in gvTipoMantenimiento.Rows)
                        {
                            CheckBox check = fila.FindControl("chkSel") as CheckBox;

                            if (check.Checked)
                            {
                                bool insertTM = br.InsertarCronogramaTipoMant(Convert.ToInt32(txtNewProv.Text),
                                                                               Convert.ToInt32(txtNewTec.Text),
                                                                               Convert.ToInt32(ddlRutas.SelectedValue.ToString()),
                                                                               FPeriodo, txtNewAbon.Text, fechaP,
                                                                               Convert.ToInt64(fila.Cells[1].Text));

                                if (insertTM == false)
                                {
                                    men = "Hubo un problema al momento de intentar registrar el Tipo Mantenimiento";
                                }
                                else
                                {
                                    men = "Tipo Mantenimiento registrado correctamente";
                                }

                            }
                        }
                    }
                }
            }
        }

        protected void gvCronograma_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Ver") || e.CommandName.Equals("Modificar"))
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvCronograma.Rows[index];
                string script = "";

                if (e.CommandName.Equals("Ver"))
                {
                    hdfEstado.Value = "VER";
                    script = "mostrarPopupNuevoCronograma('Ver Cronograma:',750,600);";
                }

                if (e.CommandName.Equals("Modificar"))
                {
                    hdfEstado.Value = "EDITAR";
                    script = "mostrarPopupNuevoCronograma('Editar Cronograma:',750,600);";
                }
                ddlMes.Text = row.Cells[13].Text.ToString();
                txtAño.Text = row.Cells[14].Text.ToString();
                ddlRutas.Text = row.Cells[4].Text.ToString();
                txtNewProvDes.Text = HttpUtility.HtmlDecode(row.Cells[16].Text.ToString());
                txtNewProv.Text = row.Cells[1].Text.ToString();
                txtNewTecNom.Text = HttpUtility.HtmlDecode(row.Cells[3].Text.ToString());
                txtNewTec.Text = row.Cells[2].Text.ToString();
                txtObs.Text = HttpUtility.HtmlDecode(row.Cells[9].Text.ToString());
                txtNewDealerDesc.Text = HttpUtility.HtmlDecode(row.Cells[16].Text.ToString());
                txtNewDealer.Text = row.Cells[6].Text.ToString();
                txtNewAbon.Text = row.Cells[7].Text.ToString();
                txtNewAbonDesc.Text = HttpUtility.HtmlDecode(row.Cells[8].Text.ToString());
                txtFechaP.Text = HttpUtility.HtmlDecode(row.Cells[12].Text.ToString());
                txtFechaV.Text = HttpUtility.HtmlDecode(row.Cells[17].Text.ToString());
                
                ScriptManager.RegisterClientScriptBlock(this, typeof(UpdatePanel), "jsMensaje", script, true);
            }
        }

        protected void btnFicha_Click(object sender, EventArgs e)
        {
            //brFichaSupervision br = new brFichaSupervision();
            //string outID_Ficha = "";
            //string men = "";

            //IFormatProvider culture = new CultureInfo("es-PE", true);
            //DateTime fechaI = DateTime.ParseExact(txtFechaI.Text, "dd/MM/yyyy HH:mm", culture);
            //DateTime fechaS = DateTime.ParseExact(txtFechaS.Text, "dd/MM/yyyy HH:mm", culture);


            //bool updated = br.InsertarFichaSupervision(
            //    Convert.ToInt32(txtProveedorID.Text), Convert.ToInt32(txtPersonalID.Text), fechaI
            //    , fechaS, txtObs_Tec.Text, 1, txtNro_Telefono.Text, txtPanel.Text, txtObs_Tec.Text
            //    , out outID_Ficha);
            //if (updated == false)
            //{
            //    men = "Hubo un problema al momento de intentar registrar la alarma";
            //}
            //else
            //{
            //    men = "La alarma se registro correctamente";
            //}

            //txtID_Ficha.Text = outID_Ficha;

            //string script = "alert('Mensaje: ' " + men + "');";
            //ScriptManager.RegisterClientScriptBlock(this, typeof(UpdatePanel), "jsMensaje", script, true);


            //foreach (GridViewRow fila in gvAbonado.Rows)
            //{
            //    brFichaAbonado brFA = new brFichaAbonado();
            //    bool updatedFA = brFA.InsertarFichaAbonado(Convert.ToInt32(txtID_Ficha.Text), fila.Cells[0].Text, fila.Cells[2].Text, fila.Cells[1].Text, fila.Cells[4].Text);

            //    if (updated == false)
            //    {
            //        men = "Hubo un problema al momento de intentar registrar el Abonado";
            //    }
            //    else
            //    {
            //        men = "Abonados registrados correctamente";
            //    }

            //}

            //string script1 = "alert('Mensaje: ' " + men + "');";
            //ScriptManager.RegisterClientScriptBlock(this, typeof(UpdatePanel), "jsMensaje", script1, true);


            //foreach (GridViewRow fila in gvTipoMantenimiento.Rows)
            //{

            //    CheckBox check = fila.FindControl("chkSel") as CheckBox;

            //    if (check.Checked)
            //    {

            //        brTipoMantenimiento brTM = new brTipoMantenimiento();

            //        bool updatedTM = brTM.InsertarFichaTipoMant(Convert.ToInt64(txtID_Ficha.Text), Convert.ToInt64(fila.Cells[0].Text));

            //        if (updated == false)
            //        {
            //            men = "Hubo un problema al momento de intentar registrar el Tipo Mantenimiento";
            //        }
            //        else
            //        {
            //            men = "Tipo Mantenimiento registrado correctamente";
            //        }

            //    }
            //}

            //string script2 = "alert('Mensaje: ' " + men + "');";
            //ScriptManager.RegisterClientScriptBlock(this, typeof(UpdatePanel), "jsMensaje", script2, true);
        }
    }
}