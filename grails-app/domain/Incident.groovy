class Incident implements Comparable {
	GangMember gangMember
	String type
	Date timeOfIncident
	String address
	String city
	String state
	String zip
	Float latitude
	Float longitude
	
	static belongsTo = GangMember
	
	static constraints = { 
        timeOfIncident(validator: {return (it < new Date())}, blank:false)
        type(inList:['Grand Theft Auto', 'Shoplifting', 'Disturbing the Peace', 'Movie Pirating'].sort(), blank:false)
        gangMember(nullable:false)
        city(maxLength:30,blank:false) 
		state(inList:['AL','AK','AZ','AR','CA','CO','CT','DC','DE','FL','GA','HI','ID','IL','IN','IA','KS','KY','LA','ME','MD','MA','MI','MN','MS','MO','MT','NE','NV','NH','NJ','NM','NY','NC','ND','OH','OK','OR','PA','RI','SC','SD','TN','TX','UT','VT','VA','WA','WV','WI','WY'].sort(),blank:false) 
        zip(size:5..5, blank:true, nullable:true)
        latitude(nullable:true)
        longitude(nullable:true)
	}
		
	public String toString(){
		"${timeOfIncident.month + 1}/${timeOfIncident.date}/${timeOfIncident.year + 1900} - $type"
	}
	
    public int compareTo(Object incident){
        return this.timeOfIncident.compareTo(incident.timeOfIncident);
    }	
}