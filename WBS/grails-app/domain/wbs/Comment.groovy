package wbs

import javax.annotation.Resource

import org.springframework.context.MessageSource
import org.springframework.web.servlet.LocaleResolver

class Comment {
	
	People createdBy
	Date created
	
	String text
	
	Comment answer
	Requirement requirement
	Task task
	Issue issue
	
	static hasMany = [responses : Comment]
	
	static belongsTo = [answer : Comment, requirement : Requirement, task : Task, issue : Issue]
	
	static mappedBy = [responds: "answer"]
	
	static minCriteria = [
		["createdBy", "created", "text", "answer"],
		["createdBy", "created", "text", "requirement"],
		["createdBy", "created", "text", "task"],
		["createdBy", "created", "text", "issue"]
	]
	
    static constraints = {
		createdBy()
		created()
		text(widget:"textarea", maxSize:500)
		
		answer(nullable:true)
		requirement(nullable:true)
		task(nullable:true)
		issue(nullable:true)
		
		responses();
    }
	
	@Override
	public String toString() {
		return text;
	}
}
