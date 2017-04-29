using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entity;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;

namespace DataAccess
{
    public class daCronograma
    {
        public List<beCronograma> ListarCronograma(SqlConnection con, string pperiodo_inicio, string pperiodo_fin, string pProveedorID, string pPersonalID, string pRuta_ID, string pbsupervisar, string pCSID, string pfechad, string pfechah, string pestado_pendiente, string pestado_concluida, string pestado_en_atencion, string pestado_cancelada)
        {
            List<beCronograma> lbeCronograma = null;

            SqlCommand cmd = new SqlCommand("sp_WCT_listar_Cronogramas", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@periodo_inicio", SqlDbType.VarChar, 10);
            param1.Direction = ParameterDirection.Input;
            param1.Value = pperiodo_inicio != "" ? DateTime.ParseExact(pperiodo_inicio, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd") : "";

            SqlParameter param2 = cmd.Parameters.Add("@periodo_fin", SqlDbType.VarChar, 10);
            param2.Direction = ParameterDirection.Input;
            param2.Value = pperiodo_fin != "" ? DateTime.ParseExact(pperiodo_fin, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd") : "";

            SqlParameter param3 = cmd.Parameters.Add("@ProveedorID", SqlDbType.VarChar, 15);
            param3.Direction = ParameterDirection.Input;
            param3.Value = pProveedorID;

            SqlParameter param4 = cmd.Parameters.Add("@PersonalID", SqlDbType.VarChar, 15);
            param4.Direction = ParameterDirection.Input;
            param4.Value = pPersonalID;

            SqlParameter param5 = cmd.Parameters.Add("@Ruta_ID", SqlDbType.VarChar, 10);
            param5.Direction = ParameterDirection.Input;
            param5.Value = pRuta_ID;

            SqlParameter param6 = cmd.Parameters.Add("@bsupervisar", SqlDbType.VarChar, 1);
            param6.Direction = ParameterDirection.Input;
            param6.Value = pbsupervisar;

            SqlParameter param7 = cmd.Parameters.Add("@CSID", SqlDbType.VarChar, 10);
            param7.Direction = ParameterDirection.Input;
            param7.Value = pCSID.ToUpper();

            SqlParameter param8 = cmd.Parameters.Add("@fecha_programada_inicio", SqlDbType.VarChar, 10);
            param8.Direction = ParameterDirection.Input;
            param8.Value = pfechad != "" ? DateTime.ParseExact(pfechad, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd") : "";

            SqlParameter param9 = cmd.Parameters.Add("@fecha_programada_fin", SqlDbType.VarChar, 10);
            param9.Direction = ParameterDirection.Input;
            param9.Value = pfechah != "" ? DateTime.ParseExact(pfechah, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd") : "";

            SqlParameter param10 = cmd.Parameters.Add("@estado_pendiente", SqlDbType.VarChar, 1);
            param10.Direction = ParameterDirection.Input;
            param10.Value = pestado_pendiente;

            SqlParameter param11 = cmd.Parameters.Add("@estado_concluida", SqlDbType.VarChar, 1);
            param11.Direction = ParameterDirection.Input;
            param11.Value = pestado_concluida;

            SqlParameter param12 = cmd.Parameters.Add("@estado_en_atencion", SqlDbType.VarChar, 1);
            param12.Direction = ParameterDirection.Input;
            param12.Value = pestado_en_atencion;

            SqlParameter param13 = cmd.Parameters.Add("@estado_cancelada", SqlDbType.VarChar, 1);
            param13.Direction = ParameterDirection.Input;
            param13.Value = pestado_cancelada;

            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult);

            if (drd != null)
            {
                int Periodo = drd.GetOrdinal("Periodo");
                int ProveedorID = drd.GetOrdinal("ProveedorID");
                int PersonalID = drd.GetOrdinal("PersonalID");
                int Nombres = drd.GetOrdinal("Nombres");
                int Ruta_ID = drd.GetOrdinal("Ruta_ID");
                int Ruta = drd.GetOrdinal("Ruta");
                int Observaciones = drd.GetOrdinal("Observaciones");
                int DealerCode = drd.GetOrdinal("DealerCode");
                int CSID = drd.GetOrdinal("CSID");
                int Abonado = drd.GetOrdinal("Abonado");
                int Estado_Ficha = drd.GetOrdinal("Estado_Ficha");
                int tiposMant = drd.GetOrdinal("tiposMant");
                int Fecha_Programada = drd.GetOrdinal("Fecha_Programada");
                int Mes = drd.GetOrdinal("Mes");
                int Anho = drd.GetOrdinal("Anho");
                int DealerName = drd.GetOrdinal("DealerName");
                int ProvName = drd.GetOrdinal("ProvName");
                int Fecha_Visita = drd.GetOrdinal("Fecha_Visita");
                int Ficha_ID = drd.GetOrdinal("Ficha_ID");
                
                
                lbeCronograma = new List<beCronograma>();
                beCronograma obeCronograma;
                while (drd.Read())
                {
                    obeCronograma = new beCronograma();
                    obeCronograma.Periodo = drd.GetString(Periodo);
                    obeCronograma.ProveedorID = drd.GetString(ProveedorID);
                    obeCronograma.PersonalID = drd.GetString(PersonalID);
                    obeCronograma.Nombres = drd.GetString(Nombres);
                    obeCronograma.Ruta_ID = drd.GetString(Ruta_ID);
                    obeCronograma.Ruta = drd.GetString(Ruta);
                    obeCronograma.Observaciones = drd.GetString(Observaciones);
                    obeCronograma.DealerCode = drd.GetString(DealerCode);
                    obeCronograma.CSID = drd.GetString(CSID);
                    obeCronograma.Abonado = drd.GetString(Abonado);
                    obeCronograma.Estado_Ficha = drd.GetString(Estado_Ficha);
                    obeCronograma.tiposMant = drd.GetString(tiposMant);
                    obeCronograma.Fecha_Programada = drd.GetString(Fecha_Programada);
                    obeCronograma.Mes = drd.GetString(Mes);
                    obeCronograma.Anho = drd.GetString(Anho);
                    obeCronograma.DealerName = drd.GetString(DealerName);
                    obeCronograma.ProvName = drd.GetString(ProvName);
                    obeCronograma.Fecha_Visita = drd.GetString(Fecha_Visita);
                    obeCronograma.Ficha_ID = drd.GetString(Ficha_ID);

                    lbeCronograma.Add(obeCronograma);
                }
                drd.Close();
            }
            return lbeCronograma;
        }

        public List<beCronograma> ListarCronogramaDetalle(SqlConnection con, string pPeriodo, string pProveedorID, string pPersonalID, string pRuta_ID, string pCSID)
        {
            List<beCronograma> lbeCronograma = null;

            SqlCommand cmd = new SqlCommand("sp_WCT_listar_Cronogramas_Detalle", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@Periodo", SqlDbType.VarChar, 10);
            param1.Direction = ParameterDirection.Input;
            param1.Value = pPeriodo != "" ? DateTime.ParseExact(pPeriodo, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd") : "";

            SqlParameter param2 = cmd.Parameters.Add("@ProveedorID", SqlDbType.VarChar, 15);
            param2.Direction = ParameterDirection.Input;
            param2.Value = pProveedorID;

            SqlParameter param3 = cmd.Parameters.Add("@PersonalID", SqlDbType.VarChar, 15);
            param3.Direction = ParameterDirection.Input;
            param3.Value = pPersonalID;

            SqlParameter param4 = cmd.Parameters.Add("@Ruta_ID", SqlDbType.VarChar, 10);
            param4.Direction = ParameterDirection.Input;
            param4.Value = pRuta_ID;

            SqlParameter param5 = cmd.Parameters.Add("@CSID", SqlDbType.VarChar, 10);
            param5.Direction = ParameterDirection.Input;
            param5.Value = pCSID.ToUpper();

            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult);

            if (drd != null)
            {
                int Periodo = drd.GetOrdinal("Periodo");
                int ProveedorID = drd.GetOrdinal("ProveedorID");
                int PersonalID = drd.GetOrdinal("PersonalID");
                int Ruta_ID = drd.GetOrdinal("Ruta_ID");
                int b_supervisar = drd.GetOrdinal("b_supervisar");
                int DealerCode = drd.GetOrdinal("DealerCode");
                int CSID = drd.GetOrdinal("CSID");
                int Abonado = drd.GetOrdinal("Abonado");
                int Fecha_Programada = drd.GetOrdinal("Fecha_Programada");
                int Fecha_Visita = drd.GetOrdinal("Fecha_Visita");
                int Observaciones = drd.GetOrdinal("Observaciones");
                int Estado_Ficha = drd.GetOrdinal("Estado_Ficha");
                int tiposMant = drd.GetOrdinal("tiposMant");
                

                lbeCronograma = new List<beCronograma>();
                beCronograma obeCronograma;
                while (drd.Read())
                {
                    obeCronograma = new beCronograma();
                    obeCronograma.Periodo = drd.GetString(Periodo);
                    obeCronograma.ProveedorID = drd.GetString(ProveedorID);
                    obeCronograma.PersonalID = drd.GetString(PersonalID);
                    obeCronograma.Ruta_ID = drd.GetString(Ruta_ID);
                    obeCronograma.b_supervisar = drd.GetString(b_supervisar);
                    obeCronograma.DealerCode = drd.GetString(DealerCode);
                    obeCronograma.CSID = drd.GetString(CSID);
                    obeCronograma.Abonado = drd.GetString(Abonado);
                    obeCronograma.Fecha_Programada = drd.GetString(Fecha_Programada);
                    obeCronograma.Fecha_Visita = drd.GetString(Fecha_Visita);
                    obeCronograma.Observaciones = drd.GetString(Observaciones);
                    obeCronograma.Estado_Ficha = drd.GetString(Estado_Ficha);
                    obeCronograma.tiposMant = drd.GetString(tiposMant);
                    
                    lbeCronograma.Add(obeCronograma);
                }
                drd.Close();
            }
            return lbeCronograma;
        }

        public List<beCronograma> ListarCronogramaTipoMant(SqlConnection con, string pPeriodo, string pProveedorID, string pPersonalID, string pRuta_ID, string pCSID)
        {
            List<beCronograma> lbeCronograma = null;
            SqlCommand cmd = new SqlCommand("sp_WCT_listar_Cronograma_Mantenimiento", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@Periodo", SqlDbType.VarChar, 20);
            param1.Direction = ParameterDirection.Input;
            param1.Value = pPeriodo;
            //param1.Value = pPeriodo != "" ? DateTime.ParseExact(pPeriodo, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd") : "";

            SqlParameter param2 = cmd.Parameters.Add("@ProveedorID", SqlDbType.VarChar, 15);
            param2.Direction = ParameterDirection.Input;
            param2.Value = pProveedorID;

            SqlParameter param3 = cmd.Parameters.Add("@PersonalID", SqlDbType.VarChar, 15);
            param3.Direction = ParameterDirection.Input;
            param3.Value = pPersonalID;

            SqlParameter param4 = cmd.Parameters.Add("@Ruta_ID", SqlDbType.VarChar, 10);
            param4.Direction = ParameterDirection.Input;
            param4.Value = pRuta_ID;

            SqlParameter param5 = cmd.Parameters.Add("@CSID", SqlDbType.VarChar, 10);
            param5.Direction = ParameterDirection.Input;
            param5.Value = pCSID.ToUpper();

            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult);

            if (drd != null)
            {
                int Periodo = drd.GetOrdinal("Periodo");
                int ProveedorID = drd.GetOrdinal("ProveedorID");
                int PersonalID = drd.GetOrdinal("PersonalID");
                int Ruta_ID = drd.GetOrdinal("Ruta_ID");
                int CSID = drd.GetOrdinal("CSID");
                int TipoMant_ID = drd.GetOrdinal("TipoMant_ID");

                lbeCronograma = new List<beCronograma>();
                beCronograma obeCronograma;

                while (drd.Read())
                {
                    obeCronograma = new beCronograma();
                    obeCronograma.Periodo = drd.GetString(Periodo);
                    obeCronograma.ProveedorID = drd.GetString(ProveedorID);
                    obeCronograma.PersonalID = drd.GetString(PersonalID);
                    obeCronograma.Ruta_ID = drd.GetString(Ruta_ID);
                    obeCronograma.CSID = drd.GetString(CSID);
                    obeCronograma.TipoMant_ID = drd.GetInt32(TipoMant_ID);
                    lbeCronograma.Add(obeCronograma);
                }
                drd.Close();
            }

            return lbeCronograma;
        }        

        public bool InsertarCronograma(SqlConnection con, int ProveedorID, int PersonalID, int Ruta, string Obser, DateTime Periodo)
        {
            bool registro = false;
            SqlCommand cmd = new SqlCommand("sp_WCT_Insertar_Cronograma", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@ProveedorID", SqlDbType.Int);
            param1.Direction = ParameterDirection.Input;
            param1.Value = ProveedorID;

            SqlParameter param2 = cmd.Parameters.Add("@PersonalID", SqlDbType.Int);
            param2.Direction = ParameterDirection.Input;
            param2.Value = PersonalID;

            SqlParameter param3 = cmd.Parameters.Add("@Ruta_ID", SqlDbType.Int);
            param3.Direction = ParameterDirection.Input;
            param3.Value = Ruta;

            SqlParameter param4 = cmd.Parameters.Add("@Obser", SqlDbType.VarChar, 3000);
            param4.Direction = ParameterDirection.Input;
            param4.Value = Obser;

            SqlParameter param5 = cmd.Parameters.Add("@Periodo", SqlDbType.DateTime);
            param5.Direction = ParameterDirection.Input;
            param5.Value = Periodo;

            int n = cmd.ExecuteNonQuery();

            if (n > 0)
            {
                registro = true;
            }

            return registro;

        }

        public bool InsertarCronogramaDetalle(SqlConnection con, int ProveedorID, int PersonalID, int Ruta, DateTime Periodo, string CSID, DateTime Fecha_Programada, string Dealercode, DateTime Fecha_Visita, string Obser)
        {
            bool registro = false;
            SqlCommand cmd = new SqlCommand("sp_WCT_Insertar_Cronograma_Detalle", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@ProveedorID", SqlDbType.Int);
            param1.Direction = ParameterDirection.Input;
            param1.Value = ProveedorID;

            SqlParameter param2 = cmd.Parameters.Add("@PersonalID", SqlDbType.Int);
            param2.Direction = ParameterDirection.Input;
            param2.Value = PersonalID;

            SqlParameter param3 = cmd.Parameters.Add("@Ruta_ID", SqlDbType.Int);
            param3.Direction = ParameterDirection.Input;
            param3.Value = Ruta;

            SqlParameter param4 = cmd.Parameters.Add("@Periodo", SqlDbType.DateTime);
            param4.Direction = ParameterDirection.Input;
            param4.Value = Periodo;

            SqlParameter param5 = cmd.Parameters.Add("@CSID", SqlDbType.VarChar, 10);
            param5.Direction = ParameterDirection.Input;
            param5.Value = CSID;

            SqlParameter param6 = cmd.Parameters.Add("@Fecha_Programada", SqlDbType.DateTime);
            param6.Direction = ParameterDirection.Input;
            param6.Value = Fecha_Programada;

            SqlParameter param7 = cmd.Parameters.Add("@DealerCode", SqlDbType.VarChar, 10);
            param7.Direction = ParameterDirection.Input;
            param7.Value = Dealercode;

            SqlParameter param8 = cmd.Parameters.Add("@Fecha_Visita", SqlDbType.DateTime);
            param8.Direction = ParameterDirection.Input;
            param8.Value = Fecha_Visita;

            SqlParameter param9 = cmd.Parameters.Add("@Obser", SqlDbType.VarChar, 3000);
            param9.Direction = ParameterDirection.Input;
            param9.Value = Obser;

            int n = cmd.ExecuteNonQuery();

            if (n > 0)
            {
                registro = true;
            }

            return registro;

        }
        public bool InsertarCronogramaTipoMant(SqlConnection con, int ProveedorID, int PersonalID, int Ruta, DateTime Periodo, string CSID, DateTime Fecha_Programada, Int64 TipoMant_ID)
        {
            bool registro = false;
            SqlCommand cmd = new SqlCommand("sp_WCT_Insertar_Cronograma_TipoMant", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@ProveedorID", SqlDbType.Int);
            param1.Direction = ParameterDirection.Input;
            param1.Value = ProveedorID;

            SqlParameter param2 = cmd.Parameters.Add("@PersonalID", SqlDbType.Int);
            param2.Direction = ParameterDirection.Input;
            param2.Value = PersonalID;

            SqlParameter param3 = cmd.Parameters.Add("@Ruta_ID", SqlDbType.Int);
            param3.Direction = ParameterDirection.Input;
            param3.Value = Ruta;

            SqlParameter param4 = cmd.Parameters.Add("@Periodo", SqlDbType.DateTime);
            param4.Direction = ParameterDirection.Input;
            param4.Value = Periodo;

            SqlParameter param5 = cmd.Parameters.Add("@CSID", SqlDbType.VarChar, 10);
            param5.Direction = ParameterDirection.Input;
            param5.Value = CSID;

            SqlParameter param6 = cmd.Parameters.Add("@Fecha_Programada", SqlDbType.DateTime);
            param6.Direction = ParameterDirection.Input;
            param6.Value = Fecha_Programada;

            SqlParameter param7 = cmd.Parameters.Add("@TipoMant_ID", SqlDbType.Int);
            param7.Direction = ParameterDirection.Input;
            param7.Value = TipoMant_ID;

            int n = cmd.ExecuteNonQuery();

            if (n > 0)
            {
                registro = true;
            }

            return registro;

        }


        public bool ActualizarCronograma(SqlConnection con, int ProveedorID, int PersonalID, int Ruta, DateTime Periodo, string CSID, DateTime Fecha_Programada, string Dealercode, DateTime Fecha_Visita, string Obser)
        {
            bool registro = false;
            SqlCommand cmd = new SqlCommand("sp_WCT_Actualizar_Cronograma", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@ProveedorID", SqlDbType.Int);
            param1.Direction = ParameterDirection.Input;
            param1.Value = ProveedorID;

            SqlParameter param2 = cmd.Parameters.Add("@PersonalID", SqlDbType.Int);
            param2.Direction = ParameterDirection.Input;
            param2.Value = PersonalID;

            SqlParameter param3 = cmd.Parameters.Add("@Ruta_ID", SqlDbType.Int);
            param3.Direction = ParameterDirection.Input;
            param3.Value = Ruta;

            SqlParameter param4 = cmd.Parameters.Add("@Periodo", SqlDbType.DateTime);
            param4.Direction = ParameterDirection.Input;
            param4.Value = Periodo;

            SqlParameter param5 = cmd.Parameters.Add("@CSID", SqlDbType.VarChar, 10);
            param5.Direction = ParameterDirection.Input;
            param5.Value = CSID;

            SqlParameter param6 = cmd.Parameters.Add("@Fecha_Programada", SqlDbType.DateTime);
            param6.Direction = ParameterDirection.Input;
            param6.Value = Fecha_Programada;

            SqlParameter param7 = cmd.Parameters.Add("@DealerCode", SqlDbType.VarChar, 10);
            param7.Direction = ParameterDirection.Input;
            param7.Value = Dealercode;

            SqlParameter param8 = cmd.Parameters.Add("@Fecha_Visita", SqlDbType.DateTime);
            param8.Direction = ParameterDirection.Input;
            param8.Value = Fecha_Visita;

            SqlParameter param9 = cmd.Parameters.Add("@Obser", SqlDbType.VarChar, 3000);
            param9.Direction = ParameterDirection.Input;
            param9.Value = Obser;

            int n = cmd.ExecuteNonQuery();

            if (n > 0)
            {
                registro = true;
            }

            return registro;

        }

        public bool ActualizarFichaID(SqlConnection con, string Ficha, int ProveedorID, int PersonalID, int Ruta, DateTime Periodo, string CSID, string Dealercode)
        {
            bool registro = false;
            SqlCommand cmd = new SqlCommand("sp_WCT_Actualizar_IDFicha", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@ID_Ficha", SqlDbType.VarChar, 10);
            param1.Direction = ParameterDirection.Input;
            param1.Value = Ficha;

            SqlParameter param2 = cmd.Parameters.Add("@ProveedorID", SqlDbType.Int);
            param2.Direction = ParameterDirection.Input;
            param2.Value = ProveedorID;

            SqlParameter param3 = cmd.Parameters.Add("@PersonalID", SqlDbType.Int);
            param3.Direction = ParameterDirection.Input;
            param3.Value = PersonalID;

            SqlParameter param4 = cmd.Parameters.Add("@Ruta_ID", SqlDbType.Int);
            param4.Direction = ParameterDirection.Input;
            param4.Value = Ruta;

            SqlParameter param5 = cmd.Parameters.Add("@Periodo", SqlDbType.DateTime);
            param5.Direction = ParameterDirection.Input;
            param5.Value = Periodo;

            SqlParameter param6 = cmd.Parameters.Add("@CSID", SqlDbType.VarChar, 10);
            param6.Direction = ParameterDirection.Input;
            param6.Value = CSID;

            SqlParameter param7 = cmd.Parameters.Add("@DealerCode", SqlDbType.VarChar, 10);
            param7.Direction = ParameterDirection.Input;
            param7.Value = Dealercode;

            int n = cmd.ExecuteNonQuery();

            if (n > 0)
            {
                registro = true;
            }

            return registro;

        }
    }
}
