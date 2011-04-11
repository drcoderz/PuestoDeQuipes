<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PuestoDeQuipes.Models.Entity.Producto>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Productos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%  Html.RenderPartial("Controls/ShowHideScript"); %>
    <h2>Productos</h2>
    
    <table class="centerTable" cellspacing="0" cellpadding="0" >
        <tr>
            <th>
                Nombre
            </th>
            <th>
                Descripcion
            </th>
            <th>
                Precio
            </th>
            <th>
                Visible
            </th>
            <th>
                Incredientes
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
        foreach (var item in Model) { 
            
           %>
    
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
                <%: item.Precio %>
            </td>
            <td>
                <%: Html.CheckBox( "Visible", item.Visible) %>
            </td>
            <td>
                <%: Html.ActionLink("Ingrediente", "Lista", "Ingredientes", new { id = item.ProductoId }, null)%>
            </td>
            
            <td>
            <% if (item.Especiales.Count() > 0)
               { %>
               
                <%= string.Format("<a title=\"{0}\" class=\"page\" href=\"{0}\"><img src='../Content/Images/{1}.png' alt='{1}' /></a>", Url.Action("Lista", "Especiales", new { id = item.ProductoId }), "Oferta")%>
                <%}
               else
               {
               %>
                   <%= string.Format("<p><img src='../Content/Images/{0}.png' alt='{0}' /></p>", "OfertaDisabled")%><%
               } %>
            </td>
            <td>
                <%= string.Format("<a title=\"{0}\" class=\"page\" href=\"{0}\"><img src='../Content/Images/{1}.png' alt='{1}' /></a>", Url.Action("Editar/" + item.ProductoId), "Editar")%>
            </td>

            <td class="imageBlock" >
               
                
                <%= string.Format("<a title=\"{0}\" class=\"page\" href=\"{0}\"><img src='../Content/Images/{1}.png' alt='{1}' /></a>", Url.Action("Borrar/" + item.ProductoId), "Borrar")%>


            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        
        <%= string.Format("<a title=\"{0}\" class=\"page\" href=\"{0}\"><img src='../Content/Images/{1}.png' alt='{1}' /></a>", Url.Action("Crear"), "Crear")%>
        <%: Html.ActionLink("Crear un Producto", "Crear")%>
    </p>

</asp:Content>

