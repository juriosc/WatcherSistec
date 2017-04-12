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
    public class daSeniales
    {
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

            SqlParameter param3 = cmd.Parameters.Add("@csid", SqlDbType.VarChar, 10);
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

        /*
        public List<beSeniales> Verificar_Señales_Aten(SqlConnection con , Int64 pID_Ficha, int ID_Atencion, string csid, Int64 AlarmHistoryID)
        {
            /*List<beFichaAbonado> lbeFAbonado = null;
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
        */
    }
}
