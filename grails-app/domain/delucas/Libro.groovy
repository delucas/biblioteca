package delucas

class Libro {

	String isbn
	String titulo
	String autores
	String editorial

	String review
	String imageURL
	String amazonURL

	static constraints = {
		isbn(nullable: false, unique: true)
		titulo(nullable: false)
		autores(nullable: false)
		editorial(nullable: false)

		review(nullable: true)
		imageURL(nullable: true)
		amazonURL(nullable: true)
	}
	
	static mapping = {
		prestamos cascade:'all-delete-orphan'
	}

	static hasMany = [prestamos:Prestamo]
	
	String toString(){
		return titulo
	}
	
}
