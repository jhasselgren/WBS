package wbs

import org.bouncycastle.asn1.x509.sigi.PersonalData;

class Issue {
	
	String title, description
	
	Date date
	
	ReportStatus status
	
	IssuesType type
	
	People reporter
	
	People assigned
	
	Requirement requirement
	
	static hasMany = [comments : Comment]
	
	static customLayout = ["comments"]
	
	static belongsTo = [requirement : Requirement ]
	
    static constraints = {
		title()
		requirement()
		date()
		status()
		type()
		reporter()
		assigned()
		description(widget: 'textarea', maxSize: 500)
		comments()
    }
	
	@Override
	public String toString() {
		return title;
	}
}

public enum ReportStatus {NEW, OPEN, RESOLVED, CLOSED}

public enum IssuesType {BUG, REQUEST, CHANGEREQUEST}