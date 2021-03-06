﻿using BusinessRules;
using DataAccess;
using Entity;
using General.Librerias.CodigoUsuario;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace BusinessRules
{
    public class brOperador:brGeneral
    {
        public List<beOperador> ListarOperador(string pUser, string pNombres)
        {
            List<beOperador> lbeOperador = null;
            using (SqlConnection con = new SqlConnection(Conexion))
            {
                try
                {
                    con.Open();
                    daOperador odaOperador = new daOperador();
                    lbeOperador = odaOperador.ListarOperador(pUser, pNombres, con);
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
            return (lbeOperador);
        }
    }
}
