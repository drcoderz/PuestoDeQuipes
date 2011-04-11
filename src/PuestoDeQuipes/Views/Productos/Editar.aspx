<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<PuestoDeQuipes.Models.Entity.Producto>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Editar Producto
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Editar Producto</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <p class="input_block">
                <%: Html.LabelFor(model => model.Nombre) %>
            
                <%: Html.TextBoxFor(model => model.Nombre) %>
                <%: Html.ValidationMessageFor(model => model.Nombre) %>
            </p>
            
            
            
            <p class="input_block">
                <%: Html.LabelFor(model => model.Precio) %>
            
                <%: Html.TextBoxFor(model => model.Precio) %>
                <%: Html.ValidationMessageFor(model => model.Precio) %>
            </p>
            
            <p class="input_block">
                <%: Html.LabelFor(model => model.Visible) %>
            
            <% 
                var visible = new List<SelectListItem>{
                    new SelectListItem{ Text = "No", Value = false.ToString()},
                    new SelectListItem{ Text = "Si", Value = true.ToString()}
                };
            %>
                <%: Html.DropDownListFor(model =>model.Visible, (visible as List<SelectListItem>) ) %>
                <%: Html.ValidationMessageFor(model => model.Visible) %>
            </p>

            <p class="textarea_block">
                <%: Html.LabelFor(model => model.Descripcion) %>
            
                <%: Html.TextAreaFor(model => model.Descripcion, new { rows = 15 })%>
                <%: Html.ValidationMessageFor(model => model.Descripcion) %>
            </p>
            <p>
        
                 <%: Html.ActionLink("Volver a la lista", "Index", null, new { @class = "submitBtn" })%>
            </p>
            <p>
                <input class="submitBtn" type="submit" value="Guardar" />
            </p>
        </fieldset>

    <% } %>

</asp:Content>

