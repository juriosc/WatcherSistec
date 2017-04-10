using BusinessRules;
using DataAccess;
using Entity;
using General.Librerias.CodigoUsuario;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace BusinessRules
{
    public class brFichaAtenciones:brGeneral
    {
        public List<beFichaAtenciones> ListarFichaAtencion(int pID_Ficha)
        {
            List<beFichaAtenciones> lbeAtenciones = null;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                try
                {
                    con.Open();
                    daFichaAtenciones odaAtenciones = new daFichaAtenciones();
                    lbeAtenciones = odaAtenciones.ListarFichaAtencion(pID_Ficha, con);
                }
                catch (SqlException ex)
                {
                    beLog obeLog;
                    foreach (SqlError err in ex.Errors)
                    {
                        obeLog = new beLog();
                        obeLog.MensajeError = err.Message;
                        obeLog.DetalleError = ex.StackTrace;
                        ucObjeto<beLog>.grabarArchivoTexto(ArchivoLog, obeLog);
                    }
                }
                catch (Exception ex)
                {
                    beLog obeLog = new beLog();
                    obeLog.MensajeError = ex.Message;
                    obeLog.DetalleError = ex.StackTrace;
                    ucObjeto<beLog>.grabarArchivoTexto(ArchivoLog, obeLog);
                }
            }
            return (lbeAtenciones);
        }

        public bool InsertarFichaAtencion(int ID_Ficha, string CSID, string Usuario, string Fecha_Inicio, string Fecha_Termino, int Estado_Inicio, int Estado_Termino, int b_ALT, int b_BB, int b_FAC, int b_RED, int b_ACL, int b_AA, string Observaciones, int AlarmHistoryID_Inicial, int AlarmHistoryID_Final)
        {
            bool updated = false;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                try
                {
                    con.Open();
                    daFichaAtenciones odaFichaAtencion = new daFichaAtenciones();
                    //updated = odaFichaAtencion.InsertarFichaAtencion(con, ID_Ficha, CSID, Usuario, Fecha_Inicio, Fecha_Termino, Estado_Inicio, Estado_Termino, b_ALT, b_BB, b_FAC, b_RED, b_ACL, b_AA, Observaciones, AlarmHistoryID_Inicial, AlarmHistoryID_Final);
                }
                catch (SqlException ex)
                {
                    beLog obeLog;
                    foreach (SqlError err in ex.Errors)
                    {
                        obeLog = new beLog();
                        obeLog.MensajeError = err.Message;
                        obeLog.DetalleError = ex.StackTrace;
                        ucObjeto<beLog>.grabarArchivoTexto(ArchivoLog, obeLog);
                    }
                }
                catch (Exception ex)
                {
                    beLog obeLog = new beLog();
                    obeLog.MensajeError = ex.Message;
                    obeLog.DetalleError = ex.StackTrace;
                    ucObjeto<beLog>.grabarArchivoTexto(ArchivoLog, obeLog);
                }
            }
            return (updated);
        }
    }
}
