<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MainPage.Master" Inherits="System.Web.Mvc.ViewPage<PuestoDeQuipes.Models.Entity.Orden>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Ordenar En Línea
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% Html.RenderPartial("Controls/jDatepicker"); %>
    <h2>Ordenar En Línea</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            
            <% 
                var selectedProduct = ViewData["selectedProduct"] as PuestoDeQuipes.Models.Entity.Producto;
                if (selectedProduct != null)
                {  
            %>

            <h3 class="input_block">
               Producto Seleccionado: <%: selectedProduct.Nombre %>
            </h3>

            <%
              }                   
            %>

            <!-- populate product info -->
            
                <%: Html.HiddenFor(model => model.Producto.ProductoId) %>
            

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
                <%: Html.LabelFor(model => model.Cliente.Nombre) %>
            
                <%: Html.TextBoxFor(model => model.Cliente.Nombre) %>
                <%: Html.ValidationMessageFor(model => model.Cliente.Nombre)%>
            </p>

            <p class="input_block">
                <%: Html.LabelFor(model => model.Cliente.Apellido) %>
            
                <%: Html.TextBoxFor(model => model.Cliente.Apellido)%>
                <%: Html.ValidationMessageFor(model => model.Cliente.Apellido)%>
            </p>

            <p class="input_block">
                <%: Html.LabelFor(model => model.Cliente.Direccion) %>
            
                <%: Html.TextBoxFor(model => model.Cliente.Direccion)%>
                <%: Html.ValidationMessageFor(model => model.Cliente.Direccion)%>
            </p>

            <p class="input_block">
                <%: Html.LabelFor(model => model.Cliente.Email) %>
            
                <%: Html.TextBoxFor(model => model.Cliente.Email)%>
                <%: Html.ValidationMessageFor(model => model.Cliente.Email)%>
            </p>

            <p class="input_block">
                <%: Html.LabelFor(model => model.Cliente.Telefono) %>
            
                <%: Html.TextBoxFor(model => model.Cliente.Telefono)%>
                <%: Html.ValidationMessageFor(model => model.Cliente.Telefono)%>
            </p>

            <label id="thankyou" style="Display:none">Thank you for your order!</label>
            <p  class="input_block"></p>
            <p  class="input_block"></p>
            <p  class="input_block"></p>
            <p  class="input_block"></p>
            <p  class="input_block"></p>
            <p  class="input_block"></p>
            <p>
                <input class="submitBtn" id="submit" type="submit" value="Crear Orden" />
            </p>

        </fieldset>

        

    <% } %>

</asp:Content>

