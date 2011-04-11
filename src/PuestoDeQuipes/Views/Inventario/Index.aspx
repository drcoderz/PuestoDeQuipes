<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PuestoDeQuipes.Models.Entity.Inventario>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Inventarios
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Inventarios</h2>

    <table class="centerTable" cellspacing="0" cellpadding="0" >
        <tr>
            
            <th>
                Nombre
            </th>
            <th>
                Cantidad Total
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
        foreach (var item in Model) { %>
    
        <tr  <%: ((count++ % 2) == 0) ? "" : "class=alterRow"  %>>
            
            
            <td>
                <%: item.Nombre %>
            </td>
            <td>
                <%: item.CantidadTotal %>
                <%: item.Unidad.Nombre %>
            </td>
            <td>
                 <%= string.Format("<a title=\"{0}\" class=\"page\" href=\"{0}\"><img src='../Content/Images/{1}.png' alt='{1}' /></a>", Url.Action("Editar/" + item.InventarioId), "Editar")%>
            </td>
            <td>
                <%= string.Format("<a title=\"{0}\" class=\"page\" href=\"{0}\"><img src='../Content/Images/{1}.png' alt='{1}' /></a>", Url.Action("Borrar/" + item.InventarioId), "Borrar")%>
            </td>
            <td>
                <% if (item.CantidadTotal < 50) { %>
                    <%= string.Format("<a title=\"{0}\" class=\"page\" href=\"{0}\"><img src='../Content/Images/{1}.png' alt='{1}' /></a>", Url.Action("ProcesoDeOrden/" + item.InventarioId), "Alert")%>
                <% } %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
    <%= string.Format("<a title=\"{0}\"  href=\"{0}\"><img src='../Content/Images/{1}.png' alt='{1}' /></a>", Url.Action("Crear"), "Crear")%>
        <%: Html.ActionLink("Crear Nuevo Articulo", "Crear") %>
    </p>

</asp:Content>

