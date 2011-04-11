using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PuestoDeQuipes.Models.Concrete;

namespace PuestoDeQuipes.Controllers
{
    public class ClientesController : Controller
    {
        DBRepository repository = DBRepository.Instance;
        //
        // GET: /Clientes/

        public ActionResult Index()
        {
            return View(repository.Clientes);
        }

        //
        // GET: /Clientes/Details/5

        public ActionResult Detalles(int id)
        {
            return View(repository.Clientes.Where(c => c.ClienteId == id).FirstOrDefault());
        }

        //
        // GET: /Clientes/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Clientes/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        
        //
        // GET: /Clientes/Edit/5
 
        public ActionResult Editar(int id)
        {
            return View(repository.Clientes.Where(c => c.ClienteId == id).FirstOrDefault());
        }

        //
        // POST: /Clientes/Edit/5

        [HttpPost]
        public ActionResult Editar(int id, FormCollection collection)
        {
            var model = repository.Clientes.First(p => p.ClienteId == id);
            try
            {

                TryUpdateModel(model, new string[] { "ClienteId", "Nombre", "Apellido", "Direccion", "Email", "Telefono" }, collection.ToValueProvider());

                // Validadte

                if (String.IsNullOrEmpty(model.Nombre.ToString()))
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
        // GET: /Clientes/Delete/5

        public ActionResult Borrar(int id)
        {
            var model = repository.Clientes.First(c => c.ClienteId == id);

            if (model != null)
            {
                repository.BorrarModel(model);
            }

            return RedirectToAction("Index");
        }
    }
}
