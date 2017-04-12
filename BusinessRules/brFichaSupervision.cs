using BusinessRules;
using DataAccess;
using Entity;
using General.Librerias.CodigoUsuario;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace BusinessRules
{
    public class brFichaSupervision:brGeneral
    {
        public bool InsertarFichaSupervision(int ProveedorID, int PersonalID, DateTime Hora_Ingreso, DateTime Hora_Salida, string Obs_Tec, int Estado_Ficha, string Nro_Telefono, string Panel, string Obs_Ficha, out string outID_Ficha)
        {
            bool updated = false;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                try
                {
                    con.Open();
                    daFichaSupervision odaFichaSupervision = new daFichaSupervision();
                    updated = odaFichaSupervision.InsertarFichaSupervision(con, ProveedorID, PersonalID, Hora_Ingreso, Hora_Salida, Obs_Tec, Estado_Ficha, Nro_Telefono, Panel, Obs_Ficha, out outID_Ficha);
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
                    outID_Ficha = "";
                }
                catch (Exception ex)
                {
                    beLog obeLog = new beLog();
                    obeLog.MensajeError = ex.Message;
                    obeLog.DetalleError = ex.StackTrace;
                    ucObjeto<beLog>.grabarArchivoTexto(ArchivoLog, obeLog);
                    outID_Ficha = "";
                }
            }
            return (updated);
        }

        public bool Insertar_Señales_Aten(Int64 ID_Ficha, int ID_Atencion, string CSID, Int64 AlarmHistoryID)
        {
            bool updated = false;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                try
                {
                    con.Open();
                    daFichaSupervision odaReg_Señales_Aten = new daFichaSupervision();
                    updated = odaReg_Señales_Aten.Insertar_Señales_Aten(con, ID_Ficha, ID_Atencion, CSID, AlarmHistoryID);
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
