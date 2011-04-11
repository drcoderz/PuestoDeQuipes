<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<PuestoDeQuipes.Models.Entity.Cliente>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Detalles
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Detalles</h2>

    <fieldset>
        <legend>Informacion del Cliente</legend>
        
        <%--<div class="display-label">ClienteId</div>
        <div class="display-field"><%: Model.ClienteId %></div>--%>
        
        <div class="display-label">Nombre</div>
        <div class="display-field"><%: Model.Nombre %></div>
        
        <div class="display-label">Apellido</div>
        <div class="display-field"><%: Model.Apellido %></div>
        
        <div class="display-label">Direccion</div>
        <div class="display-field"><%: Model.Direccion %></div>
        
        <div class="display-label">Email</div>
        <div class="display-field"><%: Model.Email %></div>
        
        <div class="display-label">Telefono</div>
        <div class="display-field"><%: Model.Telefono %></div>
        
    </fieldset>
    <p>

        <%: Html.ActionLink("Editar", "Editar", new { id=Model.ClienteId }) %> |
        <%: Html.ActionLink("Volver a la lista", "Index") %>
    </p>

</asp:Content>

