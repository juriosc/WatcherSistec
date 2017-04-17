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
    public class daTipoMantenimiento
    {
        public List<beTipoMant> ListarMantenimiento(SqlConnection con)
        {
            List<beTipoMant> lbeMantenimiento = null;
            SqlCommand cmd = new SqlCommand("sp_WCT_Listar_Mantenimiento", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult);

            if (drd != null)
            {
                int TipoMant_ID = drd.GetOrdinal("TipoMant_ID");
                int TipoMant_Des = drd.GetOrdinal("TipoMant_Des");

                lbeMantenimiento = new List<beTipoMant>();
                beTipoMant obeTipoMantenimiento;

                while (drd.Read())
                {
                    obeTipoMantenimiento = new beTipoMant();
                    obeTipoMantenimiento.TipoMant_ID = drd.GetInt32(TipoMant_ID);
                    obeTipoMantenimiento.TipoMant_Des = drd.GetString(TipoMant_Des);
                    lbeMantenimiento.Add(obeTipoMantenimiento);
                }
                drd.Close();
            }

            return lbeMantenimiento;
        }
        
    }
}
