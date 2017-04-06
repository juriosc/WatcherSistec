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
    public class daBloqueZona
    {
        public List<beBloqueZona> ListarBloqueZona(SqlConnection con, string pCSID)
        {
            List<beBloqueZona> lbeBloqueZona = null;
            SqlCommand cmd = new SqlCommand("sp_WCT_BLOQUE_ZONA", con);
            cmd.CommandType = CommandType.StoredProcedure;
            
            SqlParameter param1 = cmd.Parameters.Add("@CSID", SqlDbType.VarChar, 10);
            param1.Direction = ParameterDirection.Input;
            param1.Value = pCSID;

            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult);

            if (drd != null)
            {
                int A = drd.GetOrdinal("A");
                int B = drd.GetOrdinal("B");
                int C = drd.GetOrdinal("C");
                int D = drd.GetOrdinal("D");
                int E = drd.GetOrdinal("E");
                int F = drd.GetOrdinal("F");
                int G = drd.GetOrdinal("G");
                int H = drd.GetOrdinal("H");
                int I = drd.GetOrdinal("I");
                int J = drd.GetOrdinal("J");
                int K = drd.GetOrdinal("K");
                int L = drd.GetOrdinal("L");
                int M = drd.GetOrdinal("M");
                int N = drd.GetOrdinal("N");
                int O = drd.GetOrdinal("O");
                int P = drd.GetOrdinal("P");
                int Q = drd.GetOrdinal("Q");
                int R = drd.GetOrdinal("R");
                int S = drd.GetOrdinal("S");
                int T = drd.GetOrdinal("T");
                int PA = drd.GetOrdinal("PA");
                int PB = drd.GetOrdinal("PB");
                int PC = drd.GetOrdinal("PC");
                int PD = drd.GetOrdinal("PD");
                int PE = drd.GetOrdinal("PE");
                int PF = drd.GetOrdinal("PF");
                int PG = drd.GetOrdinal("PG");
                int PH = drd.GetOrdinal("PH");
                int PI = drd.GetOrdinal("PI");
                int PJ = drd.GetOrdinal("PJ");
                int PK = drd.GetOrdinal("PK");
                int PL = drd.GetOrdinal("PL");
                int PM = drd.GetOrdinal("PM");
                int PN = drd.GetOrdinal("PN");
                int PO = drd.GetOrdinal("PO");
                int PP = drd.GetOrdinal("PP");
                int PQ = drd.GetOrdinal("PQ");
                int PR = drd.GetOrdinal("PR");
                int PS = drd.GetOrdinal("PS");
                int PT = drd.GetOrdinal("PT");

                lbeBloqueZona = new List<beBloqueZona>();

                beBloqueZona obeBloqueZona;

                while (drd.Read())
                {
                    obeBloqueZona = new beBloqueZona();
                    obeBloqueZona.A = drd.GetString(A);
                    obeBloqueZona.B = drd.GetString(B);
                    obeBloqueZona.C = drd.GetString(C);
                    obeBloqueZona.D = drd.GetString(D);
                    obeBloqueZona.E = drd.GetString(E);
                    obeBloqueZona.F = drd.GetString(F);
                    obeBloqueZona.G = drd.GetString(G);
                    obeBloqueZona.H = drd.GetString(H);
                    obeBloqueZona.I = drd.GetString(I);
                    obeBloqueZona.J = drd.GetString(J);
                    obeBloqueZona.K = drd.GetString(K);
                    obeBloqueZona.L = drd.GetString(L);
                    obeBloqueZona.M = drd.GetString(M);
                    obeBloqueZona.N = drd.GetString(N);
                    obeBloqueZona.O = drd.GetString(O);
                    obeBloqueZona.P = drd.GetString(P);
                    obeBloqueZona.Q = drd.GetString(Q);
                    obeBloqueZona.R = drd.GetString(R);
                    obeBloqueZona.S = drd.GetString(S);
                    obeBloqueZona.T = drd.GetString(T);
                    obeBloqueZona.PA = drd.GetString(PA);
                    obeBloqueZona.PB = drd.GetString(PB);
                    obeBloqueZona.PC = drd.GetString(PC);
                    obeBloqueZona.PD = drd.GetString(PD);
                    obeBloqueZona.PE = drd.GetString(PE);
                    obeBloqueZona.PF = drd.GetString(PF);
                    obeBloqueZona.PG = drd.GetString(PG);
                    obeBloqueZona.PH = drd.GetString(PH);
                    obeBloqueZona.PI = drd.GetString(PI);
                    obeBloqueZona.PJ = drd.GetString(PJ);
                    obeBloqueZona.PK = drd.GetString(PK);
                    obeBloqueZona.PL = drd.GetString(PL);
                    obeBloqueZona.PM = drd.GetString(PM);
                    obeBloqueZona.PN = drd.GetString(PN);
                    obeBloqueZona.PO = drd.GetString(PO);
                    obeBloqueZona.PP = drd.GetString(PP);
                    obeBloqueZona.PQ = drd.GetString(PQ);
                    obeBloqueZona.PR = drd.GetString(PR);
                    obeBloqueZona.PS = drd.GetString(PS);
                    obeBloqueZona.PT = drd.GetString(PT);

                    lbeBloqueZona.Add(obeBloqueZona);
                }
                drd.Close();
            }
            return lbeBloqueZona;
        }
    }
}
