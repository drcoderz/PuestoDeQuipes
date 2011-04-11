<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PuestoDeQuipes.Models.Entity.Inventario>>" %>

<div id="inventarioAlert">
<%
    var ingredientesParaOrdenar = Model.Where(i => i.CantidadTotal < 50).Count();

    if (ingredientesParaOrdenar > 0)
    {
     %>
     <div id="alertImg"></div>
     <div id="alertMsg"><%: Html.ActionLink("Alerta:" + ingredientesParaOrdenar + " ingrediente(s) para ordenar.", "Index", "Inventario" ) %></div>
     <% 
    }
 %>
 </div>  

