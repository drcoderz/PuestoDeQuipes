<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PuestoDeQuipes.Models.Entity.Especial>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Oferta de <%: Model.First().Producto.Nombre %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%  Html.RenderPartial("Controls/ShowHideScript"); %>
    <h2>Oferta de <%: Model.First().Producto.Nombre %></h2>

        <table class="centerTable" cellspacing="0" cellpadding="0" >

        <tr>
            <th>
                Nombre
            </th>
            <th>
                Descripcion
            </th>
            <th>
                Fecha Inicio
            </th>
            <th>
                Fecha Termino
            </th>
            <th>
                Precio
            </th>
            <th>
                Producto
            </th>
            <th></th>
            <th></th>
            <th></th>
        </tr>

    <%
      var count = 0;  
      foreach (var item in Model) { %>
    
        <tr <%: ((count++ % 2) == 0) ? "" : "class=alterRow"  %>>
            
            
            <td>
                <%: item.Nombre %>
            </td>
            <td>
                <div  class="hideOver">
                    <%: item.Descripcion %>
                </div>
            </td>
            <td>
                <%: item.FechaInicio.ToString("MM/dd/yyyy")%>
            </td>
            <td>
                <%: item.FechaTermino.ToString("MM/dd/yyyy")%>
            </td>
            <td>
                <%: item.Precio.ToString("c") %>
            </td>
            <td>
                 <%: Html.ActionLink( "Ver "+item.Producto.Nombre, "Detalles", "Productos", new { id = item.ProductoProductoId }, null)%>

            </td>
            <td>
                <%= string.Format("<a title=\"{0}\" class=\"page\" href=\"{0}\"><img src='../../Content/Images/{1}.png' alt='{1}' /></a>", Url.Action("EditarLista/" + item.EspecialId), "Editar")%>
            </td>
            <td>
                <%= string.Format("<a title=\"{0}\" class=\"page\" href=\"{0}\"><img src='../../Content/Images/{1}.png' alt='{1}' /></a>", Url.Action("DetallesLista/" + item.EspecialId), "Detalle")%>

            </td>
            <td>
                <%= string.Format("<a title=\"{0}\" class=\"page\" href=\"{0}\"><img src='../../Content/Images/{1}.png' alt='{1}' /></a>", Url.Action("BorrarLista/" + item.EspecialId), "Borrar")%>

            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%= string.Format("<a title=\"{0}\" class=\"page\" href=\"{0}\"><img src='../../Content/Images/{1}.png' alt='{1}' /></a>", Url.Action("CrearLista", new { id = Model.First().ProductoProductoId }), "Crear")%>

        <%: Html.ActionLink("Añadir Especial", "CrearLista", new { id = Model.First().ProductoProductoId })%>
    </p>

</asp:Content>

