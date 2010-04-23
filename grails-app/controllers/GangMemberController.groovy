class GangMemberController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
    	if(!params.max) params.max = 10
        [ gangMemberList: GangMember.list( params ) ]
    }

    def show = {
        def gangMember = GangMember.get( params.id )

        if(!gangMember) {
            flash.message = "GangMember not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ gangMember : gangMember ] }
    }

    def delete = {
        def gangMember = GangMember.get( params.id )
        
        if(gangMember) {
            gangMember.delete()
            flash.message = "Gang Member ${gangMember} deleted"
            redirect(controller:'gang', action:show, id:gangMember.gang.id)
        }
        else {
            flash.message = "GangMember not found with id ${params.id}"
            redirect(controller:'gang', action:show, id:gangMember.gang.id)
        }
    }

    def edit = {    	
    	def gangMember = GangMember.get( params.id )

        if(!gangMember) {
            flash.message = "GangMember not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ gangMember : gangMember ]
        }
    }

    def update = {    	
    	def mugshotsDir = servletContext.getRealPath("/images/mugshots")
    	
        if(request.getFile('mugshotUpload'))
        	ImageUploadUtil.uploadImage('mugshotUpload', request, params, mugshotsDir)
    	
        def gangMember = GangMember.get( params.id )
        if(gangMember) {
            gangMember.properties = params
            if(!gangMember.hasErrors() && gangMember.save()) {
                flash.message = "Gang Member ${gangMember} updated"
                redirect(controller:'gang', action:show,id:gangMember.gang.id)
            }
            else {
                render(view:'edit',model:[gangMember:gangMember])
            }
        }
        else {
            flash.message = "GangMember not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def gangMember = new GangMember()
        gangMember.properties = params
        
        return ['gangMember':gangMember]
    }

    def save = {
		def mugshotsDir = servletContext.getRealPath("/images/mugshots")
    	
        if(request.getFile('mugshotUpload'))
        	ImageUploadUtil.uploadImage('mugshotUpload', request, params, mugshotsDir)
    	
    	def gangMember = new GangMember(params)
    	    	
    	if(!gangMember.hasErrors() && gangMember.save()) {
            flash.message = "Gang Member ${gangMember} created"
            redirect(controller:'gang', action:show,id:gangMember.gang.id)
        }
        else {
            render(view:'create',model:[gangMember:gangMember])
        }
    }
}