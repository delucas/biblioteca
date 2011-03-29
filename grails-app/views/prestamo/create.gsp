

<%@ page import="delucas.Prestamo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'prestamo.label', default: 'Prestamo')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Principal</a></span>
            <span class="menuButton"><g:link class="list" action="list">Listado de Pr&eacute;stamos</g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${prestamoInstance}">
            <div class="errors">
                <g:renderErrors bean="${prestamoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="libro">Libro</label>
                                </td>
                                <td valign="top" class="value">
                                    ${libroInstance?.titulo}
                                    <g:hiddenField name="idLibro" value="${libroInstance?.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="socio"><g:message code="prestamo.socio.label" default="Socio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: prestamoInstance, field: 'socio', 'errors')}">
                                    <g:textField name="socio" value="${prestamoInstance?.socio}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="Crear" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
