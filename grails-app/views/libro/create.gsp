

<%@ page import="delucas.Libro" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'libro.label', default: 'Libro')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Principal</a></span>
            <span class="menuButton"><g:link class="list" action="list">Listado de Libros</g:link></span>
            <span class="menuButton"><g:link class="search" action="advSearch">B&uacute;squeda de Libros</g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${libroInstance}">
            <div class="errors">
                <g:renderErrors bean="${libroInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="isbn"><g:message code="libro.isbn.label" default="Isbn" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: libroInstance, field: 'isbn', 'errors')}">
                                    <g:textField name="isbn" value="${libroInstance?.isbn}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="titulo"><g:message code="libro.titulo.label" default="Titulo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: libroInstance, field: 'titulo', 'errors')}">
                                    <g:textField name="titulo" value="${libroInstance?.titulo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="autores"><g:message code="libro.autores.label" default="Autores" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: libroInstance, field: 'autores', 'errors')}">
                                    <g:textField name="autores" value="${libroInstance?.autores}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="editorial"><g:message code="libro.editorial.label" default="Editorial" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: libroInstance, field: 'editorial', 'errors')}">
                                    <g:textField name="editorial" value="${libroInstance?.editorial}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="review"><g:message code="libro.review.label" default="Review" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: libroInstance, field: 'review', 'errors')}">
                                    <g:textField name="review" value="${libroInstance?.review}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="imageURL"><g:message code="libro.imageURL.label" default="Image URL" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: libroInstance, field: 'imageURL', 'errors')}">
                                    <g:textField name="imageURL" value="${libroInstance?.imageURL}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="amazonURL"><g:message code="libro.amazonURL.label" default="Amazon URL" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: libroInstance, field: 'amazonURL', 'errors')}">
                                    <g:textField name="amazonURL" value="${libroInstance?.amazonURL}" />
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
