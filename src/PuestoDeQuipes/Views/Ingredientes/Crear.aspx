<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<PuestoDeQuipes.Models.Entity.Ingrediente>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Añadir ingrediente
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Añadir ingrediente</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            
            <%--<p class="input_block">
                <%: Html.LabelFor(model => model.IngredienteId) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.IngredienteId) %>
                <%: Html.ValidationMessageFor(model => model.IngredienteId) %>
            </div>--%>
            
            <p class="input_block">
                <%: Html.LabelFor(model => model.Cantidad) %>
            
                <%: Html.TextBoxFor(model => model.Cantidad) %>
                <%: Html.ValidationMessageFor(model => model.Cantidad) %>
            </p>
            
            
                <%: Html.Hidden("ProductoProductoId", ViewData["productoId"].ToString() ) %>
                <%: Html.ValidationMessageFor(model => model.ProductoProductoId) %>
            
            

            <p class="input_block">
                <%: Html.Label("Inventorio") %>
            
            <% 
                List<SelectListItem> allItems = new List<SelectListItem>();

                foreach (var unit in ViewData["inventario"] as IQueryable<PuestoDeQuipes.Models.Entity.Inventario>)
                {
                    allItems.Add(new SelectListItem { Text = unit.Nombre, Value = Convert.ToString(unit.InventarioId) });
                }
            %>

            
                <%: Html.DropDownListFor(model => model.InventarioInventarioId, allItems)%>
                <%: Html.ValidationMessageFor(model => model.InventarioInventarioId) %>
            </p>
            
            <p class="input_block">
                <%: Html.Label("Unidad") %>
            
                <%: Html.DropDownListFor(model => model.UnidadUnidadId, ViewData["Unidades"] as List<SelectListItem>)%>
                <%: Html.ValidationMessageFor(model => model.UnidadUnidadId) %>
            </p>
            <p>
                <%: Html.ActionLink("Volver a la lista", "Lista/" + ViewData["productoId"], null, new { @class = "submitBtn" })%>
            </p>
            <p>
                <input class="submitBtn" type="submit" value="Guardar" />
            </p>
        </fieldset>

    <% } %>

    

</asp:Content>

