using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;

namespace SuplidoraQuisqueyanaService.DataContracts
{
    [DataContract]
    public class Factura
    {
        [DataMember]
        public string NumeroDeFactura { get; set; }

        [DataMember]
        public string DetallesDeOrden { get; set; }

        [DataMember]
        public Orden OrdenOriginal { get; set; }

        [DataMember]
        public int CantidadProveida { get; set; }
    }
}