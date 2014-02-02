package wbs

class Project {

	String name, description
	
	//People responisible
	
	static hasOne = [responisible : People]
	
	static hasMany = [requirements : Requirement]
	
    static constraints = {
		name()
		responisible()
		description(widget: 'textarea', maxSize: 500)
		requirements() 
    }
	
	@Override
	public String toString() {
		return name;
	}
}