import grails.converters.*
            
class GangController {
	def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ gangList: Gang.list( params ) ]
    }
    
	def listXml = {
		def list = Gang.list(params)
		render(contentType:"text/xml" ){
			gangs{
				for(g in list){
					gang(id:g.id, name:g.name){						
						gangcolor(g.gangColor)						
					}
				}
			}
		}		
	}							

    def show = {
        def gang = Gang.get( params.id )

        if(!gang) {
            flash.message = "Gang not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ gang : gang ] }
    }
    
	def showXml = {
		render Gang.get( params.id ) as XML
	}    
	
	def showJson = {
		render Gang.get( params.id ) as JSON
	} 	

    def delete = {
        def gang = Gang.get( params.id )
        if(gang) {
            gang.delete()
            flash.message = "Gang ${gang} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Gang not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def gang = Gang.get( params.id )

        if(!gang) {
            flash.message = "Gang not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ gang : gang ]
        }
    }

    def update = {    	
    	def logosDir = servletContext.getRealPath("/images/logos")
    	
        if(request.getFile('logoUpload'))
        	ImageUploadUtil.uploadImage('logoUpload', request, params, logosDir)
    	
        def gang = Gang.get( params.id )
        if(gang) {
            gang.properties = params
            if(!gang.hasErrors() && gang.save()) {
                flash.message = "Gang ${gang} updated"
                redirect(action:list)
            }
            else {
                render(view:'edit',model:[gang:gang])
            }
        }
        else {
            flash.message = "Gang not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def gang = new Gang()
        gang.properties = params
        
        return ['gang':gang]
    }

    def save = {
    	def logosDir = servletContext.getRealPath("/images/logos")
    	
        if(request.getFile('logoUpload'))
        	ImageUploadUtil.uploadImage('logoUpload', request, params, logosDir)
    		    	
        def gang = new Gang(params)
        if(!gang.hasErrors() && gang.save()) {
            flash.message = "Gang ${gang} created"
            redirect(action:list)
        }
        else {
            render(view:'create',model:[gang:gang])
        }
    }
}