class GangMember implements Comparable {
	Gang gang
	String firstName
	String lastName
	String alias
	String description
	String mugshot
	Date joinDate
	
	static belongsTo = Gang	
	static hasMany = [incidents:Incident]
	
	static constraints = {
		firstName(maxSize:50,blank:false)		
		lastName(maxSize:50,blank:false)
		alias(maxSize:50)
		description(maxSize:2000, nullable:true)
		mugshot(maxSize:255, nullable:true)
		joinDate(validator: {return (it < new Date())}, blank:false)				
		gang(blank:false)
		incidents(nullable:true)
	}	
	
	public String toString(){
		String addAlias = alias ? "a.k.a $alias" : ''
		"$firstName $lastName $addAlias"
	}
	
    public int compareTo(Object gangMember){
        return this.toString().compareTo(gangMember.toString());
    }	
}