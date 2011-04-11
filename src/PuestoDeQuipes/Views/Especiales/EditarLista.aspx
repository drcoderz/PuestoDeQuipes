<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<PuestoDeQuipes.Models.Entity.Especial>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Editar Oferta
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" language="javascript">
        $(function () {
            $(".datepicker").datepicker();


        });
	</script>
    <h2>Editar Oferta</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            
            <p class="input_block">
                <%: Html.LabelFor(model => model.Nombre) %>
            
                <%: Html.TextBoxFor(model => model.Nombre) %>
                <%: Html.ValidationMessageFor(model => model.Nombre) %>
            </p>
            
            
            
            <p class="input_block">
                <%: Html.Label("Fecha de inicio") %>
            
                <%: Html.TextBoxFor(model => model.FechaInicio, new { @class = "datepicker" })%>
                <%: Html.ValidationMessageFor(model => model.FechaInicio) %>
            </p>
            
            <p class="input_block">
                <%: Html.Label("Fecha de termino") %>
            
                <%: Html.TextBoxFor(model => model.FechaTermino, new { @class = "datepicker" })%>
                <%: Html.ValidationMessageFor(model => model.FechaTermino) %>
            </p>
            
            <p class="input_block">
                <%: Html.LabelFor(model => model.Precio) %>
            
                <%: Html.TextBoxFor(model => model.Precio) %>
                <%: Html.ValidationMessageFor(model => model.Precio) %>
            </p>

            <p class="input_block">
                <label>Selecionar Productos</label>
            
            <% 
                List<SelectListItem> allItems = new List<SelectListItem>();

                foreach (var unit in ViewData["Productos"] as IQueryable<PuestoDeQuipes.Models.Entity.Producto>)
                {
                    allItems.Add(new SelectListItem { Text = unit.Nombre, Value = Convert.ToString(unit.ProductoId) });
                }
            %>
           
                 <%: Html.DropDownListFor(model => model.ProductoProductoId, allItems) %>
                <%: Html.ValidationMessageFor(model => model.ProductoProductoId)%>
            </p>

            
            <p class="textarea_block">
            <%: Html.LabelFor(model => model.Descripcion) %>
                <%: Html.TextAreaFor(model => model.Descripcion, new { rows = 15 })%>
                <%: Html.ValidationMessageFor(model => model.Descripcion) %>
            </p>
            
            <p>
                 <%: Html.ActionLink("Volver a la lista", "Lista", new { id = ViewData["productoId"] }, new { @class = "submitBtn" })%>
            </p>

            <p>
                <input class="submitBtn" type="submit" value="Guardar" />
            </p>
        </fieldset>

    <% } %>


</asp:Content>

