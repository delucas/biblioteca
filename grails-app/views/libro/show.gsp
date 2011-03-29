
<%@ page import="delucas.Libro" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'libro.label', default: 'Libro')}" />
        <title>Detalles del libro</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Principal</a></span>
            <span class="menuButton"><g:link class="list" action="list">Listado de Libros</g:link></span>
            <span class="menuButton"><g:link class="search" action="advSearch">B&uacute;squeda de Libros</g:link></span>
            <span class="menuButton"><g:link class="create" action="search">Nuevo Libro</g:link></span>
        </div>
        <div class="body">
            <h1>Detalles del libro</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
            
                <table>
                    <tbody>
                    
                    
                    	<tr>
                    		<td valign="middle">
                    		<g:if test="${libroInstance.imageURL}">
                    			<img src="${fieldValue(bean: libroInstance, field: "imageURL")}"/>
                    		</g:if>
                    			<br/>
                    			<a href="${fieldValue(bean: libroInstance, field: "amazonURL")}">Ver en Amazon.com</a>
                    			<br/><br/>
                    			
                    			<% if (prestamoInstance) { %>
									<g:link controller="prestamo" action="show" id="${prestamoInstance?.id}">Prestado a ${fieldValue(bean: prestamoInstance, field: "socio")}</g:link>
								<% } else { %>
								<g:form controller="prestamo">
				                    <g:hiddenField name="idLibro" value="${libroInstance?.id}" />
				                    <span class="button"><g:actionSubmit class="prestar" action="create" value="Prestar" /></span>
				                </g:form>
                    			
								<% } %>
                    		</td>
                    		
                    		<td>
                    			<h1>${fieldValue(bean: libroInstance, field: "titulo")}</h1>
                    			<hr/>
                    			<h2>${fieldValue(bean: libroInstance, field: "autores")}</h2>
                    			<h3>${fieldValue(bean: libroInstance, field: "editorial")}</h3>
                    			<h4>${fieldValue(bean: libroInstance, field: "isbn")}</h4>
                    			${libroInstance.review?.decodeHTML()}
                    		</td>
                    		
                    	</tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${libroInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="Editar" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="Borrar" onclick="return confirm('Esta seguro de que desea eliminar el libro?');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
