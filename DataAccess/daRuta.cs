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
    public class daRuta
    {
        public List<beRuta> ComboRuta(SqlConnection con)
        {
            List<beRuta> lbeRuta = null;

            SqlCommand cmd = new SqlCommand("sp_WCT_combo_Ruta", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataReader drd = cmd.ExecuteReader();

            if (drd != null)
            {
                int Ruta_ID = drd.GetOrdinal("Ruta_ID");
                int Ruta_Des = drd.GetOrdinal("Ruta_Des");

                lbeRuta = new List<beRuta>();
                beRuta obeRuta;
                while (drd.Read())
                {
                    obeRuta = new beRuta();
                    obeRuta.Ruta_ID = drd.GetInt32(Ruta_ID);
                    obeRuta.Ruta_Des = drd.GetString(Ruta_Des);
                    lbeRuta.Add(obeRuta);
                }
                drd.Close();
            }
            return lbeRuta;
        }
    }
}
