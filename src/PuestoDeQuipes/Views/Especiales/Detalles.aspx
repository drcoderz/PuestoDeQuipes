<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<PuestoDeQuipes.Models.Entity.Especial>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Detalles de Oferta
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Detalles de Oferta</h2>

    <fieldset>
        
        <div class="display-label">Nombre</div>
        <div class="display-field"><%: Model.Nombre %></div>
        
        <div class="display-label">Descripcion</div>
        <div class="display-field"><%: Model.Descripcion %></div>
        
        <div class="display-label">Fecha Inicio</div>
        <div class="display-field"><%: Model.FechaInicio.ToShortDateString() %></div>
        
        <div class="display-label">Fecha Termino</div>
        <div class="display-field"><%: Model.FechaTermino.ToShortDateString() %></div>
        
        <div class="display-label">Precio</div>
        <div class="display-field"><%: String.Format("{0:F}", Model.Precio) %></div>
        
        <p>
        <%: Html.ActionLink("Volver a la Lista", "Index", null, new { @class = "submitBtn" })%>
    </p>
    
    <p>
        <%: Html.ActionLink("Imprimir", "Imprimir", new { id = Model.EspecialId }, new { @class = "submitBtn" })%>
        
        <%: Html.ActionLink("Subir a Facebook", "SendToFacebook", new { id = Model.EspecialId }, new { @class = "submitBtn" })%>
        <%= string.Format("<a title=\"{0}\" href=\"{0}\"><img src='../../Content/Images/{1}.png' alt='{1}' /></a>", Url.Action("SendToFacebook", new{id=Model.EspecialId}), "facebook_32")%>
       
     </p>
    
    </fieldset>
    
    
</asp:Content>

