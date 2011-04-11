using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;

namespace SuplidoraQuisqueyanaService.DataContracts
{
    [DataContract]
    public class Orden
    {
        [DataMember]
        public string NumeroDeCuenta { get; set; }

        [DataMember]
        public string NombreDeCuenta { get; set; }

        [DataMember]
        public string NombreDeArticulo { get; set; }

        [DataMember]
        public int CantidadOrdenada { get; set; }

        [DataMember]
        public DateTime FechaDeOrden { get; set; }
    }
}