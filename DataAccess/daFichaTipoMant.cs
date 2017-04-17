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
    public class daFichaTipoMant
    {
        public bool InsertarFichaTipoMant(SqlConnection con, Int64 ID_Ficha, Int64 TipoMant_ID)
        {
            bool registro = false;
            SqlCommand cmd = new SqlCommand("sp_WCT_Insertar_Ficha_TipoMant", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@ID_Ficha", SqlDbType.Int);
            param1.Direction = ParameterDirection.Input;
            param1.Value = ID_Ficha;

            SqlParameter param2 = cmd.Parameters.Add("@TipoMant_ID", SqlDbType.Int);
            param2.Direction = ParameterDirection.Input;
            param2.Value = TipoMant_ID;

            int n = cmd.ExecuteNonQuery();

            if (n > 0)
            {
                registro = true;
            }

            return registro;

        }
        public List<beTipoMant> Select_Ficha_TipoMant(SqlConnection con, string pID_Ficha)
        {
            List<beTipoMant> lbeMantenimiento = null;
            SqlCommand cmd = new SqlCommand("sp_WCT_Listar_Ficha_Mantenimiento", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@Id_Ficha", SqlDbType.VarChar,15);
            param1.Direction = ParameterDirection.Input;
            param1.Value = pID_Ficha;

            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult);

            if (drd != null)
            {
                int ID_Ficha = drd.GetOrdinal("ID_Ficha");
                int TipoMant_ID = drd.GetOrdinal("TipoMant_ID");

                lbeMantenimiento = new List<beTipoMant>();
                beTipoMant obeTipoMantenimiento;

                while (drd.Read())
                {
                    obeTipoMantenimiento = new beTipoMant();
                    obeTipoMantenimiento.ID_Ficha = drd.GetInt32(ID_Ficha);
                    obeTipoMantenimiento.TipoMant_ID = drd.GetInt32(TipoMant_ID);
                    lbeMantenimiento.Add(obeTipoMantenimiento);
                }
                drd.Close();
            }

            return lbeMantenimiento;
        }        
    }
}
