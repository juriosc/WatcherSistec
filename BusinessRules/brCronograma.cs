using BusinessRules;
using DataAccess;
using Entity;
using General.Librerias.CodigoUsuario;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace BusinessRules
{
    public class brCronograma:brGeneral
    {
        public List<beCronograma> ListarCronograma(string pperiodo_inicio, string pperiodo_fin, string pProveedorID, string pPersonalID, string pRuta_ID, string pbsupervisar, string pCSID, string pfechad, string pfechah, string pestado_pendiente, string pestado_concluida, string pestado_en_atencion, string pestado_cancelada)
        {
            List<beCronograma> lbeCronograma = null;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                try
                {
                    con.Open();
                    daCronograma odaCronograma = new daCronograma();
                    lbeCronograma = odaCronograma.ListarCronograma(con, pperiodo_inicio, pperiodo_fin, pProveedorID, pPersonalID, pRuta_ID, pbsupervisar, pCSID, pfechad, pfechah, pestado_pendiente, pestado_concluida, pestado_en_atencion, pestado_cancelada);
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
            return (lbeCronograma);
        }

        public List<beCronograma> ListarCronogramaDetalle(string pPeriodo, string pProveedorID, string pPersonalID, string pRuta_ID, string pCSID)
        {
            List<beCronograma> lbeCronograma = null;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                try
                {
                    con.Open();
                    daCronograma odaCronograma = new daCronograma();
                    lbeCronograma = odaCronograma.ListarCronogramaDetalle(con, pPeriodo, pProveedorID, pPersonalID, pRuta_ID, pCSID);
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
            return (lbeCronograma);
        }

        public List<beCronograma> ListarCronogramaTipoMant(string pPeriodo, string pProveedorID, string pPersonalID, string pRuta_ID, string pCSID)
        {
            List<beCronograma> lbeCronograma = null;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                try
                {
                    con.Open();
                    daCronograma odaCronograma = new daCronograma();
                    lbeCronograma = odaCronograma.ListarCronogramaTipoMant(con, pPeriodo, pProveedorID, pPersonalID, pRuta_ID, pCSID);
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
            return (lbeCronograma);
        }
        public bool InsertarCronograma(int ProveedorID, int PersonalID, int Ruta, string Obser, DateTime Periodo)
        {
            bool updated = false;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                try
                {
                    con.Open();
                    daCronograma odaCronograma = new daCronograma();
                    updated = odaCronograma.InsertarCronograma(con, ProveedorID, PersonalID, Ruta, Obser, Periodo);
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

        public bool InsertarCronogramaDetalle(int ProveedorID, int PersonalID, int Ruta, DateTime Periodo, string CSID, DateTime Fecha_Programada, string Dealercode, DateTime Fecha_Visita, string Obser)
        {
            bool updated = false;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                try
                {
                    con.Open();
                    daCronograma odaCronograma = new daCronograma();
                    updated = odaCronograma.InsertarCronogramaDetalle(con, ProveedorID, PersonalID, Ruta, Periodo, CSID, Fecha_Programada, Dealercode, Fecha_Visita, Obser);
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

        public bool InsertarCronogramaTipoMant(int ProveedorID, int PersonalID, int Ruta, DateTime Periodo, string CSID, DateTime Fecha_Programada, Int64 TipoMant_ID)
        {
            bool updated = false;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                try
                {
                    con.Open();
                    daCronograma odaCronograma = new daCronograma();
                    updated = odaCronograma.InsertarCronogramaTipoMant(con, ProveedorID, PersonalID, Ruta, Periodo, CSID, Fecha_Programada, TipoMant_ID);
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

        public bool ActualizarCronograma(int ProveedorID, int PersonalID, int Ruta, DateTime Periodo, string CSID, DateTime Fecha_Programada, string Dealercode, DateTime Fecha_Visita, string Obser)
        {
            bool updated = false;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                try
                {
                    con.Open();
                    daCronograma odaCronograma = new daCronograma();
                    updated = odaCronograma.ActualizarCronograma(con, ProveedorID, PersonalID, Ruta, Periodo, CSID, Fecha_Programada, Dealercode, Fecha_Visita, Obser);
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

        public bool ActualizarFichaID(string Ficha, int ProveedorID, int PersonalID, int Ruta, DateTime Periodo, string CSID, string Dealercode)
        {
            bool updated = false;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                try
                {
                    con.Open();
                    daCronograma odaCronograma = new daCronograma();
                    updated = odaCronograma.ActualizarFichaID(con, Ficha, ProveedorID, PersonalID, Ruta, Periodo, CSID, Dealercode);
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
