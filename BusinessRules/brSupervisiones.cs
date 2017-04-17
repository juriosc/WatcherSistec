using BusinessRules;
using DataAccess;
using Entity;
using General.Librerias.CodigoUsuario;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace BusinessRules
{
    public class brSupervisiones : brGeneral
    {
        public List<beSupervision> ListarSupervisiones(string pCodAtencion, string pCSID, string pUsuario, string pProveedorID, string pPersonalID, string pestado_pendiente, string pestado_concluida, string pestado_en_atencion, string pestado_cancelada, string pfechad, string pfechah, string ptipo_mant, string pcoment_obs, string pcoment_trab_pend, string pestado_enviados)
        {
            List<beSupervision> lbeSupervisiones = null;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                try
                {
                    con.Open();
                    daSupervisiones odaSupervisiones = new daSupervisiones();
                    lbeSupervisiones = odaSupervisiones.ListarSupervisiones(con, pCodAtencion, pCSID, pUsuario, pProveedorID, pPersonalID, pestado_pendiente, pestado_concluida, pestado_en_atencion, pestado_cancelada, pfechad, pfechah, ptipo_mant, pcoment_obs, pcoment_trab_pend, pestado_enviados);
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
            return (lbeSupervisiones);
        }
        //public List<beFichaSupervision> ListarDatosSupervision(int pID_Ficha)
        //{
        //    List<beFichaSupervision> lbeSupervisiones = null;
        //    using (SqlConnection con = new SqlConnection(Conexion))
        //    {
        //        try
        //        {
        //            con.Open();
        //            daSupervisiones odaSupervisiones = new daSupervisiones();
        //            lbeSupervisiones = odaSupervisiones.ListarDatosSupervision(con, pID_Ficha);
        //        }
        //        catch (SqlException ex)
        //        {
        //            beLog obeLog;
        //            foreach (SqlError err in ex.Errors)
        //            {
        //                obeLog = new beLog();
        //                obeLog.MensajeError = err.Message;
        //                obeLog.DetalleError = ex.StackTrace;
        //                ucObjeto<beLog>.grabarArchivoTexto(ArchivoLog, obeLog);
        //            }
        //        }
        //        catch (Exception ex)
        //        {
        //            beLog obeLog = new beLog();
        //            obeLog.MensajeError = ex.Message;
        //            obeLog.DetalleError = ex.StackTrace;
        //            ucObjeto<beLog>.grabarArchivoTexto(ArchivoLog, obeLog);
        //        }
        //    }
        //    return (lbeSupervisiones);
        //}
    }
}
