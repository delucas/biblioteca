package delucas

class PrestamoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[prestamoInstanceList: Prestamo.list(params), prestamoInstanceTotal: Prestamo.count()]
    }

    def create = {
        def prestamoInstance = new Prestamo()
        prestamoInstance.properties = params
		
		def libroInstance = Libro.get(params.idLibro) 
		
        return [prestamoInstance: prestamoInstance, libroInstance : libroInstance]
    }

    def save = {
        def prestamoInstance = new Prestamo()
		def libroInstance = Libro.get(params.idLibro)
		
		prestamoInstance.socio = params.socio
		prestamoInstance.libro = libroInstance
		prestamoInstance.fechaPrestamo = new Date()
		
        if (prestamoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'prestamo.label', default: 'Prestamo'), prestamoInstance.id])}"
            redirect(action: "show", id: prestamoInstance.id)
        }
        else {
            render(view: "create", model: [prestamoInstance: prestamoInstance])
        }
    }

    def show = {
        def prestamoInstance = Prestamo.get(params.id)
        if (!prestamoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'prestamo.label', default: 'Prestamo'), params.id])}"
            redirect(action: "list")
        }
        else {
            [prestamoInstance: prestamoInstance]
        }
    }

    def delete = {
        def prestamoInstance = Prestamo.get(params.id)
        if (prestamoInstance) {
            try {
                prestamoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'prestamo.label', default: 'Prestamo'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'prestamo.label', default: 'Prestamo'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'prestamo.label', default: 'Prestamo'), params.id])}"
            redirect(action: "list")
        }
    }
	
	
	def devolver = {
		def prestamoInstance = Prestamo.get(params.id)
		if (prestamoInstance) {
			prestamoInstance.fechaDevolucion = new Date()
			
			prestamoInstance.save()
			
			flash.message = "Se ha devuelto el Libro correctamente"
			redirect(action: "list")
		}
	}
	
}
