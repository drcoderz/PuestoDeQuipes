using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PuestoDeQuipes.Models.Concrete;
using PuestoDeQuipes.Models.Entity;

namespace PuestoDeQuipes.Controllers
{
    public class ProductosController : Controller
    {
        private DBRepository repository = DBRepository.Instance;
        //
        // GET: /Productos/

        public ActionResult Index()
        {
            return View(repository.Productos);
        }

        //
        // GET: /Productos/Details/5

        public ActionResult Detalles(int id)
        {
            return View(repository.Productos.Where(p => p.ProductoId == id).FirstOrDefault());
        }

        //
        // GET: /Productos/Create

        public ActionResult Crear()
        {
            return View();
        } 

        //
        // POST: /Productos/Create
        /// <summary>
        /// 
        /// </summary>
        /// <param name="collection"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Crear(FormCollection collection)
        {

            if (ModelState.IsValid)
            {
                var model = new Producto();
                TryUpdateModel(model, new string[]
                {
                    "Nombre", "Descripcion", "ImagePath",
                    "Visible", "Precio"
                }, collection.ToValueProvider());

                repository.AddProducto(model);

                return RedirectToAction("Index");
            }
            else
            {
                // Error
                ModelState.AddModelError("", "Error goes here");
            }

            return View();
            
        }
        
        //
        // GET: /Productos/Edit/5
 
        public ActionResult Editar(int id)
        {
            return View( repository.Productos.First( p => p.ProductoId == id) );
        }

        //
        // POST: /Productos/Edit/5

        [HttpPost]
        public ActionResult Editar(int id, FormCollection collection)
        {
            var model = repository.Productos.First(p=>p.ProductoId == id);
            try
            {
                
                TryUpdateModel(model, new string[] { "Nombre", "Descripcion", "Precio", "Visible" }, collection.ToValueProvider() );
 
                // Validadte

                if (String.IsNullOrEmpty(model.Nombre))
                    ModelState.AddModelError("Nombre", "El Nombre es Requerido");

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

            return View(model);
        }

        //
        // GET: /Productos/Delete/5
        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Borrar(int id)
        {
            var model = repository.Productos.First(m => m.ProductoId == id);
            if (model != null)
            {
                if (model.Ingredientes.Count > 0)
                {
                    var ingredienteList = model.Ingredientes.ToList();
                    var count = ingredienteList.Count;

                    for (int i = 0; i < count; i++)
                    {
                        repository.BorrarModel(ingredienteList[i]);
                    }

                }

                repository.BorrarModel(model);
            }
            return RedirectToAction("Index");
        }

        // mostrar productos en el website principal
        public ActionResult VerProductos()
        {
            return View(repository.Productos);
        }

        //
        // POST: /Productos/Delete/5

        //[HttpPost]
        //public ActionResult Delete(int id, FormCollection collection)
        //{
        //    try
        //    {
        //        // TODO: Add delete logic here
        //        repository.DeleteProducto(id);
        //        return RedirectToAction("Index");
        //    }
        //    catch
        //    {
        //        return View();
        //    }
        //}
    }
}
