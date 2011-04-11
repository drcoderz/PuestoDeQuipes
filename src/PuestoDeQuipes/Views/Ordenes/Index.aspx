<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PuestoDeQuipes.Models.Entity.Orden>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Ordenes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2>Ordenes</h2>

    <table class="centerTable" cellspacing="0" cellpadding="0" >

        <tr>
            <th>
                Cantidad
            </th>
            <th>
                Fecha de Orden
            </th>
            <th>
                Cliente
            </th>
            <th>
                Producto
            </th>
            <th></th>
            <th></th>
        </tr>

    <% 
        var count = 0;
        foreach (var item in Model) { %>
    
    <tr <%: ((count++ % 2) == 0) ? "" : "class=alterRow"  %>>

            
            <%--<td>
                <%: item.OrdenId %>
            </td>--%>
            <td>
                <%: item.Cantidad %>
            </td>
            <td>
                <%: item.Ordenado.ToString("MM/dd/yyyy")%>
            </td>
            <td>
                <%: Html.ActionLink("Ver Cliente", "Detalles", "Clientes", new { id = item.ClienteClienteId }, null) %>
            </td>
            <td>
                <%: Html.ActionLink("Ver Producto", "Detalles", "Productos", new { id = item.ProductoProductoId }, null) %>
            </td>

             <td>
               
                <%= string.Format("<a title=\"{0}\" class=\"page\" href=\"{0}\"><img src='../Content/Images/{1}.png' alt='{1}' /></a>", Url.Action("Editar/" + item.OrdenId), "Editar")%>

            </td>
            <td>
                <%= string.Format("<a title=\"{0}\" class=\"page\" href=\"{0}\"><img src='../Content/Images/{1}.png' alt='{1}' /></a>", Url.Action("Borrar/" + item.OrdenId), "Borrar")%>

            </td>
            
        </tr>
    
    <% } %>

    </table>

</asp:Content>

