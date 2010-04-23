class Gang implements Comparable {
	String name
	String gangColor
	String description
	String logo //a path to the gang's image
	
	static hasMany = [gangMembers:GangMember]
	
	static constraints = {
		name(maxSize:50,blank:false)		
		gangColor(inList:['Red', 'Blue', 'Green', 'Orange'].sort(),blank:false)
		description(maxSize:2000)
		logo(blank:true, nullable:true)
	}
	
	public String toString(){
		return name
	}
	
    public int compareTo(Object gang){
        return this.name[0].toUpperCase().compareTo(gang.name[0].toUpperCase());
    }
}

