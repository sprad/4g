import java.text.DecimalFormat

class GeocodeUtil {
	public final static String mapKey = ''//<REPLACE WITH YOUR GOOGLE MAP'S API KEY>
	
	public static Map geocode(address, city, state){				
		def query = "${address ?: ''},+${city ?: ''},+${state ?: ''}"
		def base = 'http://maps.google.com/maps/geo'
		def url_string = "${base}?q=${URLEncoder.encode(query)}&output=csv&key=${mapKey}"
		
	    def results = new URL(url_string).text
	    
		//If the geocode was a success
	    if(results?.split(',')[0] == "200" && results.split(',')[2] != "0" && results.split(',')[3] != "0") {
	    	def DecimalFormat df = new DecimalFormat("00.000000");
	    	def latitude = df.format(results.split(',')[2].toDouble())
	    	def longitude = df.format(results.split(',')[3].toDouble())
	    	
	    	return [lat:latitude, lon:longitude]
	    }        
	
	    return [lat:'',lon:'']
	}
}