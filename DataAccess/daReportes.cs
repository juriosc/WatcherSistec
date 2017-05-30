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
    public class daReportes
    {
        public List<beReportes> ListarReporte_FichaPxT(SqlConnection con, string pfechad, string pfechah, string pProveedorID, string pPersonalID, string ptipo_mant, string pCSID, string pExc_coment, string pEstado)
        {
            List<beReportes> lbeReportes = null;

            SqlCommand cmd = new SqlCommand("sp_WCT_listar_rep_Fichas_PendientesxTecnico", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@fechad", SqlDbType.VarChar, 10);
            param1.Direction = ParameterDirection.Input;
            param1.Value = pfechad != "" ? DateTime.ParseExact(pfechad, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd") : "";

            SqlParameter param2 = cmd.Parameters.Add("@fechah", SqlDbType.VarChar, 10);
            param2.Direction = ParameterDirection.Input;
            param2.Value = pfechah != "" ? DateTime.ParseExact(pfechah, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd") : "";

            SqlParameter param3 = cmd.Parameters.Add("@ProveedorID", SqlDbType.VarChar, 15);
            param3.Direction = ParameterDirection.Input;
            param3.Value = pProveedorID;

            SqlParameter param4 = cmd.Parameters.Add("@PersonalID", SqlDbType.VarChar, 15);
            param4.Direction = ParameterDirection.Input;
            param4.Value = pPersonalID;

            SqlParameter param5 = cmd.Parameters.Add("@tipo_mant", SqlDbType.VarChar, 100);
            param5.Direction = ParameterDirection.Input;
            param5.Value = ptipo_mant.ToUpper();

            SqlParameter param6 = cmd.Parameters.Add("@CSID", SqlDbType.VarChar, 10);
            param6.Direction = ParameterDirection.Input;
            param6.Value = pCSID.ToUpper();

            SqlParameter param7 = cmd.Parameters.Add("@Exc_coment", SqlDbType.VarChar, 1);
            param7.Direction = ParameterDirection.Input;
            param7.Value = pExc_coment;

            SqlParameter param8 = cmd.Parameters.Add("@Estado", SqlDbType.VarChar, 1);
            param8.Direction = ParameterDirection.Input;
            param8.Value = pEstado;

            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult);

            if (drd != null)
            {
                int Completado = drd.GetOrdinal("Completado");
                int ProveedorID = drd.GetOrdinal("ProveedorID");
                int PersonalID = drd.GetOrdinal("PersonalID");
                int Nombres = drd.GetOrdinal("Nombres");
                int Fecha_Registro = drd.GetOrdinal("Fecha_Registro");
                int Dealer = drd.GetOrdinal("Dealer");
                int CSID = drd.GetOrdinal("CSID");
                int SubscriberName = drd.GetOrdinal("SubscriberName");
                int Usuario = drd.GetOrdinal("Usuario");
                int Comentario = drd.GetOrdinal("Comentario");
                int ID_Ficha = drd.GetOrdinal("ID_Ficha");
                int b_pendiente = drd.GetOrdinal("b_pendiente");
                int Zona = drd.GetOrdinal("Zona");
                int TipoMantenimiento = drd.GetOrdinal("TipoMantenimiento");
                int Pendiente = drd.GetOrdinal("Pendiente");
                int b_completado = drd.GetOrdinal("b_completado");
                int DealerName = drd.GetOrdinal("DealerName");
                int ProvName = drd.GetOrdinal("ProvName");
                
                lbeReportes = new List<beReportes>();
                beReportes obeReportes;
                while (drd.Read())
                {
                    obeReportes = new beReportes();
                    obeReportes.Completado = drd.GetString(Completado);
                    obeReportes.ProveedorID = drd.GetString(ProveedorID);
                    obeReportes.PersonalID = drd.GetString(PersonalID);
                    obeReportes.Nombres = drd.GetString(Nombres);
                    obeReportes.Fecha_Registro = drd.GetString(Fecha_Registro);
                    obeReportes.Dealer = drd.GetString(Dealer);
                    obeReportes.CSID = drd.GetString(CSID);
                    obeReportes.SubscriberName = drd.GetString(SubscriberName);
                    obeReportes.Usuario = drd.GetString(Usuario);
                    obeReportes.Comentario = drd.GetString(Comentario);
                    obeReportes.ID_Ficha = drd.GetString(ID_Ficha);
                    obeReportes.b_pendiente = drd.GetString(b_pendiente);
                    obeReportes.Zona = drd.GetString(Zona);
                    obeReportes.TipoMantenimiento = drd.GetString(TipoMantenimiento);
                    obeReportes.Pendiente = drd.GetString(Pendiente);
                    obeReportes.b_completado = drd.GetString(b_completado);
                    obeReportes.DealerName = drd.GetString(DealerName);
                    obeReportes.ProvName = drd.GetString(ProvName);
                    
                    lbeReportes.Add(obeReportes);
                }

                drd.Close();

            }
            return lbeReportes;
        }

        public List<beReportes> ListarReporte_xTipoTrabajo(SqlConnection con, string pfechad, string pfechah, string ptipo_mant)
        {
            List<beReportes> lbeReportes = null;

            SqlCommand cmd = new SqlCommand("sp_WCT_listar_rep_xTipoTrabajo", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@fechad", SqlDbType.VarChar, 10);
            param1.Direction = ParameterDirection.Input;
            param1.Value = pfechad != "" ? DateTime.ParseExact(pfechad, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd") : "";

            SqlParameter param2 = cmd.Parameters.Add("@fechah", SqlDbType.VarChar, 10);
            param2.Direction = ParameterDirection.Input;
            param2.Value = pfechah != "" ? DateTime.ParseExact(pfechah, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd") : "";

            SqlParameter param3 = cmd.Parameters.Add("@tipo_mant", SqlDbType.VarChar, 100);
            param3.Direction = ParameterDirection.Input;
            param3.Value = ptipo_mant.ToUpper();

            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult);

            if (drd != null)
            {
                int Fecha_Registro = drd.GetOrdinal("Fecha_Registro");
                int ID_Ficha = drd.GetOrdinal("ID_Ficha");
                int Dealer = drd.GetOrdinal("Dealer");
                int DealerName = drd.GetOrdinal("DealerName");
                int CSID = drd.GetOrdinal("CSID");
                int SubscriberName = drd.GetOrdinal("SubscriberName");
                int ProveedorID = drd.GetOrdinal("ProveedorID");
                int ProvName = drd.GetOrdinal("ProvName");
                int PersonalID = drd.GetOrdinal("PersonalID");
                int Nombres = drd.GetOrdinal("Nombres");
                int Usuario = drd.GetOrdinal("Usuario");
                int TipoMantenimiento = drd.GetOrdinal("TipoMantenimiento");
                int Observaciones = drd.GetOrdinal("Observaciones");
                
                lbeReportes = new List<beReportes>();
                beReportes obeReportes;
                while (drd.Read())
                {
                    obeReportes = new beReportes();
                    obeReportes.Fecha_Registro = drd.GetString(Fecha_Registro);
                    obeReportes.ID_Ficha = drd.GetString(ID_Ficha);
                    obeReportes.Dealer = drd.GetString(Dealer);
                    obeReportes.DealerName = drd.GetString(DealerName);
                    obeReportes.CSID = drd.GetString(CSID);
                    obeReportes.SubscriberName = drd.GetString(SubscriberName);
                    obeReportes.ProveedorID = drd.GetString(ProveedorID);
                    obeReportes.ProvName = drd.GetString(ProvName);
                    obeReportes.PersonalID = drd.GetString(PersonalID);
                    obeReportes.Nombres = drd.GetString(Nombres);
                    obeReportes.Usuario = drd.GetString(Usuario);
                    obeReportes.TipoMantenimiento = drd.GetString(TipoMantenimiento);
                    obeReportes.Observaciones = drd.GetString(Observaciones);

                    lbeReportes.Add(obeReportes);
                }

                drd.Close();

            }
            return lbeReportes;
        }

        public List<beReportes> ListarReporte_xOficinaEntidad(SqlConnection con, string pfechad, string pfechah, string pCSID)
        {
            List<beReportes> lbeReportes = null;

            SqlCommand cmd = new SqlCommand("sp_WCT_listar_rep_xOficinaEntidad", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@fechad", SqlDbType.VarChar, 10);
            param1.Direction = ParameterDirection.Input;
            param1.Value = pfechad != "" ? DateTime.ParseExact(pfechad, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd") : "";

            SqlParameter param2 = cmd.Parameters.Add("@fechah", SqlDbType.VarChar, 10);
            param2.Direction = ParameterDirection.Input;
            param2.Value = pfechah != "" ? DateTime.ParseExact(pfechah, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd") : "";

            SqlParameter param3 = cmd.Parameters.Add("@CSID", SqlDbType.VarChar, 10);
            param3.Direction = ParameterDirection.Input;
            param3.Value = pCSID.ToUpper();

            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult);

            if (drd != null)
            {
                int Fecha_Registro = drd.GetOrdinal("Fecha_Registro");
                int ID_Ficha = drd.GetOrdinal("ID_Ficha");
                int Dealer = drd.GetOrdinal("Dealer");
                int DealerName = drd.GetOrdinal("DealerName");
                int CSID = drd.GetOrdinal("CSID");
                int SubscriberName = drd.GetOrdinal("SubscriberName");
                int ProveedorID = drd.GetOrdinal("ProveedorID");
                int ProvName = drd.GetOrdinal("ProvName");
                int PersonalID = drd.GetOrdinal("PersonalID");
                int Nombres = drd.GetOrdinal("Nombres");
                int Usuario = drd.GetOrdinal("Usuario");
                int TipoMantenimiento = drd.GetOrdinal("TipoMantenimiento");
                int Observaciones = drd.GetOrdinal("Observaciones");

                lbeReportes = new List<beReportes>();
                beReportes obeReportes;
                while (drd.Read())
                {
                    obeReportes = new beReportes();
                    obeReportes.Fecha_Registro = drd.GetString(Fecha_Registro);
                    obeReportes.ID_Ficha = drd.GetString(ID_Ficha);
                    obeReportes.Dealer = drd.GetString(Dealer);
                    obeReportes.DealerName = drd.GetString(DealerName);
                    obeReportes.CSID = drd.GetString(CSID);
                    obeReportes.SubscriberName = drd.GetString(SubscriberName);
                    obeReportes.ProveedorID = drd.GetString(ProveedorID);
                    obeReportes.ProvName = drd.GetString(ProvName);
                    obeReportes.PersonalID = drd.GetString(PersonalID);
                    obeReportes.Nombres = drd.GetString(Nombres);
                    obeReportes.Usuario = drd.GetString(Usuario);
                    obeReportes.TipoMantenimiento = drd.GetString(TipoMantenimiento);
                    obeReportes.Observaciones = drd.GetString(Observaciones);

                    lbeReportes.Add(obeReportes);
                }

                drd.Close();

            }
            return lbeReportes;
        }

        public List<beReportes> ListarReporte_HorasTrabxTecnico(SqlConnection con, string pfechad, string pfechah, string pProveedorID, string pPersonalID)
        {
            List<beReportes> lbeReportes = null;

            SqlCommand cmd = new SqlCommand("sp_WCT_listar_rep_HorasTrabajadasxTecnico", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@fechad", SqlDbType.VarChar, 10);
            param1.Direction = ParameterDirection.Input;
            param1.Value = pfechad != "" ? DateTime.ParseExact(pfechad, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd") : "";

            SqlParameter param2 = cmd.Parameters.Add("@fechah", SqlDbType.VarChar, 10);
            param2.Direction = ParameterDirection.Input;
            param2.Value = pfechah != "" ? DateTime.ParseExact(pfechah, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd") : "";

            SqlParameter param3 = cmd.Parameters.Add("@ProveedorID", SqlDbType.VarChar, 15);
            param3.Direction = ParameterDirection.Input;
            param3.Value = pProveedorID;

            SqlParameter param4 = cmd.Parameters.Add("@PersonalID", SqlDbType.VarChar, 15);
            param4.Direction = ParameterDirection.Input;
            param4.Value = pPersonalID;

            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult);

            if (drd != null)
            {
                int Fecha_Registro = drd.GetOrdinal("Fecha_Registro");
                int DealerName = drd.GetOrdinal("DealerName");
                int CSID = drd.GetOrdinal("CSID");
                int SubscriberName = drd.GetOrdinal("SubscriberName");
                int ProveedorID = drd.GetOrdinal("ProveedorID");
                int ProvName = drd.GetOrdinal("ProvName");
                int Nombres = drd.GetOrdinal("Nombres");
                int Hora_Ingreso = drd.GetOrdinal("Hora_Ingreso");
                int Hora_Salida = drd.GetOrdinal("Hora_Salida");
                int Horas = drd.GetOrdinal("Horas");
                int Minutos = drd.GetOrdinal("Minutos");
                
                lbeReportes = new List<beReportes>();
                beReportes obeReportes;
                while (drd.Read())
                {
                    obeReportes = new beReportes();
                    obeReportes.Fecha_Registro = drd.GetString(Fecha_Registro);
                    obeReportes.DealerName = drd.GetString(DealerName);
                    obeReportes.CSID = drd.GetString(CSID);
                    obeReportes.SubscriberName = drd.GetString(SubscriberName);
                    obeReportes.ProveedorID = drd.GetString(ProveedorID);
                    obeReportes.ProvName = drd.GetString(ProvName);
                    obeReportes.Nombres = drd.GetString(Nombres);
                    obeReportes.Hora_Ingreso = drd.GetString(Hora_Ingreso);
                    obeReportes.Hora_Salida = drd.GetString(Hora_Salida);
                    obeReportes.Horas = drd.GetString(Horas);
                    obeReportes.Minutos = drd.GetString(Minutos);

                    lbeReportes.Add(obeReportes);
                }

                drd.Close();

            }
            return lbeReportes;
        }

        public List<beReportes> ListarReporte_Estadistico_xTrabajoEntidad(SqlConnection con, string pfechad, string pfechah, string pProveedorID, string ptipo_mant)
        {
            List<beReportes> lbeReportes = null;

            SqlCommand cmd = new SqlCommand("sp_WCT_listar_repEstad_xTipoTrabajoEntidad", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@fechad", SqlDbType.VarChar, 10);
            param1.Direction = ParameterDirection.Input;
            param1.Value = pfechad != "" ? DateTime.ParseExact(pfechad, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd") : "";

            SqlParameter param2 = cmd.Parameters.Add("@fechah", SqlDbType.VarChar, 10);
            param2.Direction = ParameterDirection.Input;
            param2.Value = pfechah != "" ? DateTime.ParseExact(pfechah, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd") : "";

            SqlParameter param3 = cmd.Parameters.Add("@ProveedorID", SqlDbType.VarChar, 15);
            param3.Direction = ParameterDirection.Input;
            param3.Value = pProveedorID;

            SqlParameter param4 = cmd.Parameters.Add("@tipo_mant", SqlDbType.VarChar, 100);
            param4.Direction = ParameterDirection.Input;
            param4.Value = ptipo_mant.ToUpper();

            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult);

            if (drd != null)
            {
                int ProvName = drd.GetOrdinal("ProvName");
                int TipoMantenimiento = drd.GetOrdinal("TipoMantenimiento");
                int TxTman = drd.GetOrdinal("TxTman");
                int Total = drd.GetOrdinal("Total");
                int PORCENTAJE = drd.GetOrdinal("PORCENTAJE");

                lbeReportes = new List<beReportes>();
                beReportes obeReportes;
                while (drd.Read())
                {
                    obeReportes = new beReportes();
                    obeReportes.ProvName = drd.GetString(ProvName);
                    obeReportes.TipoMantenimiento = drd.GetString(TipoMantenimiento);
                    obeReportes.TxTman = drd.GetString(TxTman);
                    obeReportes.Total = drd.GetString(Total);
                    obeReportes.PORCENTAJE = drd.GetString(PORCENTAJE);

                    lbeReportes.Add(obeReportes);
                }

                drd.Close();

            }
            return lbeReportes;
        }

        public List<beReportes> ListarReporte_Estadistico_HorasTrabxTecnico(SqlConnection con, string pfechad, string pfechah, string pProveedorID, string pPersonalID)
        {
            List<beReportes> lbeReportes = null;

            SqlCommand cmd = new SqlCommand("sp_WCT_listar_repEstad_HorasTrabajadasxTecnico", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@fechad", SqlDbType.VarChar, 10);
            param1.Direction = ParameterDirection.Input;
            param1.Value = pfechad != "" ? DateTime.ParseExact(pfechad, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd") : "";

            SqlParameter param2 = cmd.Parameters.Add("@fechah", SqlDbType.VarChar, 10);
            param2.Direction = ParameterDirection.Input;
            param2.Value = pfechah != "" ? DateTime.ParseExact(pfechah, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd") : "";

            SqlParameter param3 = cmd.Parameters.Add("@ProveedorID", SqlDbType.VarChar, 15);
            param3.Direction = ParameterDirection.Input;
            param3.Value = pProveedorID;

            SqlParameter param4 = cmd.Parameters.Add("@PersonalID", SqlDbType.VarChar, 15);
            param4.Direction = ParameterDirection.Input;
            param4.Value = pPersonalID;

            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult);

            if (drd != null)
            {
                int ProvName = drd.GetOrdinal("ProvName");
                int Nombres = drd.GetOrdinal("Nombres");
                int Horas = drd.GetOrdinal("Horas");
                int Minutos = drd.GetOrdinal("Minutos");
                int PORCENTAJE = drd.GetOrdinal("PORCENTAJE");

                lbeReportes = new List<beReportes>();
                beReportes obeReportes;
                while (drd.Read())
                {
                    obeReportes = new beReportes();
                    obeReportes.ProvName = drd.GetString(ProvName);
                    obeReportes.Nombres = drd.GetString(Nombres);
                    obeReportes.Horas = drd.GetString(Horas);
                    obeReportes.Minutos = drd.GetString(Minutos);
                    obeReportes.PORCENTAJE = drd.GetString(PORCENTAJE);

                    lbeReportes.Add(obeReportes);
                }

                drd.Close();

            }
            return lbeReportes;
        }

        public List<beReportes> ListarReporte_Estadistico_SalidasNoReportadas(SqlConnection con, string pfechad, string pfechah, string pPersonalID)
        {
            List<beReportes> lbeReportes = null;

            SqlCommand cmd = new SqlCommand("sp_WCT_listar_repEstad_SalidasNoReportadas", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@fechad", SqlDbType.VarChar, 10);
            param1.Direction = ParameterDirection.Input;
            param1.Value = pfechad != "" ? DateTime.ParseExact(pfechad, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd") : "";

            SqlParameter param2 = cmd.Parameters.Add("@fechah", SqlDbType.VarChar, 10);
            param2.Direction = ParameterDirection.Input;
            param2.Value = pfechah != "" ? DateTime.ParseExact(pfechah, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd") : "";

            SqlParameter param3 = cmd.Parameters.Add("@PersonalID", SqlDbType.VarChar, 15);
            param3.Direction = ParameterDirection.Input;
            param3.Value = pPersonalID;

            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult);

            if (drd != null)
            {
                int ProvName = drd.GetOrdinal("ProvName");
                int Nombres = drd.GetOrdinal("Nombres");
                int TxTman = drd.GetOrdinal("TxTman");
                int Total = drd.GetOrdinal("Total");

                lbeReportes = new List<beReportes>();
                beReportes obeReportes;
                while (drd.Read())
                {
                    obeReportes = new beReportes();
                    obeReportes.ProvName = drd.GetString(ProvName);
                    obeReportes.Nombres = drd.GetString(Nombres);
                    obeReportes.TxTman = drd.GetString(TxTman);
                    obeReportes.Total = drd.GetString(Total);

                    lbeReportes.Add(obeReportes);
                }

                drd.Close();

            }
            return lbeReportes;
        }

        public List<beReportes> ListarReporte_Estadistico_RutaTrab(SqlConnection con, string pfechad, string pfechah, string pProveedorID, string pPersonalID, string pRuta_ID)
        {
            List<beReportes> lbeReportes = null;

            SqlCommand cmd = new SqlCommand("sp_WCT_listar_repEstad_RutaTrab", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = cmd.Parameters.Add("@fechad", SqlDbType.VarChar, 10);
            param1.Direction = ParameterDirection.Input;
            param1.Value = pfechad != "" ? DateTime.ParseExact(pfechad, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd") : "";

            SqlParameter param2 = cmd.Parameters.Add("@fechah", SqlDbType.VarChar, 10);
            param2.Direction = ParameterDirection.Input;
            param2.Value = pfechah != "" ? DateTime.ParseExact(pfechah, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd") : "";

            SqlParameter param3 = cmd.Parameters.Add("@ProveedorID", SqlDbType.VarChar, 15);
            param3.Direction = ParameterDirection.Input;
            param3.Value = pProveedorID;

            SqlParameter param4 = cmd.Parameters.Add("@PersonalID", SqlDbType.VarChar, 15);
            param4.Direction = ParameterDirection.Input;
            param4.Value = pPersonalID;

            SqlParameter param5 = cmd.Parameters.Add("@Ruta_ID", SqlDbType.VarChar, 10);
            param5.Direction = ParameterDirection.Input;
            param5.Value = pRuta_ID;

            SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult);

            if (drd != null)
            {
                int Ruta_Des = drd.GetOrdinal("Ruta_Des");
                int Total = drd.GetOrdinal("Total");
                int PORCENTAJE = drd.GetOrdinal("PORCENTAJE");

                lbeReportes = new List<beReportes>();
                beReportes obeReportes;
                while (drd.Read())
                {
                    obeReportes = new beReportes();
                    obeReportes.Ruta_Des = drd.GetString(Ruta_Des);
                    obeReportes.Total = drd.GetString(Total);
                    obeReportes.PORCENTAJE = drd.GetString(PORCENTAJE);

                    lbeReportes.Add(obeReportes);
                }

                drd.Close();

            }
            return lbeReportes;
        }
    }
}
