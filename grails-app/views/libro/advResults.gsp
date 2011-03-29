
<%@ page import="delucas.Libro" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'libro.label', default: 'Libro')}" />
        <title>Resultado de la b&uacute;squeda</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Principal</a></span>
            <span class="menuButton"><g:link class="create" action="search">Nuevo Libro</g:link></span>
            <span class="menuButton"><g:link class="list" action="list">Listado de Libros</g:link></span>
            <span class="menuButton"><g:link class="search" action="advSearch">B&uacute;squeda de Libros</g:link></span>
        </div>
        <div class="body">
            <h1>Resultado de la b&uacute;squeda</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'libro.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="isbn" title="${message(code: 'libro.isbn.label', default: 'Isbn')}" />
                        
                            <g:sortableColumn property="titulo" title="${message(code: 'libro.titulo.label', default: 'Titulo')}" />
                        
                            <g:sortableColumn property="autores" title="${message(code: 'libro.autores.label', default: 'Autores')}" />
                        
                            <g:sortableColumn property="editorial" title="${message(code: 'libro.editorial.label', default: 'Editorial')}" />
                                           
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${libroInstanceList}" status="i" var="libroInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${libroInstance.id}">${fieldValue(bean: libroInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: libroInstance, field: "isbn")}</td>
                        
                            <td>${fieldValue(bean: libroInstance, field: "titulo")}</td>
                        
                            <td>${fieldValue(bean: libroInstance, field: "autores")}</td>
                        
                            <td>${fieldValue(bean: libroInstance, field: "editorial")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${libroInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
