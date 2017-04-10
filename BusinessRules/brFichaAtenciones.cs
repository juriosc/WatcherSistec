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

        public bool InsertarFichaAtencion(Int64 ID_Ficha, string CSID, string Usuario, int AlarmHistoryID_Inicial, out string outID_Atencion)
        {
            bool updated = false;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                try
                {
                    con.Open();
                    daFichaAtenciones odaFichaAtencion = new daFichaAtenciones();
                    updated = odaFichaAtencion.InsertarFichaAtencion(con, ID_Ficha, CSID, Usuario, AlarmHistoryID_Inicial,out outID_Atencion);
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
                    outID_Atencion = "";
                }
                catch (Exception ex)
                {
                    beLog obeLog = new beLog();
                    obeLog.MensajeError = ex.Message;
                    obeLog.DetalleError = ex.StackTrace;
                    ucObjeto<beLog>.grabarArchivoTexto(ArchivoLog, obeLog);
                    outID_Atencion = "";
                }
            }
            return (updated);
        }
    }
}
