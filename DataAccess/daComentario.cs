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
        public List<beComentario> ListarComentarioZona(SqlConnection con, Int64 pID_Ficha, int pZona, string pcsid)
        {
            List<beComentario> lbeComentario = null;
            SqlCommand cmd = new SqlCommand("sp_WCT_listar_Comentario_Supervision_Zona", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@Id_Ficha", SqlDbType.Int);
            param1.Direction = ParameterDirection.Input;
            param1.Value = pID_Ficha;

            SqlParameter param2 = cmd.Parameters.Add("@Nro_Zona", SqlDbType.Int);
            param2.Direction = ParameterDirection.Input;
            param2.Value = pZona;

            SqlParameter param3 = cmd.Parameters.Add("@csid", SqlDbType.VarChar, 10);
            param3.Direction = ParameterDirection.Input;
            param3.Value = pcsid;

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
                    obeComentario.ImageTipoComentario = ImgTipoComentario(drd.GetString(b_Pendiente));
                    lbeComentario.Add(obeComentario);
                }
                drd.Close();
            }
            return lbeComentario;
        }

        public string ImgTipoComentario(string tipo)
        {
            string Nombre = "";

            switch (tipo)
            {
                case "0":
                    Nombre = "CComentario";
                    break;
                case "1":
                    Nombre = "CPendiente";
                    break;                
            }

            string Carp = "../Images/";
            string NomArch = Nombre + ".ico";
            return Carp + NomArch;
        }

        public bool InsertarComentario(SqlConnection con, Int64 ID_Ficha, int Nro_Zona, string Usuario, bool b_Pendiente, bool b_Completado, string Comentario, string csid)
        {
            bool registro = false;

            SqlCommand cmd = new SqlCommand("sp_WCT_Insertar_Comentario", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@ID_Ficha", SqlDbType.Int);
            param1.Direction = ParameterDirection.Input;
            param1.Value = ID_Ficha;

            SqlParameter param2 = cmd.Parameters.Add("@Nro_Zona", SqlDbType.Int);
            param2.Direction = ParameterDirection.Input;
            param2.Value = Nro_Zona;

            SqlParameter param3 = cmd.Parameters.Add("@Usuario", SqlDbType.VarChar, 20);
            param3.Direction = ParameterDirection.Input;
            param3.Value = Usuario;

            SqlParameter param4 = cmd.Parameters.Add("@b_Pendiente", SqlDbType.Bit);
            param4.Direction = ParameterDirection.Input;
            param4.Value = b_Pendiente;

            SqlParameter param5 = cmd.Parameters.Add("@b_Completado", SqlDbType.Bit);
            param5.Direction = ParameterDirection.Input;
            param5.Value = b_Completado;

            SqlParameter param6 = cmd.Parameters.Add("@Comentario", SqlDbType.VarChar, -1);
            param6.Direction = ParameterDirection.Input;
            param6.Value = Comentario;

            SqlParameter param7 = cmd.Parameters.Add("@csid", SqlDbType.VarChar, 10);
            param7.Direction = ParameterDirection.Input;
            param7.Value = csid;


            int n = cmd.ExecuteNonQuery();

            if (n > 0)
            {
                registro = true;
            }

            return registro;

        }
        public bool ActualizarComentario(SqlConnection con, Int64 ID_Ficha, int Nro_Zona, string csid, int ID_Coment, string Usuario, bool b_Pendiente, bool b_Completado, string Comentario)
        {
            bool registro = false;
            SqlCommand cmd = new SqlCommand("sp_WCT_Actualizar_Comentario", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@ID_Ficha", SqlDbType.Int);
            param1.Direction = ParameterDirection.Input;
            param1.Value = ID_Ficha;

            SqlParameter param2 = cmd.Parameters.Add("@Nro_Zona", SqlDbType.Int);
            param2.Direction = ParameterDirection.Input;
            param2.Value = Nro_Zona;

            SqlParameter param3 = cmd.Parameters.Add("@csid", SqlDbType.VarChar, 20);
            param3.Direction = ParameterDirection.Input;
            param3.Value = csid;

            SqlParameter param4 = cmd.Parameters.Add("@ID_Coment", SqlDbType.Int);
            param4.Direction = ParameterDirection.Input;
            param4.Value = ID_Coment;

            SqlParameter param5 = cmd.Parameters.Add("@Usuario", SqlDbType.VarChar, 20);
            param5.Direction = ParameterDirection.Input;
            param5.Value = Usuario;

            SqlParameter param6 = cmd.Parameters.Add("@b_Pendiente", SqlDbType.Bit);
            param6.Direction = ParameterDirection.Input;
            param6.Value = b_Pendiente;

            SqlParameter param7 = cmd.Parameters.Add("@b_Completado", SqlDbType.Bit);
            param7.Direction = ParameterDirection.Input;
            param7.Value = b_Completado;

            SqlParameter param8 = cmd.Parameters.Add("@Comentario", SqlDbType.VarChar, -1);
            param8.Direction = ParameterDirection.Input;
            param8.Value = Comentario;

            int n = cmd.ExecuteNonQuery();

            if (n > 0)
            {
                registro = true;
            }

            return registro;

        }

        public bool EliminarComentario(SqlConnection con, Int64 ID_Ficha, int Nro_Zona, string csid, int ID_Coment)
        {
            bool registro = false;
            SqlCommand cmd = new SqlCommand("sp_WCT_Eliminar_Comentario", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@ID_Ficha", SqlDbType.Int);
            param1.Direction = ParameterDirection.Input;
            param1.Value = ID_Ficha;

            SqlParameter param2 = cmd.Parameters.Add("@ID_Coment", SqlDbType.Int);
            param2.Direction = ParameterDirection.Input;
            param2.Value = ID_Coment;

            SqlParameter param3 = cmd.Parameters.Add("@Nro_Zona", SqlDbType.Int);
            param3.Direction = ParameterDirection.Input;
            param3.Value = Nro_Zona;

            SqlParameter param4 = cmd.Parameters.Add("@csid", SqlDbType.VarChar, 10);
            param4.Direction = ParameterDirection.Input;
            param4.Value = csid;
            
            int n = cmd.ExecuteNonQuery();

            if (n > 0)
            {
                registro = true;
            }

            return registro;

        }

    }
}
