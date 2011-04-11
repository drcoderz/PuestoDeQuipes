using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using SuplidoraQuisqueyanaService.DataContracts;

namespace SuplidoraQuisqueyanaService.ServiceContracts
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "ISuplidoraQuisqueyanaAPI" in both code and config file together.
    [ServiceContract]
    public interface ISuplidoraQuisqueyanaAPI
    {
        [OperationContract]
        void EnviarOrden(Orden ordenRecibida);

        [OperationContract]
        Factura OrdenCompletada();
    }
}
