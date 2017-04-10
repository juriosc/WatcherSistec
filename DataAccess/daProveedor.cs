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
    public class daProveedor
    {
        public List<beProveedor> ListarProveedor(SqlConnection con, string pCodProvee, string pProveedorName)
        {
            SqlCommand cmd = new SqlCommand("sp_WCT_listar_Proveedor", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@CodProvee", SqlDbType.VarChar, 10);
            param1.Direction = ParameterDirection.Input;
            param1.Value = pCodProvee;

            SqlParameter param2 = cmd.Parameters.Add("@ProveedorName", SqlDbType.VarChar, 10);
            param2.Direction = ParameterDirection.Input;
            param2.Value = pProveedorName;

            SqlDataReader drd = cmd.ExecuteReader();
            List<beProveedor> lbeProveedor = null;

            if (drd != null)
            {
                lbeProveedor = new List<beProveedor>();
                int Codigo = drd.GetOrdinal("Codigo");
                int Proveedor = drd.GetOrdinal("Proveedor");
                int RUC = drd.GetOrdinal("RUC");

                beProveedor obeProveedor = null;

                while (drd.Read())
                {
                    obeProveedor = new beProveedor();
                    obeProveedor.Codigo = drd.GetString(Codigo);
                    obeProveedor.Proveedor = drd.GetString(Proveedor);
                    obeProveedor.RUC = drd.GetString(RUC);
                    lbeProveedor.Add(obeProveedor);
                }
                drd.Close();
            }
            return lbeProveedor;
        }
    }
}
