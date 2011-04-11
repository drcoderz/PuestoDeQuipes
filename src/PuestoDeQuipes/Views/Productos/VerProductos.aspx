<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MainPage.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PuestoDeQuipes.Models.Entity.Producto>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	VerProductos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Productos</h2>

    <% foreach (var item in Model.Where(i => i.Visible)) { %>
    
        <div class="productBlock">
            <div class="productImg">
            <img src="<%: item.ImagePath %>" alt="" />
            </div>
            <div class="productDescBlock">
                <div class="productTitle">
                    <%: item.Nombre %>
                </div>
                <div class="productDesc">
                    <%: item.Descripcion %>
                </div>
                <div class="productPrecio">
                    Precio (por docena): RD<%: item.Precio.ToString("C") %>
                </div>
                <div class="ordenarBtn">
                    <%= string.Format("<a title=\"{0}\"  href=\"{0}\"><img src='../Content/Images/{1}.png' alt='{1}' /></a>", Url.Action("Ordenes/OrdenarEnLinea/" + item.ProductoId).Replace("/Productos", ""), "ordenar")%>
                </div>
            </div>
        </div>
    
    <% } %>

</asp:Content>

