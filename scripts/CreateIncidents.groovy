import java.text.DecimalFormat
import java.text.SimpleDateFormat;

import org.codehaus.groovy.grails.commons.GrailsClassUtils as GCU

grailsHome = Ant.project.properties."environment.GRAILS_HOME"

includeTargets << new File ( "${grailsHome}/scripts/Init.groovy" )  

target('default': "4g Setup") {
    createIncidents()
}

target(createIncidents: "\tCreate BootStrap Incidents"){	
	addressFile = "${Ant.project.properties.basedir}/scripts/address.csv"
	
	outputFile = new File("output.txt")
	
	new File(addressFile).eachLine { cityState ->
		city = cityState.split(',')[0]
		state = cityState.split(',')[1]
		
		geoCoordinates = geocodeAddress('', city, state, '')
		latitude = geoCoordinates[0] 
		longitude = geoCoordinates[1]
		
		print "test"
		
		outputFile << "new Incident([\"timeOfIncident\":${randomDate()}, \"address\":\"\", \"city\":\"${city}\", \"state\":\"${state}\", \"zip\":\"\", \"type\":\"${randomIncidentType()}\", \"longitude\":\"${longitude}\", \"latitude\":\"${latitude}\", \"gangMember\":${randomGangster()}]).save()\r\n"
		
	}
}

random = new Random()
count = 0

//Returns a date between January 1, 2000 and now
def randomDate(){
    millisBetweenNowAndJan1_2000 = (new Date().time - new Date(100, 0, 1).time)
    daysBetweenNowAndJan1_2000 = (millisBetweenNowAndJan1_2000 / 1000 / 60 / 60 / 24).toInteger()    
    date = new Date() - random.nextInt(daysBetweenNowAndJan1_2000)
    
    return "new SimpleDateFormat(\"MM/dd/yyyy\").parse(\"${date.month+1}/${date.date}/${date.year+1900}\")"
}	

def randomGangster(){
	return "gm${random.nextInt(16) + 1}"
}

def randomIncidentType(){
	typeList = ['Grand Theft Auto', 'Shoplifting', 'Disturbing the Peace', 'Movie Pirating']
	return typeList[random.nextInt(typeList.size())]
}

def geocodeAddress(address, city, state, zip) {
	key = ''// YOUR GOOGLE MAP'S API KEY HERE
	query = "${address ?: ''},+${city ?: ''},+${state ?: ''},+${zip ?: ''}"
	base = 'http://maps.google.com/maps/geo'
	url_string = "${base}?q=${URLEncoder.encode(query)}&output=csv&key=${key}"
	
    results = new URL(url_string).text 
    
    println "${++count}: ${results}"
    
    Thread.sleep(500) //don't go too fast because of Google's throttle limit
    
	//If the geocode was a success
    if(results?.split(',')[0] == "200" && results.split(',')[2] != "0" && results.split(',')[3] != "0") {
    	DecimalFormat df = new DecimalFormat("00.000000");
    	latitude = df.format(results.split(',')[2].toDouble())
    	longitude = df.format(results.split(',')[3].toDouble())
    	
    	return [latitude, longitude]
    }        

    return ['','']
}