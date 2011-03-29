package delucas

class Prestamo {

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
	
	static belongsTo = [libro:Libro]
	
}
