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
    public class daOperador
    {
        public List<beOperador> ListarOperador(string pUser, string pNombres, SqlConnection con)
        {
            List<beOperador> lbeOperador = null;
            SqlCommand cmd = new SqlCommand("sp_WCT_listar_Operador", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@User", SqlDbType.VarChar, 10);
            param1.Direction = ParameterDirection.Input;
            param1.Value = pUser;

            SqlParameter param2 = cmd.Parameters.Add("@Nombres", SqlDbType.VarChar, 140);
            param2.Direction = ParameterDirection.Input;
            param2.Value = pNombres;

            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult);

            if (drd != null)
            {
                int Perfil = drd.GetOrdinal("Perfil");
                int Proveedor = drd.GetOrdinal("Proveedor");
                int Usuario = drd.GetOrdinal("Usuario");
                int Nombres = drd.GetOrdinal("Nombres");
                int Estado = drd.GetOrdinal("Estado");

                lbeOperador = new List<beOperador>();

                beOperador obeOperador;

                while (drd.Read())
                {
                    obeOperador = new beOperador();
                    obeOperador.Perfil = drd.GetString(Perfil);
                    obeOperador.Proveedor = drd.GetString(Proveedor);
                    obeOperador.Usuario = drd.GetString(Usuario);
                    obeOperador.Nombres = drd.GetString(Nombres);
                    obeOperador.Estado = drd.GetString(Estado);
                    lbeOperador.Add(obeOperador);
                }
                drd.Close();
            }
            return lbeOperador;
        }
    }
}
