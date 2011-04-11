using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using SuplidoraQuisqueyanaService.ServiceContracts;
using SuplidoraQuisqueyanaService.DataContracts;

namespace SuplidoraQuisqueyanaService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "SuplidoraQuisqueyanaAPI" in code, svc and config file together.
    public class SuplidoraQuisqueyanaAPI : ISuplidoraQuisqueyanaAPI
    {
        private Orden orden;

        public void EnviarOrden(Orden ordenRecibida)
        {
            //simular procesamiento de orden
            orden = ordenRecibida;
        }

        public Factura OrdenCompletada()
        {
            return new Factura
            {
                NumeroDeFactura = Guid.NewGuid().ToString(),
                DetallesDeOrden = "Gracias por escoger Suplidora Quisqueyana como su proveedor de productos. Su orden ha sido procesada.",
                OrdenOriginal = orden,
                CantidadProveida = 100 // simulacion de la cantidad de articulos enviados al cliente, una vez la orden ya ha sido procesada y enviada
            };
        }
    }
}
