package wbs

class Task {
	String name, description
	
	Requirement requirement
	
	Task parent
	
	static hasMany = [childrens : Task, comments : Comment]
	
	static belongsTo = [parent : Task, requirement : Requirement]
	
	static mappedBy = [childrens : "parent"]
	
	static minCriteria = 
	[
		["name", "requirement"],
		["name", "parent"]
	] 
	
    static constraints = {
		name()
		requirement(nullable:true)
		parent(nullable:true)
		description(widget:"textarea", maxSize:500)
		childrens() 
		comments()
    }
	
	Task getRootNode(){
		if(parent){
			return parent.getRootNode()
		}
		else{
			return this
		}
	}
	
	boolean isLeaf()
	{
		return childrens.isEmpty()
	}
	
	@Override
	public String toString() {
		return name
	}
}
