<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Print.Master" Inherits="System.Web.Mvc.ViewPage<PuestoDeQuipes.Models.Entity.Especial>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Imprimir
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript">
    $(function () {
        $("#printOfertaImage").click(function () {
            window.print();
        });
    });

</script>
    <div class="imprimirWraper">
        <img id="ofertaBg" src="../../Content/images/oferta_bg2.jpg" />
        <div class="oferta">
        <div id="printOfertaImage"></div>
        <p>Aproveche nuestro </p>
        Especial!
        </div>
        <div id="contentWraper">
            <div class="ofertaInicial"><%: Model.Nombre %></div>

            <div class="ofertaInicial">A solo RD$ <%: String.Format("{0:F}", Model.Precio) %> !</div>

            <div class="ofertaDescripcion"><%: Model.Descripcion %></div>

            <div class="ofertaFecha">
                Esta oferta es valida desde: <%: String.Format("{0:g}", Model.FechaInicio.ToShortDateString()) %>
                hasta: 
                <%: String.Format("{0:g}", Model.FechaTermino.ToShortDateString()) %>
            </div>
            <div class="ofertaBackImage">
               <% = string.Format("<a style=\"color:White\" title=\"{0}\" class=\"ofertaBack\" href=\"{0}\">volver</a>", Url.Action("Detalles","Especiales", new{id = Model.EspecialId} ))%>
            </div>
            
        </div>
        </div>
</asp:Content>
