<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<PuestoDeQuipes.Models.Entity.Orden>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Editar Ordenes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% Html.RenderPartial("Controls/jDatepicker"); %>
    <h2>Editar Ordenes</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Fields</legend>
            
           
                <%: Html.HiddenFor(model => model.OrdenId) %>
            
            
            <p class="input_block">
                <%: Html.LabelFor(model => model.Cantidad) %>
            
                <%: Html.TextBoxFor(model => model.Cantidad) %>
                <%: Html.ValidationMessageFor(model => model.Cantidad) %>
            </p>
            
            <p class="input_block">
                <%: Html.LabelFor(model => model.Ordenado) %>
            
                <%: Html.TextBoxFor(model => model.Ordenado, new { @class = "datepicker" })%>
                <%: Html.ValidationMessageFor(model => model.Ordenado) %>
            </p>
            
            

           <p class="input_block">
                <%: Html.HiddenFor(model => model.ClienteClienteId)%>
                <%: Html.LabelFor(model => model.Ordenado) %>
                <% 
                List<SelectListItem> allItems = new List<SelectListItem>();

                foreach (var unit in ViewData["Productos"] as IQueryable<PuestoDeQuipes.Models.Entity.Producto>)
                {
                    allItems.Add(new SelectListItem { Text = unit.Nombre, Value = Convert.ToString(unit.ProductoId) });
                }
                %>
           
                 <%: Html.DropDownListFor(model => model.ProductoProductoId, allItems) %>
           </p>
            <br />
            <br /><br /><br /><br /><br /><br />
            <p>
                <%: Html.ActionLink("Volver a la Lista", "Index",null, new { @class = "submitBtn" })%>
            </p>
            <p>
                <input class="submitBtn" type="submit" value="Guardar" />
            </p>
        </fieldset>

    <% } %>

    

</asp:Content>

