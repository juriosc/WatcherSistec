using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using System.Data.SqlClient;
using System.Data;

namespace DataAccess
{
    public class daFichaSupervision
    {
        public bool InsertarFichaSupervision(SqlConnection con, int ProveedorID, int PersonalID, DateTime Hora_Ingreso, DateTime Hora_Salida, string Obs_Tec, int Estado_Ficha, string Nro_Telefono, string Panel, string Obs_Ficha, out string outID_Ficha)
        {
            bool registro = false;
            SqlCommand cmd = new SqlCommand("sp_WCT_Insertar_Ficha_Supervision", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@ProveedorID", SqlDbType.Int);
            param1.Direction = ParameterDirection.Input;
            param1.Value = ProveedorID;

            SqlParameter param2 = cmd.Parameters.Add("@PersonalID", SqlDbType.Int);
            param2.Direction = ParameterDirection.Input;
            param2.Value = PersonalID;

            SqlParameter param3 = cmd.Parameters.Add("@Hora_Ingreso", SqlDbType.DateTime);
            param3.Direction = ParameterDirection.Input;
            param3.Value = Hora_Ingreso;

            SqlParameter param4 = cmd.Parameters.Add("@Hora_Salida", SqlDbType.DateTime);
            param4.Direction = ParameterDirection.Input;
            param4.Value = Hora_Salida;

            SqlParameter param5 = cmd.Parameters.Add("@Obs_Tec", SqlDbType.VarChar, 3000);
            param5.Direction = ParameterDirection.Input;
            param5.Value = Obs_Tec;

            SqlParameter param6 = cmd.Parameters.Add("@Estado_Ficha", SqlDbType.Int);
            param6.Direction = ParameterDirection.Input;
            param6.Value = Estado_Ficha;

            SqlParameter param7 = cmd.Parameters.Add("@Nro_Telefono", SqlDbType.VarChar, 20);
            param7.Direction = ParameterDirection.Input;
            param7.Value = Nro_Telefono;

            SqlParameter param8 = cmd.Parameters.Add("@Panel", SqlDbType.VarChar, 20);
            param8.Direction = ParameterDirection.Input;
            param8.Value = Panel;

            SqlParameter param9 = cmd.Parameters.Add("@Obs_Ficha", SqlDbType.VarChar,3000);
            param9.Direction = ParameterDirection.Input;
            param9.Value = Obs_Ficha;

            //PARAMETROS DE SALIDA

            SqlParameter param10 = cmd.Parameters.Add("@outID_Ficha", SqlDbType.VarChar, 25);
            param10.Direction = ParameterDirection.Output;
            

            int n = cmd.ExecuteNonQuery();

            if (n > 0)
            {
                registro = true;
                outID_Ficha = param10.Value.ToString();
                
            }
            else
            {
                outID_Ficha = "";                
            }

            return registro;

        }
        public bool Insertar_Señales_Aten(SqlConnection con, Int64 ID_Ficha, int ID_Atencion, string csid, Int64 AlarmHistoryID)
        {
            bool registro = false;

            SqlCommand cmd = new SqlCommand("sp_WCT_Insertar_Señales_Aten", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@ID_Ficha", SqlDbType.Int);
            param1.Direction = ParameterDirection.Input;
            param1.Value = ID_Ficha;

            SqlParameter param2 = cmd.Parameters.Add("@ID_Atencion", SqlDbType.Int);
            param2.Direction = ParameterDirection.Input;
            param2.Value = ID_Atencion;

            SqlParameter param3 = cmd.Parameters.Add("@csid", SqlDbType.VarChar,10);
            param3.Direction = ParameterDirection.Input;
            param3.Value = csid;

            SqlParameter param4 = cmd.Parameters.Add("@AlarmHistoryID", SqlDbType.BigInt);
            param4.Direction = ParameterDirection.Input;
            param4.Value = AlarmHistoryID;

            int n = cmd.ExecuteNonQuery();

            if (n > 0)
            {
                registro = true;
            }

            return registro;

        }

    
    }
}
