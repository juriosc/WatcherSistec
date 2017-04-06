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

        public bool InsertarFichaAtencion(SqlConnection con, int ID_Ficha, int ID_Atencion, string CSID, string Usuario, string Fecha_Inicio, string Fecha_Termino, int Estado_Inicio, int Estado_Termino, int b_ALT, int b_BB, int b_FAC, int b_RED, int b_ACL, int b_AA, string Observaciones, int AlarmHistoryID_Inicial, int AlarmHistoryID_Final)
        {
            bool registro = false;
            SqlCommand cmd = new SqlCommand("sp_WCT_Insertar_Ficha_Atencion", con);
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

            SqlParameter param4 = cmd.Parameters.Add("@Usuario", SqlDbType.VarChar, 20);
            param4.Direction = ParameterDirection.Input;
            param4.Value = Usuario;

            SqlParameter param5 = cmd.Parameters.Add("@Fecha_Inicio", SqlDbType.VarChar, 24);
            param5.Direction = ParameterDirection.Input;
            param5.Value = Fecha_Inicio;

            SqlParameter param6 = cmd.Parameters.Add("@Fecha_Termino", SqlDbType.VarChar, 24);
            param6.Direction = ParameterDirection.Input;
            param6.Value = Fecha_Termino;

            SqlParameter param7 = cmd.Parameters.Add("@Estado_Inicio", SqlDbType.Int);
            param7.Direction = ParameterDirection.Input;
            param7.Value = Estado_Inicio;

            SqlParameter param8 = cmd.Parameters.Add("@Estado_Termino", SqlDbType.Int);
            param8.Direction = ParameterDirection.Input;
            param8.Value = Estado_Termino;

            SqlParameter param9 = cmd.Parameters.Add("@b_ALT", SqlDbType.Int);
            param9.Direction = ParameterDirection.Input;
            param9.Value = b_ALT;

            SqlParameter param10 = cmd.Parameters.Add("@b_BB", SqlDbType.Int);
            param10.Direction = ParameterDirection.Input;
            param10.Value = b_BB;

            SqlParameter param11 = cmd.Parameters.Add("@b_FAC", SqlDbType.Int);
            param11.Direction = ParameterDirection.Input;
            param11.Value = b_FAC;

            SqlParameter param12 = cmd.Parameters.Add("@b_RED", SqlDbType.Int);
            param12.Direction = ParameterDirection.Input;
            param12.Value = b_RED;

            SqlParameter param13 = cmd.Parameters.Add("@b_ACL", SqlDbType.Int);
            param13.Direction = ParameterDirection.Input;
            param13.Value = b_ACL;

            SqlParameter param14 = cmd.Parameters.Add("@b_AA", SqlDbType.Int);
            param14.Direction = ParameterDirection.Input;
            param14.Value = b_AA;

            SqlParameter param15 = cmd.Parameters.Add("@Observaciones", SqlDbType.VarChar, 8000);
            param15.Direction = ParameterDirection.Input;
            param15.Value = Observaciones;

            SqlParameter param16 = cmd.Parameters.Add("@AlarmHistoryID_Inicial", SqlDbType.Int);
            param16.Direction = ParameterDirection.Input;
            param16.Value = AlarmHistoryID_Inicial;

            SqlParameter param17 = cmd.Parameters.Add("@AlarmHistoryID_Final", SqlDbType.Int);
            param17.Direction = ParameterDirection.Input;
            param17.Value = AlarmHistoryID_Final;


            int n = cmd.ExecuteNonQuery();

            if (n > 0)
            {
                registro = true;
            }

            return registro;

        }
    }
}
