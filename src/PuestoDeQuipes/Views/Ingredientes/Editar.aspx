<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<PuestoDeQuipes.Models.Entity.Ingrediente>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Editar Ingrediente
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Editar Ingrediente</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            
           
                <%: Html.HiddenFor(model => model.IngredienteId) %>
            
            
            <p class="input_block">
                <%: Html.LabelFor(model => model.Cantidad) %>
            
                <%: Html.TextBoxFor(model => model.Cantidad) %>
                <%: Html.ValidationMessageFor(model => model.Cantidad) %>
            </p>
            
            
                <%: Html.HiddenFor(model => model.ProductoProductoId) %>
            
            
             <% 
                //var visible = new List<SelectListItem>{
                //    new SelectListItem{ Text = "No", Value = false.ToString()},
                //    new SelectListItem{ Text = "Si", Value = true.ToString()}
                //};

                List<SelectListItem> allItems = new List<SelectListItem>();

                foreach (var unit in ViewData["inventario"] as IQueryable<PuestoDeQuipes.Models.Entity.Inventario>)
                {
                    allItems.Add(new SelectListItem { Text = unit.Nombre, Value = Convert.ToString(unit.InventarioId) });
                }
            %>
            <p class="input_block">
            <%: Html.Label("Inventario")%>

                <%: Html.DropDownListFor(model => model.InventarioInventarioId, allItems) %>
                <%: Html.ValidationMessageFor(model => model.InventarioInventarioId)%>
            </p>
            
            <p class="input_block">
                <%: Html.Label("Unidades") %>
            
                <%: Html.DropDownListFor(model => model.UnidadUnidadId, ViewData["Unidades"] as List<SelectListItem>)%>
                <%: Html.ValidationMessageFor(model => model.UnidadUnidadId)%>
            </p>
             <p>
                <%: Html.ActionLink("Volver a la lista", "Lista/" + ViewData["productoid"], null, new { @class = "submitBtn" })%>
            </p>
            <p>
                <input class="submitBtn" type="submit" value="Guardar" />
            </p>
        </fieldset>

    <% } %>

   

</asp:Content>

