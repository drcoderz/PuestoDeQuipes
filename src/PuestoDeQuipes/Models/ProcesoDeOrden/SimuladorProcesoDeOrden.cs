using System;
using PuestoDeQuipes.SuplidoraQuisqueyanaService;

namespace PuestoDeQuipes.Models.ProcesoDeOrden
{
    public class SimuladorProcesoDeOrden
    {
        private SuplidoraQuisqueyanaService.SuplidoraQuisqueyanaAPIClient proxy;
        private int CantidadArticuloRecibida;

        public SimuladorProcesoDeOrden()
        {
            proxy = new SuplidoraQuisqueyanaService.SuplidoraQuisqueyanaAPIClient();
            proxy.EnviarOrdenCompleted += new EventHandler<System.ComponentModel.AsyncCompletedEventArgs>(proxy_EnviarOrdenCompleted);
            proxy.OrdenCompletadaCompleted += new EventHandler<SuplidoraQuisqueyanaService.OrdenCompletadaCompletedEventArgs>(proxy_OrdenCompletadaCompleted);
        }

        public event EventHandler<OrdenProcesadaEventArgs> ProcesoDeOrdenCompleto;

        public void EnviarOrden(string numeroCuenta, string nombreCliente, string nombreArticulo, int cantidad, DateTime fechaOrden)
        {
            Orden ordenAEnviar = new Orden
            {
                NumeroDeCuenta = numeroCuenta,
                NombreDeCuenta = nombreCliente,
                NombreDeArticulo = nombreArticulo,
                CantidadOrdenada = cantidad,
                FechaDeOrden = fechaOrden
            };

            proxy.EnviarOrdenAsync(ordenAEnviar);
        }

        public void proxy_EnviarOrdenCompleted(object sender, System.ComponentModel.AsyncCompletedEventArgs e)
        {
            // la orden ha sido completada y enviada; pedir factura
            proxy.OrdenCompletadaAsync();
        }

        public void proxy_OrdenCompletadaCompleted(object sender, SuplidoraQuisqueyanaService.OrdenCompletadaCompletedEventArgs e)
        {
            // si no hubo errores y la factura fue recibida
            if (e.Result != null && e.Error == null)
            {
                Factura facturaRecibida = e.Result as Factura;

                // la cantidad por la cual se actualizara el articulo que fue ordenado a la suplidora
                CantidadArticuloRecibida = facturaRecibida.CantidadProveida;
            }

            if (ProcesoDeOrdenCompleto != null)
            {
                ProcesoDeOrdenCompleto(this, new OrdenProcesadaEventArgs(CantidadArticuloRecibida));
            }
        }
    }

}