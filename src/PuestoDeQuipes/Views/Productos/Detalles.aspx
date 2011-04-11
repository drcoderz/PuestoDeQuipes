<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<PuestoDeQuipes.Models.Entity.Producto>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Detalles
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Detalles</h2>

    <fieldset>
        <legend>Fields</legend>
        
        <%--<div class="display-label">ProductoId</div>
        <div class="display-field"><%: Model.ProductoId %></div>--%>
        
        <div class="display-label">Nombre</div>
        <div class="display-field"><%: Model.Nombre %></div>
        
        <div class="display-label">Descripcion</div>
        <div class="display-field"><%: Model.Descripcion %></div>
        
        <div class="display-label">Precio</div>
        <div class="display-field"><%: Model.Precio %></div>
        
        <div class="display-label">Visible</div>
        <div class="display-field"><%: Model.Visible %></div>
        
    </fieldset>
    <p>

        <%: Html.ActionLink("Editar", "Editar", new { id=Model.ProductoId }) %> |
        <%: Html.ActionLink("Volver a la Lista", "Index") %>
    </p>

</asp:Content>

