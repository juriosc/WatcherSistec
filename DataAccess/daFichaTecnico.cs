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
    public class daFichaTecnico
    {
        public List<beTecnico> ListarTecnico(string psProveedorName, string pNombres, SqlConnection con)
        {
            List<beTecnico> lbeTecnico = null;
            SqlCommand cmd = new SqlCommand("sp_WCT_Listar_Tecnicos", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@sProveedorName", SqlDbType.VarChar,20);
            param1.Direction = ParameterDirection.Input;
            param1.Value = psProveedorName;

            SqlParameter param2 = cmd.Parameters.Add("@Nombres", SqlDbType.VarChar,20);
            param2.Direction = ParameterDirection.Input;
            param2.Value = pNombres;

            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult);

            if (drd != null)
            {
                int ProveedorID = drd.GetOrdinal("ProveedorID");
                int sProveedorName = drd.GetOrdinal("sProveedorName");
                int PersonalID = drd.GetOrdinal("PersonalID");
                int Nombres = drd.GetOrdinal("Nombres");
                int sDocumento = drd.GetOrdinal("sDocumento");

                lbeTecnico = new List<beTecnico>();

                beTecnico obeTecnico;

                while (drd.Read())
                {
                    obeTecnico = new beTecnico();
                    obeTecnico.ProveedorID = drd.GetInt32(ProveedorID);
                    obeTecnico.sProveedorName = drd.GetString(sProveedorName);
                    obeTecnico.PersonalID = drd.GetInt32(PersonalID);
                    obeTecnico.Nombres = drd.GetString(Nombres);
                    obeTecnico.sDocumento = drd.GetString(sDocumento);
                    lbeTecnico.Add(obeTecnico);
                }
                drd.Close();
            }
            return lbeTecnico;
        }
    }
}
