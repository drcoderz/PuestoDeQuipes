<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="PuestoDeQuipes.Models.Concrete" %>

<div id="mainHeader">
    <div id="logo"></div>

    <% 
        var repository = DBRepository.Instance;
        Html.RenderPartial("Controls/InventarioAlert", repository.Inventario.ToList()); 
    %>
    
    <div id="menuControl">
        <div id="left"></div>
        <div id="repeat">
            <ul id="navigation">
                <li class="navRow"><%: Html.ActionLink("Productos", "Index", "Productos") %></li>
                <li class="navRow"><%: Html.ActionLink("Clientes", "Index", "Clientes") %></li>
                <li class="navRow"><%: Html.ActionLink("Oferta", "Index", "Especiales") %></li>
                <li class="navRow"><%: Html.ActionLink("Ordenes", "Index", "Ordenes") %></li>
                <li class="navRow"><%: Html.ActionLink("Inventario", "Index", "Inventario")%></li>
            </ul>
        </div>
        <div id="right"></div>
    </div>
</div>

