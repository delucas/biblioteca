<html>
    <head>
        <title>Nuevo Libro</title>
        <meta name="layout" content="main"/>
    </head>
    <body>

        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Principal</a></span>
			<span class="menuButton"><g:link class="create" action="search">Nuevo Libro</g:link></span>
            <span class="menuButton"><g:link class="list" action="list">Listado de Libros</g:link></span>
        </div>

		<div class="body">
			<h1>B&uacute;squeda de Libros</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            
	        <formset>
	            <legend>Introduzca los datos del Libro</legend>
	
	            <g:form action="advResults">
	            
	            
		            <table>
					   <tr class="prop">
		                   <td valign="top" class="name">
		                       <label for="titulo"><g:message code="libro.titulo.label" default="Titulo" /></label>
		                   </td>
		                   <td valign="top" class="value">
		                       <g:textField name="titulo" />
		                   </td>
		               </tr>
		           
		               <tr class="prop">
		                   <td valign="top" class="name">
		                       <label for="autores"><g:message code="libro.autores.label" default="Autores" /></label>
		                   </td>
		                   <td valign="top" class="value">
		                       <g:textField name="autores" />
		                   </td>
		               </tr>
		           
		               <tr class="prop">
		                   <td valign="top" class="name">
		                       <label for="editorial"><g:message code="libro.editorial.label" default="Editorial" /></label>
		                   </td>
		                   <td valign="top" class="value">
		                       <g:textField name="editorial" />
		                   </td>
		               </tr>
		               <tr>
		               	<td>&nbsp;</td>
		               	<td>
			                <g:submitButton name="search" value="Buscar"/>
		               	</td>
		               </tr>
		            </table>
                
	            </g:form>
	
	        </formset>
		</div>
    </body>
</html>
