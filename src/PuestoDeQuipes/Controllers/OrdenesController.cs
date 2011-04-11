using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PuestoDeQuipes.Models.Concrete;
using PuestoDeQuipes.Models.Entity;

namespace PuestoDeQuipes.Controllers
{
    public class OrdenesController : Controller
    {

        DBRepository repository = DBRepository.Instance;
        //
        // GET: /Orden/

        public ActionResult Index()
        {
            return View(repository.Ordenes);
        }

        ////
        //// GET: /Orden/Create

        //public ActionResult Create()
        //{
        //    return View();
        //} 

        ////
        //// POST: /Orden/Create

        //[HttpPost]
        //public ActionResult Create(FormCollection collection)
        //{
        //    try
        //    {
        //        // TODO: Add insert logic here

                 
        //    }
        //    catch
        //    {
        //        return View();
        //    }
        //}
        
        //
        // GET: /Orden/Edit/5
 
        public ActionResult Editar(int id)
        {
            ViewData["productos"] = repository.Productos;
            return View(repository.Ordenes.Where(o => o.OrdenId == id).FirstOrDefault());
        }

        //
        // POST: /Orden/Edit/5

        [HttpPost]
        public ActionResult Editar(int id, FormCollection collection)
        {
            var model = repository.Ordenes.First(o => o.OrdenId == id);
            try
            {

                TryUpdateModel(model, new string[] { "OrdenId", "Cantidad", "Ordenado", "ClienteClienteId", "Producto_ProductoId" }, collection.ToValueProvider());

                // Validadte

                if (String.IsNullOrEmpty(model.Cantidad.ToString()))
                    ModelState.AddModelError("Cantidad", "La Cantidad es Requerido");

                if (String.IsNullOrEmpty(model.Ordenado.ToString()))
                    ModelState.AddModelError("Ordenado", "La Fecha no es valida");
                
            }
            catch
            {
                return View();
            }

            return RedirectToAction("Index");
        }

        //
        // GET: /Orden/Delete/5
 
        public ActionResult Borrar(int id)
        {
            var model = repository.Ordenes.First(o => o.OrdenId == id);
            if (model != null)
            {
                repository.BorrarModel(model);
            }

            return RedirectToAction("Index");
        }

        public ActionResult OrdenarEnLinea(int id)
        {
            var producto = repository.Productos.Where(p => p.ProductoId == id).FirstOrDefault();
            ViewData["selectedProduct"] = producto;

            var newOrder = new Orden();
            newOrder.Ordenado = DateTime.Today;
            //newOrder.Cliente = new Cliente();  { Nombre = "", Apellido = "", Direccion = "", Email = "", Telefono = "" };
            newOrder.Producto = producto;

            return View(newOrder);
        }

        [HttpPost]
        public ActionResult OrdenarEnLinea(FormCollection collection)
        {
            var email = collection["Cliente.Email"].ToString();
            ViewData["finished"] = true;
            Cliente clienteModel = new Cliente();

            if (repository.Clientes.Where(p => p.Email == email).Any())
            {
                clienteModel = repository.Clientes.Where(p => p.Email == email).First();
            }

            var createdOrder = new Orden();

            if (clienteModel.ClienteId != 0)
            {
                try
                {
                    createdOrder.ClienteClienteId = clienteModel.ClienteId;
                    createdOrder.ProductoProductoId = Convert.ToInt32(collection["Producto.ProductoId"].ToString());

                    //TryUpdateModel(createdOrder, new string[] { "Cantidad", "Ordenado" }, collection.ToValueProvider());

                    createdOrder.Cantidad = Convert.ToInt32(collection["Cantidad"].ToString());
                    createdOrder.Ordenado = DateTime.Parse(collection["Ordenado"].ToString());

                    // Validate

                    if (String.IsNullOrEmpty(clienteModel.Nombre.ToString()))
                        ModelState.AddModelError("Nombre", "El Nombre es Requerido");

                    repository.GuardarOrden(createdOrder);

                    if (ModelState.IsValid)
                    {
                        repository.SaveDB();
                        return RedirectToAction("Index");
                    }

                }
                catch
                {
                    return View();
                }
            }
            else
            {
                try
                {
                    clienteModel.Nombre = collection["Cliente.Nombre"].ToString();
                    clienteModel.Apellido = collection["Cliente.Apellido"].ToString();
                    clienteModel.Direccion = collection["Cliente.Direccion"].ToString();
                    clienteModel.Email = collection["Cliente.Email"].ToString();
                    clienteModel.Telefono = collection["Cliente.Telefono"].ToString();

                    repository.SaveClient(clienteModel);

                    createdOrder.ClienteClienteId = repository.Clientes.Where(c => c.Email == clienteModel.Email).First().ClienteId;
                    createdOrder.ProductoProductoId = Convert.ToInt32(collection["Producto.ProductoId"].ToString());


                    //TryUpdateModel(createdOrder, new string[] { "Cantidad", "Ordenado" }, collection.ToValueProvider());

                    createdOrder.Cantidad = Convert.ToInt32(collection["Cantidad"].ToString());
                    createdOrder.Ordenado = DateTime.Parse(collection["Ordenado"].ToString());
                    
                    repository.GuardarOrden(createdOrder);
                }
                catch
                {

                }
            }

            return View("OrdenFinalizada");
        }

        public ActionResult OrdenFinalizada()
        {
            return View();
        }

    }
}
