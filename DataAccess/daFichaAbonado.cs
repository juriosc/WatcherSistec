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
    public class daFichaAbonado
    {
        public List<beFichaAbonado> ListarFichaAbonado(int pID_Ficha, SqlConnection con)
        {
            List<beFichaAbonado> lbeFAbonado = null;
            SqlCommand cmd = new SqlCommand("sp_WCT_listar_Ficha_Abonado", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@Id_Ficha", SqlDbType.Int);
            param1.Direction = ParameterDirection.Input;
            param1.Value = pID_Ficha;

            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult);

            if (drd != null)
            {
                int ID_Ficha = drd.GetOrdinal("ID_Ficha");
                int DealerCode = drd.GetOrdinal("DealerCode");
                int CSID = drd.GetOrdinal("CSID");
                int LocalID = drd.GetOrdinal("LocalID");
                int Observaciones = drd.GetOrdinal("Observaciones");

                lbeFAbonado = new List<beFichaAbonado>();

                beFichaAbonado obeFichaAbonado;

                while (drd.Read())
                {
                    obeFichaAbonado = new beFichaAbonado();
                    obeFichaAbonado.ID_Ficha = drd.GetInt32(ID_Ficha);
                    obeFichaAbonado.DealerCode = drd.GetString(DealerCode);
                    obeFichaAbonado.CSID = drd.GetString(CSID);
                    obeFichaAbonado.LocalID = drd.GetString(LocalID);
                    obeFichaAbonado.Observaciones = drd.GetString(Observaciones);

                    lbeFAbonado.Add(obeFichaAbonado);
                }
                drd.Close();
            }
            return lbeFAbonado;
        }
    }
}
