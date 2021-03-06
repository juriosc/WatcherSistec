﻿using BusinessRules;
using DataAccess;
using Entity;
using General.Librerias.CodigoUsuario;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace BusinessRules
{
    public class brBloqueZona :brGeneral
    {
        public List<beBloqueZona> ListarBloqueZona(string pCSID, string palarmhistoryidinicial)
        {
            List<beBloqueZona> lbeBloqueZona = null;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                try
                {
                    con.Open();
                    daBloqueZona odaBloqueZona = new daBloqueZona();
                    lbeBloqueZona = odaBloqueZona.ListarBloqueZona(con, pCSID, palarmhistoryidinicial);
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
            return (lbeBloqueZona);
        }

        public List<beBloqueZona> ListarBloqueZonaCron(string pCSID)
        {
            List<beBloqueZona> lbeBloqueZona = null;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                try
                {
                    con.Open();
                    daBloqueZona odaBloqueZona = new daBloqueZona();
                    lbeBloqueZona = odaBloqueZona.ListarBloqueZonaCron(con, pCSID);
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
            return (lbeBloqueZona);
        }
    }
}
