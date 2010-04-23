import groovy.sql.Sql

class ChartService {
    boolean transactional = true
    def dataSource

    public Map createIncidentTypeByGangParams(def params) {
		int gangId = params.gang.id ? new Integer(params.gang.id) : 0
		def db = new Sql(dataSource)
		def results = db.rows("select incident.type, count(*) \"count\" from gang_member join gang on gang_member.gang_id = gang.id join incident on gang_member.id = incident.gang_member_id where gang.id = ${gangId} group by incident.type")
		
		Map incidentTypeAndOccurences = new LinkedHashMap()
		
		results.each { incident ->
		    incidentTypeAndOccurences[incident.type] = incident.count
		}		
		
		def pieScale = incidentTypeAndOccurences.values().sum()
		List pieChartLabelsList = []
		
		if(pieScale > 0) {
			incidentTypeAndOccurences.each { incidentType, occurences ->
			    incidentTypeAndOccurences[incidentType] = ((occurences / pieScale) * 100);
			    pieChartLabelsList << "${incidentType}: ${occurences}" 
			}
		}		
		
		String occurenceValues = incidentTypeAndOccurences.values().join(',')		
		String pieChartLabels = pieChartLabelsList.join('|')		

		return [pieChartLabels:pieChartLabels,occurenceValues:occurenceValues]
    }

    public Map createIncidentsPerYearParams(def params) {
		int year = params.year ? new Integer(params.year) : 0

		def db = new Sql(dataSource)
		String query = "select type, count(*) \"count\" from Incident where time_of_incident < \'${year + 1}\' and time_of_incident > \'${year}\' group by type"
		def results = db.rows(query)
		
		//Create a map with the incident types as a key and the occurence as the value with a default of 0
		Map incidentsAndOccurences = new LinkedHashMap() //will keep the insertion order of the map
		
		//Initialize the incident counts to 0
		Incident.constraints.type.inList.each { key ->
			incidentsAndOccurences[key] = 0
		}
		
		results.each { incident ->
		    if(incidentsAndOccurences.containsKey(incident.type))
		    	incidentsAndOccurences[incident.type] = incident.count
		}
		
		def yAxisScale = incidentsAndOccurences.values().sum() ? ((incidentsAndOccurences.values().max() * 1.5)) : 5 //adjust the scale a bit or define a default value

		if(yAxisScale > 0) {
			incidentsAndOccurences.each { key, value ->
			    incidentsAndOccurences[key] = ((value / yAxisScale) * 100);
			}
		}
		
		String occurenceValues = incidentsAndOccurences.values().join(',')		
		String xAxisLabels = incidentsAndOccurences.keySet().join('|')
		
		return [xAxisLabels:xAxisLabels,yAxisScale:yAxisScale,occurenceValues:occurenceValues]
    }
}
