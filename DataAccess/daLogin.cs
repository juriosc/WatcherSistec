using Entity;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace DataAccess
{
    public class daLogin
    {
        public List<beLogin> ValidarLogin(SqlConnection con, string usuario, string password, string dealercode)
        {
            List<beLogin> lbeLogin = null;
            SqlCommand cmd = new SqlCommand("sp_WCT_validarlogin", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@sUserIden", SqlDbType.VarChar, 10);
            param1.Direction = ParameterDirection.Input;
            param1.Value = usuario;

            SqlParameter param2 = cmd.Parameters.Add("@sUserPswd", SqlDbType.VarChar, 10);
            param2.Direction = ParameterDirection.Input;
            param2.Value = password;

            SqlParameter param3 = cmd.Parameters.Add("@DealerCode", SqlDbType.VarChar, 10);
            param3.Direction = ParameterDirection.Input;
            param3.Value = dealercode;

            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult);

            if (drd != null)
            {
                int exito = drd.GetOrdinal("exito");
                int sUserIden = drd.GetOrdinal("sUserIden");
                int cPrflCode = drd.GetOrdinal("cPrflCode");
                int sdealercode = drd.GetOrdinal("dealercode");
                int sdealername = drd.GetOrdinal("dealername");

                lbeLogin = new List<beLogin>();
                beLogin obeLogin;

                while (drd.Read())
                {
                    obeLogin = new beLogin();
                    obeLogin.exito = drd.GetInt16(exito);
                    obeLogin.sUserIden = drd.GetString(sUserIden);
                    obeLogin.cPrflCode = drd.GetInt16(cPrflCode);
                    obeLogin.dealercode = drd.GetString(sdealercode);
                    obeLogin.dealername = drd.GetString(sdealername);
                    lbeLogin.Add(obeLogin);
                }
                drd.Close();
            }
            return lbeLogin;
        }
    }
}
