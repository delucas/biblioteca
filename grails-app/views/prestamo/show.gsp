
<%@ page import="delucas.Prestamo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'prestamo.label', default: 'Prestamo')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Principal</a></span>
            <span class="menuButton"><g:link class="list" action="list">Listado de Pr&eacute;stamos</g:link></span>
        </div>
        <div class="body">
            <h1>Pr&eacute;stamo</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="prestamo.libro.label" default="Libro" /></td>
                            
                            <td valign="top" class="value"><g:link controller="libro" action="show" id="${prestamoInstance?.libro?.id}">${prestamoInstance?.libro?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="prestamo.socio.label" default="Socio" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: prestamoInstance, field: "socio")}</td>
                            
                        </tr>
                    
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="prestamo.fechaPrestamo.label" default="Fecha Prestamo" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${prestamoInstance?.fechaPrestamo}" /></td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="prestamo.fechaDevolucion.label" default="Fecha Devolucion" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${prestamoInstance?.fechaDevolucion}" /></td>
                            
                        </tr>
                    
                    	<% if (! prestamoInstance?.fechaDevolucion) { %>
                    
                    	<tr class="prop">
                    		<td>&nbsp;</td>
                    		<td valign="top" class="value">
								<g:form>
									<g:hiddenField name="id" value="${prestamoInstance?.id}" />
									<span class="button"><g:actionSubmit class="create" action="devolver" value="Devolver" /></span>
								</g:form>
							</td>
                    	</tr>
						
						<%} %>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${prestamoInstance?.id}" />
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="Borrar" onclick="return confirm('Esta seguro de que desea eliminar el prestamo?');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
