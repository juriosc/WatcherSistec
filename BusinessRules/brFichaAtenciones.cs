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
        public List<beAtenciones> ListarFichaAtencion(string ID_Ficha)
        {
            List<beAtenciones> lbeAtenciones = null;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                try
                {
                    con.Open();
                    daFichaAtenciones odaAtenciones = new daFichaAtenciones();
                    lbeAtenciones = odaAtenciones.ListarFichaAtencion(con, ID_Ficha);
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
        public bool InsertarFichaAtencion(Int64 ID_Ficha, string CSID, string Usuario, out string outID_Atencion)
        {
            bool updated = false;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                try
                {
                    con.Open();
                    daFichaAtenciones odaFichaAtencion = new daFichaAtenciones();
                    updated = odaFichaAtencion.InsertarFichaAtencion(con, ID_Ficha, CSID, Usuario, out outID_Atencion);
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
        public bool ModificarFichaAtencion(Int64 ID_Ficha, int ID_Atencion, string CSID, int Estado_Termino, string Observaciones)
        {
            bool updated = false;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                try
                {
                    con.Open();
                    daFichaAtenciones odaFichaAtencion = new daFichaAtenciones();
                    updated = odaFichaAtencion.ModificarFichaAtencion(con, ID_Ficha, ID_Atencion, CSID, Estado_Termino, Observaciones);
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
