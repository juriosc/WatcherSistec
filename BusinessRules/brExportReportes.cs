using BusinessRules;
using DataAccess;
using Entity;
using General.Librerias.CodigoUsuario;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;

namespace BusinessRules
{
    public class brExportReportes : brGeneral
    {
        public DataTable ListarReporte_FichaPxT_Export(string pfechad, string pfechah, string pProveedorID, string pPersonalID, string ptipo_mant, string pCSID, string pExc_coment, string pEstado)
        {
            DataTable dt = null;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                try
                {
                    con.Open();
                    daExportReportes odaExportReportes = new daExportReportes();
                    dt = odaExportReportes.ListarReporte_FichaPxT_Export(con, pfechad, pfechah, pProveedorID, pPersonalID, ptipo_mant, pCSID, pExc_coment, pEstado);
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
            return (dt);
        }

        public DataTable ListarReporte_xTipoTrabajo_Export(string pfechad, string pfechah, string ptipo_mant)
        {
            DataTable dt = null;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                try
                {
                    con.Open();
                    daExportReportes odaExportReportes = new daExportReportes();
                    dt = odaExportReportes.ListarReporte_xTipoTrabajo_Export(con, pfechad, pfechah, ptipo_mant);
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
            return (dt);
        }

        public DataTable ListarReporte_xOficinaEntidad_Export(string pfechad, string pfechah, string pCSID)
        {
            DataTable dt = null;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                try
                {
                    con.Open();
                    daExportReportes odaExportReportes = new daExportReportes();
                    dt = odaExportReportes.ListarReporte_xOficinaEntidad_Export(con, pfechad, pfechah, pCSID);
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
            return (dt);
        }

        public DataTable ListarReporte_HorasTrabxTecnico_Export(string pfechad, string pfechah, string pProveedorID, string pPersonalID)
        {
            DataTable dt = null;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                try
                {
                    con.Open();
                    daExportReportes odaExportReportes = new daExportReportes();
                    dt = odaExportReportes.ListarReporte_HorasTrabxTecnico_Export(con, pfechad, pfechah, pProveedorID, pPersonalID);
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
            return (dt);
        }

        public DataTable ListarReporte_Estadistico_xTrabajoEntidad_Export(string pfechad, string pfechah, string pProveedorID, string ptipo_mant)
        {
            DataTable dt = null;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                try
                {
                    con.Open();
                    daExportReportes odaExportReportes = new daExportReportes();
                    dt = odaExportReportes.ListarReporte_Estadistico_xTrabajoEntidad_Export(con, pfechad, pfechah, pProveedorID, ptipo_mant);
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
            return (dt);
        }

        public DataTable ListarReporte_Estadistico_HorasTrabxTecnico_Export(string pfechad, string pfechah, string pProveedorID, string pPersonalID)
        {
            DataTable dt = null;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                try
                {
                    con.Open();
                    daExportReportes odaExportReportes = new daExportReportes();
                    dt = odaExportReportes.ListarReporte_Estadistico_HorasTrabxTecnico_Export(con, pfechad, pfechah, pProveedorID, pPersonalID);
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
            return (dt);
        }

        public DataTable ListarReporte_Estadistico_SalidasNoReportadas_Export(string pfechad, string pfechah, string pPersonalID)
        {
            DataTable dt = null;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                try
                {
                    con.Open();
                    daExportReportes odaExportReportes = new daExportReportes();
                    dt = odaExportReportes.ListarReporte_Estadistico_SalidasNoReportadas_Export(con, pfechad, pfechah, pPersonalID);
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
            return (dt);
        }

        public DataTable ListarReporte_Estadistico_RutaTrab_Export(string pfechad, string pfechah, string pProveedorID, string pPersonalID, string pRuta_ID)
        {
            DataTable dt = null;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                try
                {
                    con.Open();
                    daExportReportes odaExportReportes = new daExportReportes();
                    dt = odaExportReportes.ListarReporte_Estadistico_RutaTrab_Export(con, pfechad, pfechah, pProveedorID, pPersonalID, pRuta_ID);
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
            return (dt);
        }
    }
}
