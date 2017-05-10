using BusinessRules;
using DataAccess;
using Entity;
using General.Librerias.CodigoUsuario;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace BusinessRules
{
    public class brReportes : brGeneral
    {
        public List<beReportes> ListarReporte_FichaPxT(string pfechad, string pfechah, string pProveedorID, string pPersonalID, string ptipo_mant, string pCSID, string pExc_coment, string pEstado)
        {
            List<beReportes> lbeReportes = null;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                try
                {
                    con.Open();
                    daReportes odaReportes = new daReportes();
                    lbeReportes = odaReportes.ListarReporte_FichaPxT(con, pfechad, pfechah, pProveedorID, pPersonalID, ptipo_mant, pCSID, pExc_coment, pEstado);
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
            return (lbeReportes);
        }

        public List<beReportes> ListarReporte_xTipoTrabajo(string pfechad, string pfechah, string ptipo_mant)
        {
            List<beReportes> lbeReportes = null;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                try
                {
                    con.Open();
                    daReportes odaReportes = new daReportes();
                    lbeReportes = odaReportes.ListarReporte_xTipoTrabajo(con, pfechad, pfechah, ptipo_mant);
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
            return (lbeReportes);
        }

        public List<beReportes> ListarReporte_xOficinaEntidad(string pfechad, string pfechah, string pCSID)
        {
            List<beReportes> lbeReportes = null;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                try
                {
                    con.Open();
                    daReportes odaReportes = new daReportes();
                    lbeReportes = odaReportes.ListarReporte_xOficinaEntidad(con, pfechad, pfechah, pCSID);
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
            return (lbeReportes);
        }
    }
}
