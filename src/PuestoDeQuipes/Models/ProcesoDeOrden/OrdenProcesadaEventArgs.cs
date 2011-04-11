using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PuestoDeQuipes.Models.ProcesoDeOrden
{
    // informacion adjunta al evento que completa el proceso de la orden
    public class OrdenProcesadaEventArgs : EventArgs
    {
        public OrdenProcesadaEventArgs(int cantidadArticuloProveida)
        {
            Cantidad = cantidadArticuloProveida;
        }

        public int Cantidad { get; set; }
    }
}