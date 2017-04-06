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
    public class daDealer
    {
        public List<beDealer> ListarDealer(string pDcode, string pDname, SqlConnection con)
        {
            List<beDealer> lbeDealer = null;
            SqlCommand cmd = new SqlCommand("sp_WCT_listar_Dealer", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@Dcode", SqlDbType.VarChar, 10);
            param1.Direction = ParameterDirection.Input;
            param1.Value = pDcode;

            SqlParameter param2 = cmd.Parameters.Add("@Dname", SqlDbType.VarChar, 30);
            param2.Direction = ParameterDirection.Input;
            param2.Value = pDname;

            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult);

            if (drd != null)
            {
                lbeDealer = new List<beDealer>();
                int DealerCode = drd.GetOrdinal("DealerCode");
                int DealerName = drd.GetOrdinal("DealerName");

                beDealer obeDealer = null;
                while (drd.Read())
                {
                    obeDealer = new beDealer();
                    obeDealer.DealerCode = drd.GetString(DealerCode);
                    obeDealer.DealerName = drd.GetString(DealerName);
                    lbeDealer.Add(obeDealer);
                }
                drd.Close();
            }
            return lbeDealer;
        }
    }
}
