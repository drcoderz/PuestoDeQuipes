<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="PuestoDeQuipes.Models.Concrete" %>

<div id="mainHeader">
    <div id="logo"></div>

    <div id="menuControl">
        <div id="left"></div>
        <div id="repeat">
            <ul id="navigation">
                <li class="navRow"><%: Html.ActionLink("Inicio", "Index", "Home") %></li>
                <li class="navRow"><%: Html.ActionLink("Productos", "VerProductos", "Productos")%></li>
                <%--<li class="navRow"><%= string.Format("<a href=\"{0}\">{1}</a>", Url.Action("Ordenes/OrdenarEnLinea/-1").Replace("/Productos", ""), "Ordenar en Línea") %></li>--%>
            </ul>
        </div>
        <div id="right"></div>
    </div>
</div>

