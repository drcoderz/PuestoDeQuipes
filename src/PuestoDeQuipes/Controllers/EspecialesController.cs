using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Facebook;
using PuestoDeQuipes.Models;
using PuestoDeQuipes.Models.Concrete;
using PuestoDeQuipes.Models.Entity;

namespace PuestoDeQuipe.Controllers
{
    public class EspecialesController : Controller
    {
        DBRepository repository = DBRepository.Instance;

        public ActionResult Index()
        {
            
            return View(repository.Especiales);
        }
        //
        // GET: /Especials/Detalles/
        /// <summary>
        /// 
        /// </summary>
        /// <param name="productId">identificacion del producto</param>
        /// <returns>returna la lista de especiales</returns>
        public ActionResult Detalles(int id)
        {
            return View(repository.Especiales.First(e => e.EspecialId == id));
        }

        public ActionResult DetallesLista(int id)
        {
            return View(repository.Especiales.First(e => e.EspecialId == id));
        }

        public ActionResult EditarLista(int id)
        {
            ViewData["Productos"] = repository.Productos;
            ViewData["productoId"] = (ViewData["Productos"] as IQueryable<Producto>).First().ProductoId;
            return View(repository.Especiales.First(e => e.EspecialId == id));
        }

        [HttpPost]
        public ActionResult EditarLista(int id, FormCollection collection)
        {
            var model = repository.Especiales.First(e => e.EspecialId == id);
            try
            {
                TryUpdateModel(model,
                    new string[] { 
                        "Nombre", "Descripcion", "FechaInicio", "FechaTermino", 
                        "Precio", "ProductoProductoId" },
                    collection.ToValueProvider());

                repository.SaveDB();
                return RedirectToAction("Lista", new { id = model.Producto.ProductoId } );
            }
            catch
            {
                return View();
            }
        }

        public ActionResult Lista(int id)
        {
            return View(repository.Especiales.Where(e => e.ProductoProductoId == id));
        }


        public ActionResult CrearLista(int id)
        {
            ViewData["Productos"] = repository.Productos;
            ViewData["productoId"] = (ViewData["Productos"] as IQueryable<Producto>).First().ProductoId;
            ViewData["currentPID"] = id;
            return View();
        }


        [HttpPost]
        public ActionResult CrearLista(FormCollection collection)
        {
            try
            {
                var model = new Especial();
                TryUpdateModel(model, new string[]
                {
                    "Nombre", "Descripcion", "FechaInicio",
                    "FechaTermino", "Precio", "ProductoProductoId"
                }, collection.ToValueProvider());

                repository.AddEspecial(model);

                return RedirectToAction("Lista", new { id = model.Producto.ProductoId });
            }
            catch
            {
                return View();
            }
        }
        //
        // GET: /Especials/Create

        public ActionResult Crear()
        {
            ViewData["Productos"] = repository.Productos;
            return View();
        } 

        //
        // POST: /Especials/Create

        [HttpPost]
        public ActionResult Crear(FormCollection collection)
        {
            try
            {
                var model = new Especial();
                TryUpdateModel(model, new string[]
                {
                    "Nombre", "Descripcion", "FechaInicio",
                    "FechaTermino", "Precio", "ProductoProductoId"
                }, collection.ToValueProvider() );

                repository.AddEspecial(model);

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        
        //
        // GET: /Especials/Edit/5
 
        public ActionResult Editar(int id)
        {
            ViewData["Productos"] = repository.Productos;
            return View( repository.Especiales.First( e=>e.EspecialId == id) );
        }

        //
        // POST: /Especials/Edit/5

        [HttpPost]
        public ActionResult Editar(int id, FormCollection collection)
        {
            var model = repository.Especiales.First( e=>e.EspecialId == id);
            try
            {
                TryUpdateModel(model, 
                    new string[] { 
                        "Nombre", "Descripcion", "FechaInicio", "FechaTermino", 
                        "Precio", "ProductoProductoId" },
                    collection.ToValueProvider() );

                repository.SaveDB();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Especials/Delete/5
 
        public ActionResult BorrarDetalle(int id)
        {
            var model = repository.Especiales.First(e => e.EspecialId == id);
            var ProductId = model.ProductoProductoId;
            if (model != null)
            {
                repository.BorrarModel(model);
            }
            return RedirectToAction("Detalles", new { id = ProductId });
        }

        public ActionResult Borrar(int id)
        {
            var model = repository.Especiales.First(e => e.EspecialId == id);
            var ProductId = model.ProductoProductoId;
            if (model != null)
            {
                repository.BorrarModel(model);
            }
            return RedirectToAction("Index");
        }

        public ActionResult BorrarLista(int id)
        {
            var model = repository.Especiales.First(e => e.EspecialId == id);
            var ProductId = model.ProductoProductoId;
            if (model != null)
            {
                repository.BorrarModel(model);
                return RedirectToAction("Lista", new { id = ProductId });
            }
            return View();
        }

        public ActionResult Imprimir(int id)
        {
            var model = repository.Especiales.First(e => e.EspecialId == id);
            return View(model);
        }
        
        public ActionResult SendToFacebook(int id)
        {
            var model = repository.Especiales.First(e => e.EspecialId == id);
            try
            {
                var facebookId = User.Identity.Name;
                var user = InMemoryUserStore.Get(facebookId);
                var client = new FacebookClient(user.AccessToken);
                dynamic parameters = new ExpandoObject();
                parameters.message = string.Format("{0} esta oferta es valida desde {1} hasta {2}", model.Nombre, model.FechaInicio.ToShortDateString(), model.FechaTermino.ToShortDateString());
                //parameters.link = "http://www.youtube.com/watch?v=tko0vvD0N-E";
                //parameters.picture = "http://i3.ytimg.com/vi/2Me7BRES0wQ/default.jpg";
                parameters.name = model.Nombre;
                parameters.caption = model.Precio;
                parameters.description = model.Descripcion;

                dynamic result = client.Post(user.FacebookId + "/feed", parameters);
            }
            catch (Exception ex)
            {
                return RedirectToAction("Detalles", new {id = id});
            }

            return RedirectToAction("Detalles", new {id = id});
        }

    }
}
