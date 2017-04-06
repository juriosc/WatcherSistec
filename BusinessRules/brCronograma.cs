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
    }
}
