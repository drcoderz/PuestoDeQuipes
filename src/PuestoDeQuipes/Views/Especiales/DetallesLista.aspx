<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<PuestoDeQuipes.Models.Entity.Especial>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	DetallesLista
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>DetallesLista</h2>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">EspecialId</div>
        <div class="display-field"><%: Model.EspecialId %></div>
        
        <div class="display-label">Nombre</div>
        <div class="display-field"><%: Model.Nombre %></div>
        
        <div class="display-label">Descripcion</div>
        <div class="display-field"><%: Model.Descripcion %></div>
        
        <div class="display-label">FechaInicio</div>
        <div class="display-field"><%: String.Format("{0:g}", Model.FechaInicio) %></div>
        
        <div class="display-label">FechaTermino</div>
        <div class="display-field"><%: String.Format("{0:g}", Model.FechaTermino) %></div>
        
        <div class="display-label">Precio</div>
        <div class="display-field"><%: String.Format("{0:F}", Model.Precio) %></div>
        
        <div class="display-label">ProductoProductoId</div>
        <div class="display-field"><%: Model.ProductoProductoId %></div>
        
    </fieldset>
    <p>

        <%: Html.ActionLink("Edit", "Edit", new { id=Model.EspecialId }) %> |
        <%: Html.ActionLink("Volver a la Lista", "Lista", new { id = Model.Producto.ProductoId })%>
    </p>

</asp:Content>

