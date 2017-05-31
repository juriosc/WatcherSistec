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
    public class daExportReportes
    {
        public DataTable ListarReporte_FichaPxT_Export(SqlConnection con, string pfechad, string pfechah, string pProveedorID, string pPersonalID, string ptipo_mant, string pCSID, string pExc_coment, string pEstado)
        {
            DataTable dt = null;

            SqlCommand cmd = new SqlCommand("sp_WCT_listar_rep_Fichas_PendientesxTecnico", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 0;

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
                dt = new DataTable();
                dt.Load(drd);
                dt.AcceptChanges();
                drd.Close();
            }
            return dt;
        }

        public DataTable ListarReporte_xTipoTrabajo_Export(SqlConnection con, string pfechad, string pfechah, string ptipo_mant)
        {
            DataTable dt = null;

            SqlCommand cmd = new SqlCommand("sp_WCT_listar_rep_xTipoTrabajo", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 0;

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
                dt = new DataTable();
                dt.Load(drd);
                dt.AcceptChanges();
                drd.Close();
            }
            return dt;
        }

        public DataTable ListarReporte_xOficinaEntidad_Export(SqlConnection con, string pfechad, string pfechah, string pCSID)
        {
            DataTable dt = null;

            SqlCommand cmd = new SqlCommand("sp_WCT_listar_rep_xOficinaEntidad", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 0;

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
                dt = new DataTable();
                dt.Load(drd);
                dt.AcceptChanges();
                drd.Close();
            }
            return dt;
        }

        public DataTable ListarReporte_HorasTrabxTecnico_Export(SqlConnection con, string pfechad, string pfechah, string pProveedorID, string pPersonalID)
        {
            DataTable dt = null;

            SqlCommand cmd = new SqlCommand("sp_WCT_listar_rep_HorasTrabajadasxTecnico", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 0;

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
                dt = new DataTable();
                dt.Load(drd);
                dt.AcceptChanges();
                drd.Close();
            }
            return dt;
        }

        public DataTable ListarReporte_Estadistico_xTrabajoEntidad_Export(SqlConnection con, string pfechad, string pfechah, string pProveedorID, string ptipo_mant)
        {
            DataTable dt = null;

            SqlCommand cmd = new SqlCommand("sp_WCT_listar_repEstad_xTipoTrabajoEntidad", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 0;

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
                dt = new DataTable();
                dt.Load(drd);
                dt.AcceptChanges();
                drd.Close();
            }
            return dt;
        }

        public DataTable ListarReporte_Estadistico_HorasTrabxTecnico_Export(SqlConnection con, string pfechad, string pfechah, string pProveedorID, string pPersonalID)
        {
            DataTable dt = null;

            SqlCommand cmd = new SqlCommand("sp_WCT_listar_repEstad_HorasTrabajadasxTecnico", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 0;

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
                dt = new DataTable();
                dt.Load(drd);
                dt.AcceptChanges();
                drd.Close();
            }
            return dt;
        }

        public DataTable ListarReporte_Estadistico_SalidasNoReportadas_Export(SqlConnection con, string pfechad, string pfechah, string pPersonalID)
        {
            DataTable dt = null;

            SqlCommand cmd = new SqlCommand("sp_WCT_listar_repEstad_SalidasNoReportadas", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 0;

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
                dt = new DataTable();
                dt.Load(drd);
                dt.AcceptChanges();
                drd.Close();
            }
            return dt;
        }

        public DataTable ListarReporte_Estadistico_RutaTrab_Export(SqlConnection con, string pfechad, string pfechah, string pProveedorID, string pPersonalID, string pRuta_ID)
        {
            DataTable dt = null;

            SqlCommand cmd = new SqlCommand("sp_WCT_listar_repEstad_RutaTrab", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 0;

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
                dt = new DataTable();
                dt.Load(drd);
                dt.AcceptChanges();
                drd.Close();
            }
            return dt;
        }
    }
}
