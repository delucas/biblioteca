package delucas

import delucas.aws.ProductLookupService;

class LibroController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def search = {
	}
	
	def results = {

		
		String isbn 
		
		// de esta manera permitimos que ingresen el isbn por url, o por parámetro
		if (params.isbn) {
			isbn = params.isbn
		} else if (params.id) {
			isbn = params.id
		}

		// primero busco si no lo tengo en la base local
		def libroInstance = Libro.findByIsbn(isbn)

		if (libroInstance){
			flash.message = "El libro con ISBN ${isbn} ya se encuentra en la base de datos"
			redirect(action: "show", id: libroInstance.id)
		} else {

			ProductLookupService servicio = new ProductLookupService();

			libroInstance = servicio.buscarPorISBN(isbn)

			// en caso de error
			if (!libroInstance) {
				libroInstance = new Libro(isbn: isbn)
				return [ libroInstance : libroInstance, term : isbn ]
			}

			servicio.completarReview libroInstance
			servicio.completarImageURL libroInstance
		}

		return [ libroInstance : libroInstance, term : isbn ]
	}

	def advSearch = {
	}

	def advResults = {

		def libroInstanceList = Libro.createCriteria().list {
			or {
				if (params.titulo){
					ilike('titulo', "%${params.titulo}%")
				}
				if (params.autores){
					ilike('autores', "%${params.autores}%")
				}
				if (params.editorial){
					ilike('editorial', "%${params.editorial}%")
				}
			}
			order("titulo", "desc")
		}
		
		return [ libroInstanceList : libroInstanceList, libroInstanceTotal: libroInstanceList.count() ]
	}


	def index = {
		redirect(action: "list", params: params)
	}

	def list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[libroInstanceList: Libro.list(params), libroInstanceTotal: Libro.count()]
	}

	def create = {
		def libroInstance = new Libro()
		libroInstance.properties = params
		return [libroInstance: libroInstance]
	}

	def save = {
		def libroInstance = new Libro(params)
		if (libroInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'libro.label', default: 'Libro'), libroInstance.id])}"
			redirect(action: "show", id: libroInstance.id)
		}
		else {
			render(view: "create", model: [libroInstance: libroInstance])
		}
	}

	def show = {

		def existePrestamo = false

		def prestamo =
				Prestamo.findAll("from Prestamo as p where p.fechaDevolucion is null and p.libro.id = :idLibro", [idLibro:new Long(params.id)])

		def libroInstance = Libro.get(params.id)
		if (!libroInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'libro.label', default: 'Libro'), params.id])}"
			redirect(action: "list")
		}
		else {
			[libroInstance: libroInstance, prestamoInstance: prestamo]
		}
	}

	def edit = {
		def libroInstance = Libro.get(params.id)
		if (!libroInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'libro.label', default: 'Libro'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [libroInstance: libroInstance]
		}
	}

	def update = {
		def libroInstance = Libro.get(params.id)
		if (libroInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (libroInstance.version > version) {

					libroInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [
						message(code: 'libro.label', default: 'Libro')]
					as Object[], "Another user has updated this Libro while you were editing")
					render(view: "edit", model: [libroInstance: libroInstance])
					return
				}
			}
			libroInstance.properties = params
			if (!libroInstance.hasErrors() && libroInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'libro.label', default: 'Libro'), libroInstance.id])}"
				redirect(action: "show", id: libroInstance.id)
			}
			else {
				render(view: "edit", model: [libroInstance: libroInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'libro.label', default: 'Libro'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete = {
		def libroInstance = Libro.get(params.id)
		if (libroInstance) {
			try {
				libroInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'libro.label', default: 'Libro'), params.id])}"
				redirect(action: "list")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'libro.label', default: 'Libro'), params.id])}"
				redirect(action: "show", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'libro.label', default: 'Libro'), params.id])}"
			redirect(action: "list")
		}
	}
}
