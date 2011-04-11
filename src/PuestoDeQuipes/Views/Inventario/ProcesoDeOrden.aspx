<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<PuestoDeQuipes.Models.Entity.Inventario>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ProcesoDeOrden
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Proceso De Orden</h2>

    <fieldset>
        <legend>Orden Procesada</legend>
        
        <div class="display-label">

        <div class="display-label">Cantidad Actual</div>
        <div class="display-field"><%: Model.CantidadTotal %></div>
        
        <div class="display-label">Cantidad Actualizada (despues del proceso de la orden)</div>
        <div class="display-field"><%: Model.CantidadTotal  + 100 %></div>

        <div class="display-label">Nombre del Articulo de Inventario</div>
        <div class="display-field"><%: Model.Nombre %></div>
        
        <div class="display-label">Unidad</div>
        <div class="display-field"><%: ViewData["unidad"] %></div>

        <div class="display-label">Orden procesada por Suplidora Quisqueyana</div>
        
    </fieldset>
    <p>

       <%: Html.ActionLink("Volver a la Lista", "Index") %>
    </p>

</asp:Content>

