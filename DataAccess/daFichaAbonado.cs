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
        public List<beFichaAbonado> ListarFichaAbonado(SqlConnection con, string pID_Ficha)
        {
            List<beFichaAbonado> lbeFAbonado = null;
            SqlCommand cmd = new SqlCommand("sp_WCT_listar_Ficha_Abonado", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@Id_Ficha", SqlDbType.VarChar,15);
            param1.Direction = ParameterDirection.Input;
            param1.Value = pID_Ficha;

            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult);

            if (drd != null)
            {
                int ID_Ficha = drd.GetOrdinal("ID_Ficha");
                int DealerCode = drd.GetOrdinal("DealerCode");
                int CSID = drd.GetOrdinal("CSID");
                int SubscriberName = drd.GetOrdinal("SubscriberName");                
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
                    obeFichaAbonado.SubscriberName = drd.GetString(SubscriberName);
                    obeFichaAbonado.LocalID = drd.GetString(LocalID);
                    obeFichaAbonado.Observaciones = drd.GetString(Observaciones);

                    lbeFAbonado.Add(obeFichaAbonado);
                }
                drd.Close();
            }
            return lbeFAbonado;
        }

        public bool InsertarFichaAbonado(SqlConnection con, int ID_Ficha, string DealerCode, string CSID, string LocalID, string Observaciones)
        {
            bool registro = false;
            SqlCommand cmd = new SqlCommand("sp_WCT_Insertar_Ficha_Abonado", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@ID_Ficha", SqlDbType.Int);
            param1.Direction = ParameterDirection.Input;
            param1.Value = ID_Ficha;

            SqlParameter param2 = cmd.Parameters.Add("@DealerCode", SqlDbType.VarChar, 10);
            param2.Direction = ParameterDirection.Input;
            param2.Value = DealerCode;

            SqlParameter param3 = cmd.Parameters.Add("@CSID", SqlDbType.VarChar, 10);
            param3.Direction = ParameterDirection.Input;
            param3.Value = CSID;

            SqlParameter param4 = cmd.Parameters.Add("@LocalID", SqlDbType.VarChar, 15);
            param4.Direction = ParameterDirection.Input;
            param4.Value = LocalID;

            SqlParameter param5 = cmd.Parameters.Add("@Observaciones", SqlDbType.VarChar, 1000);
            param5.Direction = ParameterDirection.Input;
            param5.Value = Observaciones;


            int n = cmd.ExecuteNonQuery();

            if (n > 0)
            {
                registro = true;
            }

            return registro;

        }
    }
}
