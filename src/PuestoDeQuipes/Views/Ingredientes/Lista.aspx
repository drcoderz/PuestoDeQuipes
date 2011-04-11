<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PuestoDeQuipes.Models.Entity.Ingrediente>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Lista de ingredientes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    

    <% if (Model.Count() <= 0)
       {%>
    <h2>No hay ningun ingrediente para este Producto</h2>
    <% }
       else
       { %>

    <h2>Lista de Ingredientes para <%: Model.First().Producto.Nombre/*item.IngredienteId*/ %></h2>
    <table class="centerTable" cellspacing="0" cellpadding="0" >

        <tr>
            
            <th>
                Cantida
            </th>
            <th>
                Lista de Ingredientes
            </th>
            <%--<th>
                ProductoProductoId
            </th>
            <th>
                Cantidad_Ingrediente_CInredientesId
            </th>
            <th>
                UnidadId
            </th>--%>
            <th></th>
            <th></th>
        </tr>

    <% 
        var count = 0;
           foreach (var item in Model)
       { %>
    
       <tr <%: ((count++ % 2) == 0) ? "" : "class=alterRow"  %>>

            
            <td>
                <%: item.Cantidad + " " + item.Unidad.Nombre %>
            </td>
            <td>
                <%: item.Inventario.Nombre /*item.IngredienteId*/ %>
            </td>
           
            <td>
               
                <%= string.Format("<a title=\"{0}\" class=\"page\" href=\"{0}\"><img src='../../Content/Images/{1}.png' alt='{1}' /></a>", Url.Action("Editar/" + item.IngredienteId), "Editar")%>

            </td>
            <td>
                <%= string.Format("<a title=\"{0}\" class=\"page\" href=\"{0}\"><img src='../../Content/Images/{1}.png' alt='{1}' /></a>", Url.Action("Borrar/" + item.IngredienteId), "Borrar")%>
                
            </td>
        </tr>
    <% } %>

    </table>
<% } //end of the else%>
    <p><%: Html.ActionLink("Volver al Producto", "Index", "Productos", null, new { @class = "submitBtn" })%>
    </p>
    <p>
        <%= string.Format("<a title=\"{0}\" class=\"page\" href=\"{0}\"><img src='../../Content/Images/{1}.png' alt='{1}' /></a>", Url.Action("Crear/"+ViewData["productoId"].ToString()), "Crear")%>
        <%: Html.ActionLink("Anadir Ingrediente", "Crear/" + ViewData["productoId"].ToString())%>
    
        <%--%: Html.ActionLink("Volver a Productos", "Index", "Productos") %>--%>
    </p>
</asp:Content>

