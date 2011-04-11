using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PuestoDeQuipes.Models.Concrete;

namespace PuestoDeQuipes.Controllers
{
    public class InventarioController : Controller
    {

        private DBRepository repository = DBRepository.Instance;
        //
        // GET: /Inventorio/

        public ActionResult Index()
        {
            return View(repository.Inventario);
        }

        //
        // GET: /Inventorio/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Inventorio/Create

        public ActionResult Crear()
        {
            ViewData["ListaDeUnidades"] = repository.TodasLasUnidades();
            return View();
        } 

        //
        // POST: /Inventorio/Create

        [HttpPost]
        public ActionResult Crear(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
                repository.AddInventory(collection["Nombre"].ToString(), 
                    Convert.ToInt32(collection["CantidadTotal"].ToString()), 
                    Convert.ToInt32(collection["Unidad.Nombre"].ToString()));

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        
        //
        // GET: /Inventorio/Edit/5

        public ActionResult Editar(int id)
        {
            ViewData["ListaDeUnidades"] = repository.TodasLasUnidades();
            return View(repository.Inventario.First( i=>i.InventarioId == id ) );
        }

        //
        // POST: /Inventorio/Edit/5

        [HttpPost]
        public ActionResult Editar(int id, FormCollection collection)
        {
            var model = repository.Inventario.First(p => p.InventarioId == id);
            try
            {
                TryUpdateModel(model, new string[] { "CantidadTotal", "Nombre", "UnidadUnidadId" }, collection.ToValueProvider());

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
        // GET: /Inventorio/Delete/5
 
        public ActionResult Borrar(int id)
        {
            return View();
        }

        //
        // POST: /Inventorio/Delete/5

        [HttpPost]
        public ActionResult Borrar(int id, FormCollection collection)
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

        public ActionResult ProcesoDeOrden(int id)
        {
            var articuloDeInventario = repository.Inventario.Where(i => i.InventarioId == id).First();

            ViewData["unidad"] = articuloDeInventario.Unidad.Nombre;
            repository.ProcesarOrden(articuloDeInventario);

            return View(articuloDeInventario);
        }
    }
}
