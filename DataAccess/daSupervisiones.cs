using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;

namespace DataAccess
{
    public class daSupervisiones
    {
        public List<beFichaSupervision> ListarSupervisiones(SqlConnection con, string pCodAtencion, string pCSID, string pUsuario, string pProveedorID, string pPersonalID, string pestado_pendiente, string pestado_concluida, string pestado_en_atencion, string pestado_cancelada, string pfechad, string pfechah, string ptipo_mant, string pcoment_obs, string pcoment_trab_pend, string pestado_enviados)
        {
            List<beFichaSupervision> lbeSupervisiones = null;

            SqlCommand cmd = new SqlCommand("sp_WCT_listar_Supervisiones", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@CodAtencion", SqlDbType.VarChar, 10);
            param1.Direction = ParameterDirection.Input;
            param1.Value = pCodAtencion.ToUpper();

            SqlParameter param2 = cmd.Parameters.Add("@CSID", SqlDbType.VarChar, 10);
            param2.Direction = ParameterDirection.Input;
            param2.Value = pCSID.ToUpper();

            SqlParameter param3 = cmd.Parameters.Add("@Usuario", SqlDbType.VarChar, 20);
            param3.Direction = ParameterDirection.Input;
            param3.Value = pUsuario;

            SqlParameter param4 = cmd.Parameters.Add("@ProveedorID", SqlDbType.VarChar, 15);
            param4.Direction = ParameterDirection.Input;
            param4.Value = pProveedorID;

            SqlParameter param5 = cmd.Parameters.Add("@PersonalID", SqlDbType.VarChar, 15);
            param5.Direction = ParameterDirection.Input;
            param5.Value = pPersonalID;

            SqlParameter param6 = cmd.Parameters.Add("@estado_pendiente", SqlDbType.VarChar, 1);
            param6.Direction = ParameterDirection.Input;
            param6.Value = pestado_pendiente;

            SqlParameter param7 = cmd.Parameters.Add("@estado_concluida", SqlDbType.VarChar, 1);
            param7.Direction = ParameterDirection.Input;
            param7.Value = pestado_concluida;

            SqlParameter param8 = cmd.Parameters.Add("@estado_en_atencion", SqlDbType.VarChar, 1);
            param8.Direction = ParameterDirection.Input;
            param8.Value = pestado_en_atencion;

            SqlParameter param9 = cmd.Parameters.Add("@estado_cancelada", SqlDbType.VarChar, 1);
            param9.Direction = ParameterDirection.Input;
            param9.Value = pestado_cancelada;

            SqlParameter param10 = cmd.Parameters.Add("@fechad", SqlDbType.VarChar, 10);
            param10.Direction = ParameterDirection.Input;
            param10.Value = pfechad != "" ? DateTime.ParseExact(pfechad, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd") : "";

            SqlParameter param11 = cmd.Parameters.Add("@fechah", SqlDbType.VarChar, 10);
            param11.Direction = ParameterDirection.Input;
            param11.Value = pfechah != "" ? DateTime.ParseExact(pfechah, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd") : "";

            SqlParameter param12 = cmd.Parameters.Add("@tipo_mant", SqlDbType.VarChar, 100);
            param12.Direction = ParameterDirection.Input;
            param12.Value = ptipo_mant.ToUpper();

            SqlParameter param13 = cmd.Parameters.Add("@coment_obs", SqlDbType.VarChar, 1);
            param13.Direction = ParameterDirection.Input;
            param13.Value = pcoment_obs.ToString();

            SqlParameter param14 = cmd.Parameters.Add("@coment_trab_pend", SqlDbType.VarChar,1);
            param14.Direction = ParameterDirection.Input;
            param14.Value = pcoment_trab_pend;

            SqlParameter param15 = cmd.Parameters.Add("@estado_enviados", SqlDbType.VarChar, 1);
            param15.Direction = ParameterDirection.Input;
            param15.Value = pestado_enviados;

            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult);

            if (drd != null)
            {
                int Fecha_Registro = drd.GetOrdinal("Fecha_Registro");
                int ID_Ficha = drd.GetOrdinal("ID_Ficha");                
                int Dealer = drd.GetOrdinal("Dealer");
                int CSID = drd.GetOrdinal("CSID");
                int SubscriberName = drd.GetOrdinal("SubscriberName");
                int ProveedorID = drd.GetOrdinal("ProveedorID");
                int PersonalID = drd.GetOrdinal("PersonalID");
                int Nombres = drd.GetOrdinal("Nombres");
                int Usuario = drd.GetOrdinal("Usuario");
                int Estado_Inicio = drd.GetOrdinal("Estado_Inicio");
                int Estado_Termino = drd.GetOrdinal("Estado_Termino");                
                int Obs_Ficha = drd.GetOrdinal("Obs_Ficha");
                int TipoMantenimiento = drd.GetOrdinal("TipoMantenimiento");
                int Estado = drd.GetOrdinal("Estado");
                int Estado_Cod = drd.GetOrdinal("Estado_Cod");

                lbeSupervisiones = new List<beFichaSupervision>();
                beFichaSupervision obeSupervisiones;
                while (drd.Read())
                {
                    obeSupervisiones = new beFichaSupervision();
                    obeSupervisiones.Fecha_Registro = drd.GetString(Fecha_Registro);
                    obeSupervisiones.ID_Ficha = drd.GetString(ID_Ficha);                    
                    obeSupervisiones.Dealer = drd.GetString(Dealer);
                    obeSupervisiones.CSID = drd.GetString(CSID);
                    obeSupervisiones.SubscriberName = drd.GetString(SubscriberName);
                    obeSupervisiones.ProveedorID = drd.GetString(ProveedorID);
                    obeSupervisiones.PersonalID = drd.GetString(PersonalID);
                    obeSupervisiones.Nombres = drd.GetString(Nombres);
                    obeSupervisiones.Usuario = drd.GetString(Usuario);
                    obeSupervisiones.Estado_Inicio = drd.GetString(Estado_Inicio);
                    obeSupervisiones.Estado_Termino = drd.GetString(Estado_Termino);                    
                    obeSupervisiones.Obs_Ficha = drd.GetString(Obs_Ficha);
                    obeSupervisiones.TipoMantenimiento = drd.GetString(TipoMantenimiento);
                    obeSupervisiones.Estado_Ficha = drd.GetString(Estado);
                    obeSupervisiones.Estado_Cod = drd.GetString(Estado_Cod);
                    lbeSupervisiones.Add(obeSupervisiones);
                }
                drd.Close();
            }
            return lbeSupervisiones;
        }

        //public List<beFichaSupervision> ListarDatosSupervision(SqlConnection con, string pID_Ficha)
        //{
        //    List<beFichaSupervision> lbeSupervisiones = null;

        //    SqlCommand cmd = new SqlCommand("sp_WCT_Select_Ficha_Supervision", con);
        //    cmd.CommandType = CommandType.StoredProcedure;

        //    SqlParameter param1 = cmd.Parameters.Add("@Id_Ficha", SqlDbType.VarChar,15);
        //    param1.Direction = ParameterDirection.Input;
        //    param1.Value = pID_Ficha;

        //    SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult);

        //    if (drd != null)
        //    {
        //        int ID_Ficha = drd.GetOrdinal("ID_Ficha");
        //        int Proveedor = drd.GetOrdinal("Proveedor");
        //        int Nombres = drd.GetOrdinal("Nombres");
        //        int Hora_Ingreso = drd.GetOrdinal("Hora_Ingreso");
        //        int Hora_Salida = drd.GetOrdinal("Hora_Salida");
        //        int Obs_Tec = drd.GetOrdinal("Obs_Tec");
        //        int Panel = drd.GetOrdinal("Panel");
        //        int Nro_Telefono = drd.GetOrdinal("Nro_Telefono");
        //        int Nro_Informe = drd.GetOrdinal("Nro_Informe");

        //        lbeSupervisiones = new List<beFichaSupervision>();
        //        beFichaSupervision obeSupervisiones;
        //        while (drd.Read())
        //        {
        //            obeSupervisiones = new beFichaSupervision();
        //            obeSupervisiones.ID_Ficha = drd.GetString(ID_Ficha);
        //            obeSupervisiones.Proveedor = drd.GetString(Proveedor);
        //            obeSupervisiones.Nombres = drd.GetString(Nombres);
        //            obeSupervisiones.Hora_Ingreso = drd.GetString(Hora_Ingreso);
        //            obeSupervisiones.Hora_Salida = drd.GetString(Hora_Salida);
        //            obeSupervisiones.Obs_Tec = drd.GetString(Obs_Tec);
        //            obeSupervisiones.Panel = drd.GetString(Panel);
        //            obeSupervisiones.Nro_Telefono = drd.GetString(Nro_Telefono);                    
        //            lbeSupervisiones.Add(obeSupervisiones);
        //        }
        //        drd.Close();
        //    }
        //    return lbeSupervisiones;
        //}
    }
}
