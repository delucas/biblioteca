<html>
    <head>
        <title>Nuevo Libro</title>
        <meta name="layout" content="main"/>
    </head>
    <body>

        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Principal</a></span>
            <span class="menuButton"><g:link class="list" action="list">Listado de Libros</g:link></span>
            <span class="menuButton"><g:link class="search" action="advSearch">B&uacute;squeda de Libros</g:link></span>
        </div>

		<div class="body">
			<h1>Nuevo de Libro</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            
	        <formset>
	            <legend>Introduzca el ISBN del Libro</legend>
	
	            <g:form action="results">
				<table>
					   <tr class="prop">
					   <td>
	                <label for="isbn">ISBN</label>
	                </td>
	                <td><g:textField name="isbn" />
	                </td>
	                
	            </tr>
	            <tr><td></td><td>
	                <g:submitButton name="search" value="Buscar"/>
	            </td></tr>
	            </table>
	            </g:form>
	
	        </formset>
		</div>
    </body>
</html>
