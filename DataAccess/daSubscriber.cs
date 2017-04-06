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
    public class daSubscriber
    {
        public List<beSubscriber> BusCodSubscriber(SqlConnection con, string dealercode, string csid)
        {
            SqlCommand cmd = new SqlCommand("sp_WMON_buscar_abonado", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@dealercode", SqlDbType.VarChar, 5);
            param1.Direction = ParameterDirection.Input;
            param1.Value = dealercode;

            SqlParameter param2 = cmd.Parameters.Add("@csid", SqlDbType.VarChar, 10);
            param2.Direction = ParameterDirection.Input;
            param2.Value = csid;

            SqlDataReader drd = cmd.ExecuteReader();
            List<beSubscriber> lbeBusCodSubscriber = null;

            if (drd != null)
            {
                lbeBusCodSubscriber = new List<beSubscriber>();
                int SubscriberName = drd.GetOrdinal("SubscriberName");

                beSubscriber obeSubscriber = null;
                while (drd.Read())
                {
                    obeSubscriber = new beSubscriber();
                    obeSubscriber.SubscriberName = drd.GetString(SubscriberName);
                    lbeBusCodSubscriber.Add(obeSubscriber);
                }
                drd.Close();
            }
            return lbeBusCodSubscriber;
        }

        public List<beSubscriber> ListarSubscriber(SqlConnection con, string pDealerCode, string pCsid, string psubscribername)
        {
            SqlCommand cmd = new SqlCommand("sp_WCT_listar_Subscriber", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@DealerCode", SqlDbType.VarChar, 10);
            param1.Direction = ParameterDirection.Input;
            param1.Value = pDealerCode;

            SqlParameter param2 = cmd.Parameters.Add("@CSID", SqlDbType.VarChar, 10);
            param2.Direction = ParameterDirection.Input;
            param2.Value = pCsid;

            SqlParameter param3 = cmd.Parameters.Add("@subscribername", SqlDbType.VarChar, 70);
            param3.Direction = ParameterDirection.Input;
            param3.Value = psubscribername;

            SqlDataReader drd = cmd.ExecuteReader();
            List<beSubscriber> lbeListarSubscriber = null;

            if (drd != null)
            {
                lbeListarSubscriber = new List<beSubscriber>();
                int DealerCode = drd.GetOrdinal("DealerCode");
                int DealerName = drd.GetOrdinal("DealerName");
                int CSID = drd.GetOrdinal("CSID");
                int SubscriberName = drd.GetOrdinal("SubscriberName");
                int AddressStreet = drd.GetOrdinal("AddressStreet");
                int Localid = drd.GetOrdinal("Localid");
                int LocalDes = drd.GetOrdinal("LocalDes");     

                beSubscriber obeSubscriber = null;

                while (drd.Read())
                {
                    obeSubscriber = new beSubscriber();
                    obeSubscriber.DealerCode = drd.GetString(DealerCode);
                    obeSubscriber.DealerName = drd.GetString(DealerName);
                    obeSubscriber.CSID = drd.GetString(CSID);
                    obeSubscriber.SubscriberName = drd.GetString(SubscriberName);
                    obeSubscriber.AddressStreet = drd.GetString(AddressStreet);
                    obeSubscriber.Localid = drd.GetString(Localid);
                    obeSubscriber.LocalDes = drd.GetString(LocalDes);                    
                    lbeListarSubscriber.Add(obeSubscriber);
                }
                drd.Close();
            }
            return lbeListarSubscriber;
        }
    }
}
