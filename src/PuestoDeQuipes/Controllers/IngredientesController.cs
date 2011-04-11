using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PuestoDeQuipes.Models.Concrete;
using PuestoDeQuipes.Models.Entity;

namespace PuestoDeQuipes.Controllers
{
    public class IngredientesController : Controller
    {

        DBRepository repository = DBRepository.Instance;
        //
        // GET: /Ingredientes/

        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// Lista de ingrediente en un producto
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Lista(int id)
        {
            ViewData["productoId"] = id;
            return View(repository.IngredientesParaProducto(id));
        }

        //
        // GET: /Ingredientes/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Ingredientes/Create

        public ActionResult Crear(int id)
        {
            ViewData["inventario"] = repository.Inventario;
            ViewData["productoId"] = id;
            ViewData["Unidades"] = repository.TodasLasUnidades();
            return View();
        } 

        //
        // POST: /Ingredientes/Create

        [HttpPost]
        public ActionResult Crear(FormCollection collection)
        {
            try
            {
                var model = new Ingrediente();
                TryUpdateModel(model, new string[] 
                    { 
                        "Cantidad", "ProductoProductoId", 
                        "UnidadUnidadId", "InventarioInventarioId" 
                    }, collection.ToValueProvider());

                repository.AddIngrediente( model );
                return RedirectToAction("Lista", new { id = Int32.Parse(collection["ProductoProductoId"]) } );
            }
            catch
            {
                return View();
            }
        }
        
        //
        // GET: /Ingredientes/Edit/5

        public ActionResult Editar(int id)
        {
            ViewData["inventario"] = repository.Inventario;

            var ingredienteModel = repository.Ingredientes.First(p => p.IngredienteId == id);

            ViewData["productoid"] = ingredienteModel.ProductoProductoId;

            ViewData["Unidades"] = repository.TodasLasUnidades();
            return View(ingredienteModel);
        }

        //
        // POST: /Productos/Edit/5

        [HttpPost]
        public ActionResult Editar(int id, FormCollection collection)
        {
            var model = repository.Ingredientes.First(p => p.IngredienteId == id);
            try
            {

                TryUpdateModel(model, new string[] { "Cantidad", "UnidadUnidadId", "InventarioInventarioId" }, collection.ToValueProvider());

                // Validadte

                if (String.IsNullOrEmpty(model.Cantidad.ToString()))
                    ModelState.AddModelError("Cantidad", "El Nombre es Requerido");

                if (ModelState.IsValid)
                {
                    repository.SaveDB();
                    return RedirectToAction("Lista/" + model.ProductoProductoId);
                }

            }
            catch
            {
                return View();
            }

            return View(model);
        }

        //
        // POST: /Ingredientes/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Ingredientes/Delete/5
 
        public ActionResult Borrar(int id)
        {
            var model = repository.Ingredientes.First(i => i.IngredienteId == id);
            if (model != null)
            {
                repository.BorrarModel(model);
            }
            return RedirectToAction("Lista", new { id = model.ProductoProductoId });
        }

        //
        // POST: /Ingredientes/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
