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
        public List<beAtenciones> ListarFichaAtencion(SqlConnection con, string pID_Ficha)
        {
            List<beAtenciones> lbeAtenciones = null;
            SqlCommand cmd = new SqlCommand("sp_WCT_listar_Ficha_Atencion", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@Id_Ficha", SqlDbType.VarChar, 15);
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
                int Estado_Inicio_Des = drd.GetOrdinal("Estado_Inicio_Des");
                int Estado_Termino = drd.GetOrdinal("Estado_Termino");
                int Estado_Termino_Des = drd.GetOrdinal("Estado_Termino_Des");
                int b_ALT = drd.GetOrdinal("b_ALT");
                int b_BB = drd.GetOrdinal("b_BB");
                int b_FAC = drd.GetOrdinal("b_FAC");
                int b_ACL = drd.GetOrdinal("b_ACL");
                int b_AA = drd.GetOrdinal("b_AA");
                int Observaciones = drd.GetOrdinal("Observaciones");
                int AlarmHistoryID_Inicial = drd.GetOrdinal("AlarmHistoryID_Inicial");
                int AlarmHistoryID_Final = drd.GetOrdinal("AlarmHistoryID_Final");
                lbeAtenciones = new List<beAtenciones>();

                beAtenciones obeAtenciones;

                while (drd.Read())
                {
                    obeAtenciones = new beAtenciones();
                    obeAtenciones.ID_Ficha = drd.GetInt32(ID_Ficha);
                    obeAtenciones.ID_Atencion = drd.GetInt32(ID_Atencion);
                    obeAtenciones.CSID = drd.GetString(CSID);
                    obeAtenciones.Usuario = drd.GetString(Usuario);
                    obeAtenciones.Fecha_Inicio = drd.GetString(Fecha_Inicio);
                    obeAtenciones.Fecha_Termino = drd.GetString(Fecha_Termino);
                    obeAtenciones.Estado_Inicio = drd.GetString(Estado_Inicio);
                    obeAtenciones.Estado_Inicio_Des = drd.GetString(Estado_Inicio_Des);
                    obeAtenciones.Estado_Termino = drd.GetString(Estado_Termino);
                    obeAtenciones.Estado_Termino_Des = drd.GetString(Estado_Termino_Des);
                    obeAtenciones.b_ALT = drd.GetString(b_ALT);
                    obeAtenciones.b_BB = drd.GetString(b_BB);
                    obeAtenciones.b_FAC = drd.GetString(b_FAC);
                    obeAtenciones.b_ACL = drd.GetString(b_ACL);
                    obeAtenciones.b_AA = drd.GetString(b_AA);
                    obeAtenciones.Observaciones = drd.GetString(Observaciones);
                    obeAtenciones.AlarmHistoryID_Inicial = drd.GetInt32(AlarmHistoryID_Inicial);
                    obeAtenciones.AlarmHistoryID_Final = drd.GetInt32(AlarmHistoryID_Final);
                    obeAtenciones.ImagenEstado = NombreDeIcono(drd.GetString(Estado_Termino));

                    lbeAtenciones.Add(obeAtenciones);
                }
                drd.Close();
            }
            return lbeAtenciones;
        }

        public string NombreDeIcono(string Estado)
        {
            string Nombre = "";
            
            switch (Estado)
            {
                case "1":
                    Nombre = "Pendiente";
                    break;
                case "2":
                    Nombre = "En_Atencion";
                    break;
                case "3":
                    Nombre = "Concluida";
                    break;
                case "4":
                    Nombre = "Cancelada";
                    break;
                default:
                    Nombre = "En_Atencion";
                    break;
            }
            
            string Carp = "../Images/";
            string NomArch = Nombre + ".ico";
            return Carp + NomArch;
        }

        public bool InsertarFichaAtencion(SqlConnection con, Int64 ID_Ficha, string CSID, string Usuario, out string outID_Atencion)
        {
            bool registro = false;
            SqlCommand cmd = new SqlCommand("sp_WCT_Insertar_Ficha_Atencion", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@ID_Ficha", SqlDbType.Int);
            param1.Direction = ParameterDirection.Input;
            param1.Value = ID_Ficha;           

            SqlParameter param2 = cmd.Parameters.Add("@CSID", SqlDbType.VarChar, 10);
            param2.Direction = ParameterDirection.Input;
            param2.Value = CSID;

            SqlParameter param3 = cmd.Parameters.Add("@Usuario", SqlDbType.VarChar, 20);
            param3.Direction = ParameterDirection.Input;
            param3.Value = Usuario;
            
            //PARAMETROS DE SALIDA

            SqlParameter param4 = cmd.Parameters.Add("@outID_Atencion", SqlDbType.VarChar, 25);
            param4.Direction = ParameterDirection.Output;
            
            int n = cmd.ExecuteNonQuery();

            if (n > 0)
            {
                registro = true;                
                outID_Atencion = param4.Value.ToString();

            }
            else
            {                
                outID_Atencion = "";
            }

            return registro;

        }

        public bool ModificarFichaAtencion(SqlConnection con, Int64 ID_Ficha, int ID_Atencion, string CSID, int Estado_Termino, string Observaciones)
        {

            bool registro = false;
            
            SqlCommand cmd = new SqlCommand("WCT_Actualizar_Ficha_Atencion", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@ID_Ficha", SqlDbType.Int);
            param1.Direction = ParameterDirection.Input;
            param1.Value = ID_Ficha;

            SqlParameter param2 = cmd.Parameters.Add("@ID_Atencion", SqlDbType.Int);
            param2.Direction = ParameterDirection.Input;
            param2.Value = ID_Atencion;

            SqlParameter param3 = cmd.Parameters.Add("@CSID", SqlDbType.VarChar, 10);
            param3.Direction = ParameterDirection.Input;
            param3.Value = CSID;

            SqlParameter param4 = cmd.Parameters.Add("@Estado_Termino", SqlDbType.Int);
            param4.Direction = ParameterDirection.Input;
            param4.Value = Estado_Termino;

            SqlParameter param5 = cmd.Parameters.Add("@Observaciones", SqlDbType.VarChar, -1);
            param5.Direction = ParameterDirection.Input;
            param5.Value = Observaciones;

            int n = cmd.ExecuteNonQuery();

            if (n > 0)
            {
                registro = true;
            }
            else
            {
                registro = false;
            }

            return registro;

        }

    }
}
