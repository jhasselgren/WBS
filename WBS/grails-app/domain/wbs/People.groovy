package wbs

class People {

    String name, userName
	
	//Collection<Project> assigned
	
	static hasMany = [assignment : Project]
	
    static constraints = {
		userName unique : true
		name()
		assignment()
    }
	
	@Override
	public String toString() {
		return name;
	}
}
