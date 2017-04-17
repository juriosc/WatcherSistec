namespace Entity
{
    public class beAtenciones
    {
       public int ID_Ficha { get; set; }
	    public int ID_Atencion { get; set; }
        public string CSID { get; set; }
	    public string Usuario { get; set; }
	    public string Nombres { get; set; }
	    public string Fecha_Inicio { get; set; }
	    public string Fecha_Termino  { get; set; }
	    public string Estado_Inicio  { get; set; }
	    public string Estado_Termino { get; set; }
	    public string b_ALT { get; set; }
	    public string b_BB { get; set; }
	    public string b_FAC { get; set; }
	    public string b_RED { get; set; }
	    public string b_ACL { get; set; }
	    public string b_AA { get; set; }
        public string Observaciones { get; set; }
	    public int AlarmHistoryID_Inicial { get; set; }
        public int AlarmHistoryID_Final { get; set; }
    }
}
