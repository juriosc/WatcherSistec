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
    public class daLog
    {
        public bool InsertarLog(SqlConnection con, string codlog, string detallelog, string monitoreo, string funcion)
        {
            bool bExito = false;
            int returnFilas = 0;
            string sql = "sp_WCT_insertar_log";

            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@codlog", SqlDbType.VarChar, 20);
            param1.Direction = ParameterDirection.Input;
            param1.Value = codlog;

            SqlParameter param2 = cmd.Parameters.Add("@detallelog", SqlDbType.VarChar, 500);
            param2.Direction = ParameterDirection.Input;
            param2.Value = detallelog;

            SqlParameter param3 = cmd.Parameters.Add("@modulo", SqlDbType.VarChar, 500);
            param3.Direction = ParameterDirection.Input;
            param3.Value = monitoreo;

            SqlParameter param4 = cmd.Parameters.Add("@funcion", SqlDbType.VarChar, 500);
            param4.Direction = ParameterDirection.Input;
            param4.Value = monitoreo;

            returnFilas = cmd.ExecuteNonQuery();

            if (returnFilas > 0) bExito = true;

            return bExito;
        }
    }
}
