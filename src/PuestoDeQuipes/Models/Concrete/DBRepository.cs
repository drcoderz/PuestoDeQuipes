using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PuestoDeQuipes.Models.Abstract;
using PuestoDeQuipes.Models.Entity;
using System.Web.Mvc;
using PuestoDeQuipes.Models.ProcesoDeOrden;

namespace PuestoDeQuipes.Models.Concrete
{
    public class DBRepository : IDBRepository
    {
        // singleton instance variable
        private static DBRepository instance;
        // Entity data model instance
        private EntityDataModelContainer entity = new EntityDataModelContainer();

        private SimuladorProcesoDeOrden procesoDeOrden = new SimuladorProcesoDeOrden();

        public event EventHandler OrdenCompletaEvent;

        // private constructor
        private DBRepository()
        {
            procesoDeOrden.ProcesoDeOrdenCompleto += new EventHandler<OrdenProcesadaEventArgs>(procesoDeOrden_ProcesoDeOrdenCompleto);
        }

        public static DBRepository Instance
        {
            get
            {
                // if Multithreaded implement the double-check locking 
                if (instance == null)
                {
                    instance = new DBRepository();// returns new instance
                }
                return instance;
            }
        }

        // **************************************
        // Seccion de Especiales
        // **************************************
        #region Especiales
        public IQueryable<Especial> Especiales
        {
            get { return entity.Especiales.AsQueryable(); }
        }


        internal void AddEspecial(Especial model)
        {
            entity.AddToEspeciales(model);
            entity.SaveChanges();
        }
        #endregion

        // **************************************
        // Seccion de productos
        // **************************************
        #region Productos
        /// <summary>
        /// 
        /// </summary>
        public IQueryable<Producto> Productos
        {
            get { return entity.Productos.AsQueryable(); }
        }

        public IQueryable<Producto> GetProductos()
        {
            return Productos.Where( p => p.Visible == true).AsQueryable();
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="nombre"></param>
        /// <param name="descripcion"></param>
        /// <param name="precio"></param>
        /// <param name="espcial"></param>
        /// <param name="visible"></param>
        public void AddProducto(string nombre, string descripcion, int precio, bool visible)
        {
            var model = new Producto { 
                Nombre = nombre, 
                Descripcion = descripcion, 
                Precio = precio, 
                Visible = visible };

            entity.AddToProductos(model);
            entity.SaveChanges();
        }

        internal void AddProducto(Producto model)
        {
            entity.AddToProductos(model);
            entity.SaveChanges();
        }

        #endregion


        // **************************************
        // Seccion de Ingredientes
        // **************************************
        #region Ingredientes
        /// <summary>
        /// 
        /// </summary>
        public IQueryable<Ingrediente> Ingredientes
        {
            get{ return entity.Ingredientes.AsQueryable(); }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="productId"></param>
        /// <returns></returns>
        public IQueryable<Ingrediente> IngredientesParaProducto(int productId)
        {
            return Ingredientes.Where(i => i.ProductoProductoId == productId).AsQueryable();
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="model"></param>
        public void AddIngrediente(Ingrediente model)
        {
            entity.AddToIngredientes(model);
            SaveDB();
        }
        
        #endregion


        // **************************************
        // Seccion de Inventario
        // **************************************
        #region Inventario
        /// <summary>
        /// Retorna el inventario completo
        /// </summary>
        public IQueryable<Inventario> Inventario
        {
            get { return entity.Inventarios.AsQueryable(); }
        }

        /// <summary>
        /// Anade articulos al inventario
        /// </summary>
        /// <param name="nombre"></param>
        /// <param name="cantidadTotal"></param>
        /// <param name="unidadId"></param>
        public void AddInventory(string nombre, int cantidadTotal, int unidadId)
        {
            var model = new Inventario { Nombre = nombre, CantidadTotal = cantidadTotal, UnidadUnidadId = unidadId };

            entity.AddToInventarios(model);
            entity.SaveChanges();
        }
        #endregion
        /// <summary>
        /// 
        /// </summary>
        /// <returns>Returna una lista de unidades</returns>
        public List<SelectListItem> TodasLasUnidades()
        {
            var allItems = new List<SelectListItem>();

            foreach (var unit in entity.Unidades)
            {
                allItems.Add(new SelectListItem { Text = unit.Nombre, Value = unit.UnidadId.ToString() });
            }

            return allItems;
        }

        public IQueryable<Unidad> Unidades
        {
            get { return entity.Unidades; }
        }

        public void BorrarModel(object model)
        {
            entity.DeleteObject(model);
            entity.SaveChanges();
        }


        /// <summary>
        /// 
        /// </summary>
        public void SaveDB()
        {
            entity.SaveChanges();
        }

        // **************************************
        // Seccion de Ordenes
        // **************************************

        public IQueryable<Orden> Ordenes
        {
            get { return entity.Ordenes.AsQueryable(); }
        }

        public void GuardarOrden(Orden orden)
        {
            var product = Productos.Where(p => p.ProductoId == orden.ProductoProductoId).FirstOrDefault();
            var ingredientes = product.Ingredientes;
            var docenas = orden.Cantidad;

            foreach(var ingredient in ingredientes)
            {
                var totalInventario = ingredient.Cantidad*docenas;
                ingredient.Inventario.CantidadTotal -= totalInventario;
            }

            entity.AddToOrdenes(orden);
            entity.SaveChanges();
        }


        private Inventario ArticuloDeInventarioCorriente;

        public void ProcesarOrden(Inventario articuloDeInventario)
        {
            // procesar la orden del articulo 
            ArticuloDeInventarioCorriente = articuloDeInventario;

            var numeroDeCuenta = Guid.NewGuid().ToString();
            var nombreDeCliente = "PuestoDeQuipes.Com";
            var nombreArticulo = articuloDeInventario.Nombre;
            var cantidad = articuloDeInventario.CantidadTotal;
            var fechaDeOrden = DateTime.Today;

            procesoDeOrden.EnviarOrden(numeroDeCuenta, nombreDeCliente, nombreArticulo, cantidad, fechaDeOrden);
        }

        // cuando el proceso de la orden ha sido completado, actualizar el inventario corriente
        private void procesoDeOrden_ProcesoDeOrdenCompleto(object sender, OrdenProcesadaEventArgs e)
        {
            // actualizar el articulo de la db 
            ArticuloDeInventarioCorriente.CantidadTotal += e.Cantidad;
        }

        // **************************************
        // Seccion de Clientes
        // **************************************

        public IQueryable<Cliente> Clientes
        {
            get { return entity.Clientes.AsQueryable(); }
        }

        //
        public void SaveClient(Cliente clienteObject)
        {
            entity.AddToClientes(clienteObject);
            entity.SaveChanges();
        }
    }
}