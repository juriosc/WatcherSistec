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

        public List<beSeniales> Verificar_Seniales_Aten(SqlConnection con, Int64 AlarmHistoryID, string csid)
        {
            List<beSeniales> lbeVeriSeniales = null;
            SqlCommand cmd = new SqlCommand("sp_WCT_Verificar_Señales_Aten", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@AlarmHistoryID", SqlDbType.Int);
            param1.Direction = ParameterDirection.Input;
            param1.Value = AlarmHistoryID;

            SqlParameter param2 = cmd.Parameters.Add("@csid", SqlDbType.VarChar,10);
            param2.Direction = ParameterDirection.Input;
            param2.Value = csid;            

            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult);
            

            if (drd != null)
            {
                int SignalIdentifier = drd.GetOrdinal("SignalIdentifier");
                int FLAG_TIPO = drd.GetOrdinal("FLAG_TIPO");                

                lbeVeriSeniales = new List<beSeniales>();

                beSeniales obeSeniales;

                while (drd.Read())
                {
                    obeSeniales = new beSeniales();
                    obeSeniales.SignalIdentifier = drd.GetString(SignalIdentifier);
                    obeSeniales.FLAG_TIPO = drd.GetString(FLAG_TIPO);
                    lbeVeriSeniales.Add(obeSeniales);
                }
                drd.Close();
            }
            return lbeVeriSeniales;
        }
        
    }
}
