
<%@ page import="delucas.Prestamo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'prestamo.label', default: 'Prestamo')}" />
        <title>Listado de Prestamos</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Principal</a></span>
        </div>
        <div class="body">
            <h1>Listado de Pr&eacute;stamos</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'prestamo.id.label', default: 'Id')}" />
                        
                            <th><g:message code="prestamo.libro.label" default="Libro" /></th>
                        
                            <g:sortableColumn property="socio" title="${message(code: 'prestamo.socio.label', default: 'Socio')}" />
                        
                            <g:sortableColumn property="fechaPrestamo" title="${message(code: 'prestamo.fechaPrestamo.label', default: 'Fecha Prestamo')}" />
                        
                            <g:sortableColumn property="fechaDevolucion" title="${message(code: 'prestamo.fechaDevolucion.label', default: 'Fecha Devolucion')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${prestamoInstanceList}" status="i" var="prestamoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${prestamoInstance.id}">${fieldValue(bean: prestamoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: prestamoInstance, field: "libro")}</td>
                        
                            <td>${fieldValue(bean: prestamoInstance, field: "socio")}</td>
                        
                            <td><g:formatDate format="yyyy-MM-dd" date="${prestamoInstance.fechaPrestamo}" /></td>
                        
                            <td>
                            
								<% if (! prestamoInstance?.fechaDevolucion) { %>
		                    
									<g:form>
										<g:hiddenField name="id" value="${prestamoInstance?.id}" />
										<span class="button"><g:actionSubmit class="create" action="devolver" value="Devolver" /></span>
									</g:form>
								
								<%} else {%>
                            
                            		<g:formatDate format="yyyy-MM-dd" date="${prestamoInstance.fechaDevolucion}" />
							
                        		<%} %>
                        		
                        	</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${prestamoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
