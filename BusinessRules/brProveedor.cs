using BusinessRules;
using DataAccess;
using Entity;
using General.Librerias.CodigoUsuario;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace BusinessRules
{
    public class brProveedor:brGeneral
    {
        public List<beProveedor> ListarProveedor(string pCodProvee, string pProveedorName)
        {
            List<beProveedor> lbeProveedor = null;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                try
                {
                    con.Open();
                    daProveedor odaProveedor = new daProveedor();
                    lbeProveedor = odaProveedor.ListarProveedor(con, pCodProvee, pProveedorName);
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
            return (lbeProveedor);
        }
    }
}
