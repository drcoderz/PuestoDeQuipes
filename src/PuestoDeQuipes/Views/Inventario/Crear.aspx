<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<PuestoDeQuipes.Models.Entity.Inventario>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Crear Articulo
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Crear Articulo</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <p class="input_block">
                <%: Html.LabelFor(model => model.Nombre) %>
            
                <%: Html.TextBoxFor(model => model.Nombre) %>
                <%: Html.ValidationMessageFor(model => model.Nombre) %>
            </p>
            <p class="input_block">
                <label>Cantidad Total</label>
            
                <%: Html.TextBoxFor(model => model.CantidadTotal) %>
                <%: Html.ValidationMessageFor(model => model.CantidadTotal) %>
            </p>
            
            
            <p class="input_block">
                 <%: Html.Label("Unidad") %>
                <%: Html.DropDownListFor(model => model.Unidad.Nombre, (ViewData["ListaDeUnidades"] as List<SelectListItem>))%>
               
            </p>
            <p>
                <%: Html.ActionLink("Volver a la lista", "Index", null, new { @class = "submitBtn" })%>
            </p>
            <p>
                <input class="submitBtn" type="submit" value="Crear" />
            </p>
        </fieldset>

    <% } %>

    

</asp:Content>

