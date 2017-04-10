using System;
using System.Collections.Generic;
using Entity;
using System.Data.SqlClient;
using General.Librerias.CodigoUsuario;
using DataAccess;


namespace BusinessRules
{
    public class brLogin:brGeneral
    {
        public List<beLogin> ValidarLogin(string usuario, string password, string dealercode)
        {
            List<beLogin> lbeLogin = null;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                try
                {
                    con.Open();
                    daLogin odaLogin = new daLogin();
                    lbeLogin = odaLogin.ValidarLogin(con, usuario, password, dealercode);
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
            return (lbeLogin);
        }

    }
}
