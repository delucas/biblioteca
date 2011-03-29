package delucas

class Prestamo {

	Libro libro
	String socio
	Date fechaPrestamo
	Date fechaDevolucion
	
    static constraints = {
		libro(nullable:false)
		socio(nullable:false)
		fechaPrestamo(nullable:false)
		fechaDevolucion(nullable:true)
    }
	
	static mapping = {
		sort fechaDevolucion:"asc"
	}
}
