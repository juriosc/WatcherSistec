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
    public class daComentario
    {
        public List<beComentario> ListarComentario(int pID_Ficha, SqlConnection con)
        {
            List<beComentario> lbeComentario = null;
            SqlCommand cmd = new SqlCommand("sp_WCT_listar_Comentario_Supervision", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@Id_Ficha", SqlDbType.Int);
            param1.Direction = ParameterDirection.Input;
            param1.Value = pID_Ficha;

            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult);

            if (drd != null)
            {
                int ID_Ficha = drd.GetOrdinal("ID_Ficha");
                int Nro_Zona = drd.GetOrdinal("Nro_Zona");
                int ID_Coment = drd.GetOrdinal("ID_Coment");
                int Fecha = drd.GetOrdinal("Fecha");
                int Usuario = drd.GetOrdinal("Usuario");
                int b_Pendiente = drd.GetOrdinal("b_Pendiente");
                int b_Completado = drd.GetOrdinal("b_Completado");
                int Comentario = drd.GetOrdinal("Comentario");

                lbeComentario = new List<beComentario>();

                beComentario obeComentario;

                while (drd.Read())
                {
                    obeComentario = new beComentario();
                    obeComentario.ID_Ficha = drd.GetInt32(ID_Ficha);
                    obeComentario.Nro_Zona = drd.GetInt32(Nro_Zona);
                    obeComentario.ID_Coment = drd.GetInt32(ID_Coment);
                    obeComentario.Fecha = drd.GetString(Fecha);
                    obeComentario.Usuario = drd.GetString(Usuario);
                    obeComentario.b_Pendiente = drd.GetString(b_Pendiente);
                    obeComentario.b_Completado = drd.GetString(b_Completado);
                    obeComentario.Comentario = drd.GetString(Comentario);

                    lbeComentario.Add(obeComentario);
                }
                drd.Close();
            }
            return lbeComentario;
        }
        public List<beComentario> ListarComentarioZona(int pID_Ficha, int pNro_Zona, SqlConnection con)
        {
            List<beComentario> lbeComentario = null;
            SqlCommand cmd = new SqlCommand("sp_WCT_listar_Comentario_Supervision_Zona", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@Id_Ficha", SqlDbType.Int);
            param1.Direction = ParameterDirection.Input;
            param1.Value = pID_Ficha;

            SqlParameter param2 = cmd.Parameters.Add("@Nro_Zona", SqlDbType.Int);
            param2.Direction = ParameterDirection.Input;
            param2.Value = pNro_Zona;

            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult);

            if (drd != null)
            {
                int ID_Ficha = drd.GetOrdinal("ID_Ficha");
                int Nro_Zona = drd.GetOrdinal("Nro_Zona");
                int ID_Coment = drd.GetOrdinal("ID_Coment");
                int Fecha = drd.GetOrdinal("Fecha");
                int Usuario = drd.GetOrdinal("Usuario");
                int b_Pendiente = drd.GetOrdinal("b_Pendiente");
                int b_Completado = drd.GetOrdinal("b_Completado");
                int Comentario = drd.GetOrdinal("Comentario");

                lbeComentario = new List<beComentario>();

                beComentario obeComentario;

                while (drd.Read())
                {
                    obeComentario = new beComentario();
                    obeComentario.ID_Ficha = drd.GetInt32(ID_Ficha);
                    obeComentario.Nro_Zona = drd.GetInt32(Nro_Zona);
                    obeComentario.ID_Coment = drd.GetInt32(ID_Coment);
                    obeComentario.Fecha = drd.GetString(Fecha);
                    obeComentario.Usuario = drd.GetString(Usuario);
                    obeComentario.b_Pendiente = drd.GetString(b_Pendiente);
                    obeComentario.b_Completado = drd.GetString(b_Completado);
                    obeComentario.Comentario = drd.GetString(Comentario);

                    lbeComentario.Add(obeComentario);
                }
                drd.Close();
            }
            return lbeComentario;
        }
    }
}
