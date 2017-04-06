using System;
using System.Collections.Generic;

namespace Entity
{
    public class beFichaAbonado
    {
        public static List<beFichaAbonado> FAbonado = new List<beFichaAbonado>();
        public int ID_Ficha { get; set; }
        public string DealerCode { get; set; }
        public string CSID { get; set; }
        public string SubscriberName { get; set; }
        public string LocalID { get; set; }
        public string Observaciones { get; set; }

    }
}
