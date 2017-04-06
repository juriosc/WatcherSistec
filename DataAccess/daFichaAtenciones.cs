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
    public class daFichaAtenciones
    {
        public List<beFichaAtenciones> ListarFichaAtencion(int pID_Ficha, SqlConnection con)
        {
            List<beFichaAtenciones> lbeAtenciones = null;
            SqlCommand cmd = new SqlCommand("sp_WCT_listar_Ficha_Atencion", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@Id_Ficha", SqlDbType.Int);
            param1.Direction = ParameterDirection.Input;
            param1.Value = pID_Ficha;

            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult);

            if (drd != null)
            {
                int ID_Ficha = drd.GetOrdinal("ID_Ficha");
                int ID_Atencion = drd.GetOrdinal("ID_Atencion");
                int CSID = drd.GetOrdinal("CSID");
                int Usuario = drd.GetOrdinal("Usuario");
                int Nombres = drd.GetOrdinal("Nombres");
                int Fecha_Inicio = drd.GetOrdinal("Fecha_Inicio");
                int Fecha_Termino = drd.GetOrdinal("Fecha_Termino");
                int Estado_Inicio = drd.GetOrdinal("Estado_Inicio");
                int Estado_Termino = drd.GetOrdinal("Estado_Termino");
                int b_ALT = drd.GetOrdinal("b_ALT");
                int b_BB = drd.GetOrdinal("b_BB");
                int b_FAC = drd.GetOrdinal("b_FAC");
                int b_ACL = drd.GetOrdinal("b_ACL");
                int b_AA = drd.GetOrdinal("b_AA");
                int Observaciones = drd.GetOrdinal("Observaciones");
                int AlarmHistoryID_Inicial = drd.GetOrdinal("AlarmHistoryID_Inicial");
                int AlarmHistoryID_Final = drd.GetOrdinal("AlarmHistoryID_Final");

                lbeAtenciones = new List<beFichaAtenciones>();

                beFichaAtenciones obeAtenciones;

                while (drd.Read())
                {
                    obeAtenciones = new beFichaAtenciones();
                    obeAtenciones.ID_Ficha = drd.GetInt32(ID_Ficha);
                    obeAtenciones.ID_Atencion = drd.GetInt32(ID_Atencion);
                    obeAtenciones.CSID = drd.GetString(CSID);
                    obeAtenciones.Usuario = drd.GetString(Usuario);
                    obeAtenciones.Fecha_Inicio = drd.GetString(Fecha_Inicio);
                    obeAtenciones.Fecha_Termino = drd.GetString(Fecha_Termino);
                    obeAtenciones.Estado_Inicio = drd.GetInt32(Estado_Inicio);
                    obeAtenciones.Estado_Termino = drd.GetInt32(Estado_Termino);
                    obeAtenciones.b_ALT = drd.GetString(b_ALT);
                    obeAtenciones.b_BB = drd.GetString(b_BB);
                    obeAtenciones.b_FAC = drd.GetString(b_FAC);
                    obeAtenciones.b_ACL = drd.GetString(b_ACL);
                    obeAtenciones.b_AA = drd.GetString(b_AA);
                    obeAtenciones.Observaciones = drd.GetString(Observaciones);
                    obeAtenciones.AlarmHistoryID_Inicial = drd.GetInt32(AlarmHistoryID_Inicial);
                    obeAtenciones.AlarmHistoryID_Final = drd.GetInt32(AlarmHistoryID_Final);

                    lbeAtenciones.Add(obeAtenciones);
                }
                drd.Close();
            }
            return lbeAtenciones;
        }
    }
}
