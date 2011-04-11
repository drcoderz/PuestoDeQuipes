Nombre del Grupo: 		DRCODERZ
Desarrolladores:
Roman Jaquez			romanejaquez@gmail.com
Vladimir Heredia		vheredia04@gmail.com
James Liranzo			jliranz@yahoo.com

Resumen General
La empresa PuestoDeQuipe.com esta buscando la manera de eficientizar sus pedidos, actualmente ellos esperan que un producto se le acabe y luego llaman por teléfono a Suplidora Quisqueyana para realizar una orden. El proceso actual tiene como consecuencia perdidas significativas ya que si se le acaba la materia prima no pueden vender su producto.
La empresa Suplidora Quisqueyana tiene actualmente un API a través del cual se pueden realizar pedidos y los mismos son entregados a mas tardar el próximo día calendario al cliente. Pero PuestoDeQuipe.com no lo esta usando actualmente.
La empresa PuestoDeQuipe.com no tiene oficinas adecuadas donde almacenar servidores, ni personal para darle mantenimiento a los mismos. Ellos venden sus productos a los clientes a través de una pagina web que tienen hosteada en un servidor compartido. 
Actualmente su pagina web esta compuesta por paginas estáticas de HTML donde muestran un listado fijo de sus productos (Quipes, Empanadas, Croquetas, Pastelitos & Churros). Para realizar ordenes los clientes mandan un email, describiendo la orden, la cual es recibida y procesada por la encargada de ventas.
El pedido es enviado en un motor con un mensajero, el recibe el dinero en efectivo y lo deposita en la cuenta bancaria de la empresa.
Doña Tatica (la dueña de la empresa) se esta retirando del negocio y le ha dejado la administración del mismo a sus hijos, quienes vienen de una generación mucho mas moderna, donde las redes sociales (facebook, twitter, etc.) predominan el día a día. Sus hijos son Francisco (CEO) y Jose (PegaBlock).


Proyecto en fisico / Solucion / Archivos:

El proyecto de PuestoDeQuipes.com fue desarrollado en ASP.NET MVC2, usando una base de datos alojada en el shared hosting de DRCoderz.com para mejor manejo y acceso de los datos que alimentan el sistema y el website de PuestoDeQuipes.com.
Se utilizo una base de datos en SQL Server 2008 en un servidor  de Windows, usando el Entity Framework. Utilizamos WCF para crear y similar el servicio y API ofrecido por la Suplidora Quisqueyana para colocar ordenes de productos, etc.
El SQL script, el backup de la base de datos y la solucion en si han sido proveidos a traves de GitHub (cuenta de GitHub => usuario: drcoderz@gmail.com, pwd: jmlkiller11). El path para hacerle un fork es:
https://drcoderz@github.com/drcoderz/PuestoDeQuipes.git
Se creo una cuenta de Facebook para poder publicar las ofertas, usando el API de Facebook para proveer el login al sistema.
La solucion esta compuesta por dos proyectos: 
La solucion de Visual Studio 2010 como un ASP.NET MVC WebSite:

  
Si se desea conectar a la base de datos a traves de Visual Studio 2010, seguir los siguientes pasos:
En Server Explorer, Añadir una Coneccion al seleccionar “Add Connection”.
 
Minutas del Proyecto:
1)	Se rediseño el website de PuestoDeQuipes.com de un website estatico a un website alimentado por una base de datos para mejor mantenimiento y actualizacion.  Esta pagina se puede accede al ejecutar la solucion proveida, llamada PuestoDeQuipes.

 
2)	A traves del website, se pueden ver los productos que estan almacenados en la base de datos y a traves de esta misma pagina, los clientes o usuarios pueden realizar sus pedidos u ordenes.
 
3)	Despues de realizar la orden, una confirmacion se le presentara al cliente dependiendo de que si la orden fue completada con exito.  Desafortunadamente  la implementacion de validacion en los campos del formulario de orden no fueron completados en esta version del website, asi que los campos deben de ser llenados correctamente. 
SECCION DE ADMINISTRACION

1)	Para poder acceder a la seccion de Administracion, poder imprimir, enviar mensajes a Facebook, y funciones propias de un administrador, se debe acceder a traves del login proveido en la parte de arriba izquierda de la pagina, que dice [Entrar].

 
La autenticacion se hace a traves de los servidores de Facebook, la cual retorna un token de autorizacion con la informacion de login del usuario, con el cual el admin se puede conectar a la seccion de Admin de PuestoDeQuipes.com.

El nombre de usuario es drcoderz@gmail.com y el password es Drquipe00.
La cuenta en Facebook se llama DrQuipe Quipe.

 
A traves del website admin de PuestoDeQuipes.com se pueden desempeñar las siguientes funciones:
VER LOS PRODUCTOS: Se muestran los 4 productos principales de PuestoDeQuipes.com: quipes, croquetas, empanadas y churros.
Se pueden ver los detalles  de los mismos, editar, y añadir nuevos productos.
 
VER LOS CLIENTES: Se muestra la lista completa con los clientes que han colocado ordenes a traves del website, y esta informacion se almacena en la base de datos.
 
VER LAS OFERTAS: Las ofertas creadas por un usuario admin son almacenadas para reuso, actualizacion y publicacion en las redes sociales e impresion.
 
VER LAS ORDENES: Se muestra el estado de las ordenes, las ordenes colocadas a traves del website para ser ejecutadas, sin necesidad de hacer
input manual ya que son introducidas a traves del website por los mismos usuarios.
 
VER LOS INGREDIENTES QUE USA CADA PRODUCTO: Se pueden apreciar los ingredientes que tiene cada producto, asi se mantiene cuentas de los articulos
que se utilizan para elaborar los productos, llevar mejor cuenta de inventario, etc.
 
Cuando un ingrediente en el inventario se esta acabando, notifica al usuario admin de que este articulo en particular esta bajo en suplido, asi que induce al usuario a colocar una orden para abastecer este articulo.
 
WCF SERVICE DE SUPLIDORAQUISQUEYANA:
NOTA: El WCF Service de la Suplidora Quisqueyana esta siendo simulado por un servicio corriendo bajo la misma solucion, el proyecto llamado SuplidoraQuisqueyanaService, exponiendo el servicio llamado SuplidoraQuisqueyanaAPI.svc. Este servicio expone dos operaciones:

EnviarOrden: recibe una orden enviada desde el admin site de PuestoDeQuipes.com. La orden es procesada y almacenada.
OrdenCompletada:  envia una Factura con la informacion de la orden del cliente, numero de facture y detalles de la orden.
 
PROCESO DE LA ORDEN al hacer click en el icono de “alerta” en el articulo del inventario que esta bajo en cantidad: Cuando un articulo esta 
"bajo" en cantidad, se mostrara un icono de alerta, alertando al usuario de que debe colocar una orden de este articulo a la Suplidora Quisqueyana.
 
CREACION DE OFERTAS / IMPRESION DE OFERTAS / PUBLICACION DE OFERTAS

Las ofertas seran creadas por el usuario admin que obtenga acceso al sistema. Una vez creada la oferta , esta se puede editar, imprimir o publicar en las redes sociales como Facebook.
 
Al hacer click a “Imprimir”, esta accion abre una pagina la cual permite al usuario imprimir la oferta como un “flyer” o volante. 
