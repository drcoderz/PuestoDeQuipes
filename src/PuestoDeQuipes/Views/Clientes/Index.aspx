<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PuestoDeQuipes.Models.Entity.Cliente>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Clientes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%  Html.RenderPartial("Controls/ShowHideScript"); %>
    <h2>Clientes</h2>
    

    <table class="centerTable" cellspacing="0" cellpadding="0" >
        <tr>
            
            
            <th>
                Nombre
            </th>
            <th>
                Apellido
            </th>
            <th>
                Direccion
            </th>
            <th>
                Email
            </th>
            <th>
                Telefono
            </th>
            <th></th>
            <th></th>
        </tr>

    <% 
        var count = 0;
        foreach (var item in Model) { %>
    
       <tr <%: ((count++ % 2) == 0) ? "" : "class=alterRow"  %>>

            
            
            <td>
                <img src="../../Content/images/User.png" /><%: item.Nombre %>
            </td>
            <td>
                <%: item.Apellido %>
            </td>
            <td >
                <div class="hideOver"><%: item.Direccion %></div>
            </td>
            <td>
                <%: item.Email %>
            </td>
            <td>
                <%: String.Format(item.Telefono, "(###) ###-####" )%>
            </td>
            
            <td>
               
                <%= string.Format("<a title=\"{0}\" class=\"page\" href=\"{0}\"><img src='../Content/Images/{1}.png' alt='{1}' /></a>", Url.Action("Editar/" + item.ClienteId), "Editar")%>

            </td>
            <td>
                <%= string.Format("<a title=\"{0}\" class=\"page\" href=\"{0}\"><img src='../Content/Images/{1}.png' alt='{1}' /></a>", Url.Action("Borrar/" + item.ClienteId), "Borrar")%>

            </td>
        </tr>
    
    <% } %>

    </table>

    <%--<p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>--%>

</asp:Content>

