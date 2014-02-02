package wbs

class Requirement {
	
	public Requirement(){
		super()
		if(issues == null ) issues = new ArrayList()
		if(comments == null ) comments = new ArrayList()
		if(tasks == null ) tasks = new ArrayList()
	}
	
	
	String name, description
	
	DemandCategory category
	
	Project project
	
	static hasMany = [issues : Issue, tasks : Task, comments : Comment]

	
    static constraints = {
		project()
		name()
		category()
		description(widget: 'textarea', maxSize: 500)
		issues()
		comments()
    }
	
	@Override
	public String toString() {
		return name;
	}
}

public enum DemandCategory { FEATURE, USABILITY }