class IncidentController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 20
        [ incidentList: Incident.list( params ) ]
    }

    def show = {
        def incident = Incident.get( params.id )

        if(!incident) {
            flash.message = "Incident not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ incident : incident ] }
    }

    def delete = {
        def incident = Incident.get( params.id )
        if(incident) {
            incident.delete()
            flash.message = "Incident ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Incident not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def incident = Incident.get( params.id )

        if(!incident) {
            flash.message = "Incident not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ incident : incident ]
        }
    }

    def update = {
    	
    	def latLon = GeocodeUtil.geocode(params.address, params.city, params.state)
    	
    	params.latitude = latLon.lat ?: ''
    	params.longitude = latLon.lon ?: ''
    	
        def incident = Incident.get( params.id )
        if(incident) {
            incident.properties = params
            if(!incident.hasErrors() && incident.save()) {
                flash.message = "Incident ${params.id} updated"
                redirect(action:show,id:incident.id)
            }
            else {
                render(view:'edit',model:[incident:incident])
            }
        }
        else {
            flash.message = "Incident not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def incident = new Incident()
        incident.properties = params
        return ['incident':incident]
    }

    def save = {
    	
    	def latLon = GeocodeUtil.geocode(params.address, params.city, params.state)
    	
    	params.latitude = latLon.lat ?: ''
    	params.longitude = latLon.lon ?: ''     	
    	
        def incident = new Incident(params)       
        
        if(!incident.hasErrors() && incident.save()) {
            flash.message = "Incident ${incident.id} created"
            redirect(action:show,id:incident.id)
        }
        else {
            render(view:'create',model:[incident:incident])
        }
    }
}