class TrendsController {
	def chartService
	def mapService

	def index = {}
    
    def charts = {}
    
    def maps = {    	    	
		Map mapParams = [:]
		mapParams.mapKey = GeocodeUtil.mapKey
		mapParams.incidentList = Incident.findAll("from Incident where latitude != NULL and longitude != NULL") //only want the incidents with geo information
		
		render(view:'maps',model:mapParams)
    }
    
	def incidentTypeByGang = {		
		Map incidentTypeByGangParams = chartService.createIncidentTypeByGangParams(params)
		
		if(!incidentTypeByGangParams.occurenceValues)
			render '<img src="http://chart.apis.google.com/chart?cht=p3&chd=t:50,50&chs=525x170&chl=Incident Type 1: N|Incident Type 2: N" />'
		else
			render "<img src=\"http://chart.apis.google.com/chart?cht=p3&chd=t:${incidentTypeByGangParams.occurenceValues}&chs=525x170&chl=${incidentTypeByGangParams.pieChartLabels}\" />"
	}
	
	def incidentTypePerYear = {
		Map incidentPerYearParams = chartService.createIncidentsPerYearParams(params)		
		
		if(!incidentPerYearParams.occurenceValues)
			render '<img src="http://chart.apis.google.com/chart?cht=bvg&chxt=y&chxr=0,0,5&chbh=95,1&chd=t:0,0,0,0&chs=549x299&chl=Disturbing the Peace|Grand Theft Auto|Movie Pirating|Shoplifting" />'
		else
			render "<img src=\"http://chart.apis.google.com/chart?cht=bvg&chxt=y&chxr=0,0,${incidentPerYearParams.yAxisScale}&chbh=95,1&chd=t:${incidentPerYearParams.occurenceValues}&chs=549x299&chl=${incidentPerYearParams.xAxisLabels}\" />"
	}
}