<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<PuestoDeQuipes.Models.Entity.Cliente>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Editar Cliente
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Editar Cliente</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            
            
            
            <p class="input_block">
                <%: Html.LabelFor(model => model.Nombre) %>
            
                <%: Html.TextBoxFor(model => model.Nombre) %>
                <%: Html.ValidationMessageFor(model => model.Nombre) %>
            </p>
            <p class="input_block">
                <%: Html.LabelFor(model => model.Apellido) %>
            
                <%: Html.TextBoxFor(model => model.Apellido)%>
                <%: Html.ValidationMessageFor(model => model.Apellido) %>
            </p>
           
            
            <p class="input_block">
                <%: Html.LabelFor(model => model.Email) %>
            
                <%: Html.TextBoxFor(model => model.Email) %>
                <%: Html.ValidationMessageFor(model => model.Email) %>
            </p>
            
            <p class="input_block">
                <%: Html.LabelFor(model => model.Telefono) %>
            
                <%: Html.TextBoxFor(model => model.Telefono) %>
                <%: Html.ValidationMessageFor(model => model.Telefono) %>
            </p>
             <p class="textarea_block">
                <%: Html.LabelFor(model => model.Direccion) %>
            
                <%: Html.TextAreaFor(model => model.Direccion, new { rows = 15 })%>
                <%: Html.ValidationMessageFor(model => model.Direccion) %>
            </p>
            
            <%: Html.HiddenFor(model => model.ClienteId) %>
           
            <p>
                <%: Html.ActionLink("Volver a la lista", "Index", null, new { @class = "submitBtn" })%>
            </p>
            <p>
                <input type="submit" class="submitBtn" value="Guardar" />
            </p>
        </fieldset>

    <% } %>

    

</asp:Content>

