package delucas

import grails.test.*

class LibroIntegrationTests extends GrailsUnitTestCase {

	void testFirstSaveEver() {
		
		def libro = new Libro(isbn: '9788475776415', titulo: 'Puedo verlo desnudo',
				autores: 'Ron Hoff', editorial: 'Granica')
		
		assertNotNull libro.save()
		assertNotNull libro.id

		def foundLibro = Libro.get(libro.id)
		assertEquals 'Puedo verlo desnudo', foundLibro.titulo
		
	}
	
	void testEvilSave() {
		def libro = new Libro()
		
		assertFalse libro.validate()
		assertTrue libro.hasErrors()
		
		def errors = libro.errors
		assertEquals "nullable", errors.getFieldError("isbn").code
		assertEquals "nullable", errors.getFieldError("titulo").code
		assertEquals "nullable", errors.getFieldError("autores").code
		assertEquals "nullable", errors.getFieldError("editorial").code

	}
	

}
