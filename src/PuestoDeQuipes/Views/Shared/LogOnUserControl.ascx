<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    if (Request.IsAuthenticated) {
%>
        Bienvenidos <b><%: PuestoDeQuipes.Models.InMemoryUserStore.GetUser().Name%></b>!
        [ <%: Html.ActionLink("Salir", "LogOff", "Account") %> ]
<%
    }
    else {
%> 
        [ <%: Html.ActionLink("Entrar", "LogOn", "Account") %> ]
<%
    }
%>
