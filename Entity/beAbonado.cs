using System;
using System.Collections.Generic;

namespace Entity
{
    public class beAbonado
    {
        public static List<beAbonado> FAbonado = new List<beAbonado>();
        public int ID_Ficha { get; set; }
        public string DealerCode { get; set; }
        public string CSID { get; set; }
        public string SubscriberName { get; set; }
        public string LocalID { get; set; }
        public string Observaciones { get; set; }

    }
}
