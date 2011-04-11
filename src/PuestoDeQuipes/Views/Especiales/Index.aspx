<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PuestoDeQuipes.Models.Entity.Especial>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Ofertas
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%  Html.RenderPartial("Controls/ShowHideScript"); %>
    <h2>Ofertas</h2>
    <table class="centerTable" cellspacing="0" cellpadding="0" >
        <tr>
            
            
            <th>
                Nombre
            </th>
            <th>
                Descripcion
            </th>
            <th>
                FechaInicio
            </th>
            <th>
                FechaTermino
            </th>
            <th>
                Precio
            </th>
            <th>
                Producto
            </th>
            <th>
                
            </th>
            <th>
                
            </th>
            <th>
                
            </th>
            
        </tr>

    <%
        var count = 0;
        foreach (var item in Model)
       { %>
    
        <tr <%: ((count++ % 2) == 0) ? "" : "class=alterRow"  %>>
            
            
            <td>
                <%: item.Nombre%>
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
                <%: String.Format("{0:F}", item.Precio)%>
            </td>
            <td>
                <%: Html.ActionLink("Ver Producto", "Detalles", "Productos", new { id = item.ProductoProductoId }, null)%>
            </td>
            <td>
                
                <%= string.Format("<a title=\"{0}\" class=\"page\" href=\"{0}\"><img src='../Content/Images/{1}.png' alt='{1}' /></a>", Url.Action("Editar/" + item.EspecialId), "Editar")%>
            </td>
            <td>
                <%= string.Format("<a title=\"{0}\" class=\"page\" href=\"{0}\"><img src='../Content/Images/{1}.png' alt='{1}' /></a>", Url.Action("Detalles/" + item.EspecialId), "Detalle")%>

            </td>
            <td>
                <%= string.Format("<a title=\"{0}\" class=\"page\" href=\"{0}\"><img src='../Content/Images/{1}.png' alt='{1}' /></a>", Url.Action("Borrar/" + item.EspecialId), "Borrar")%>

            </td>
        </tr>
    
    <% } %>

    </table>
    <p>
        <%= string.Format("<a title=\"{0}\" class=\"page\" href=\"{0}\"><img src='../Content/Images/{1}.png' alt='{1}' /></a>", Url.Action("Crear"), "Crear")%>

        <%: Html.ActionLink("Añadir Especial", "Crear")%>
    </p>

</asp:Content>

