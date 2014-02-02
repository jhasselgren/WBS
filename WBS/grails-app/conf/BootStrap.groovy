

import wbs.DemandCategory
import wbs.Issue
import wbs.IssuesType
import wbs.People
import wbs.Project
import wbs.ReportStatus
import wbs.Requirement

class BootStrap {

    def init = { servletContext ->
		
		if(!People.count()){
			new People(name: "Joakim Hasselgren", userName: "jhas",  ).save()
			new People(name: "Therese Wagner", userName: "tess",  ).save()
		}
		
		
		if(!Project.count()){
			new Project(name: "Test 1", description: "Första Test projektet", responisible: People.first()).save()
			new Project(name: "Test 2", description: "Andra Test projektet", responisible: People.first()).save()
			new Project(name: "Test 3",description: "Tredje Test projektet", responisible: People.findWhere(userName: "tess")).save()
		}
		
		if(!Requirement.count())
		{
			new Requirement(
				name: "Det ska gå att skapa krav", 
				description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum dignissim, eros eget vestibulum congue, nulla justo imperdiet justo, in venenatis justo magna in lacus. Sed posuere ultrices neque, ac ultrices massa pulvinar at. Curabitur diam tellus, pretium in euismod quis, tincidunt eu purus. Nulla vel bibendum arcu. Donec mi quam, luctus ut interdum vitae, lobortis nec tortor. Proin laoreet lorem a luctus elementum. Phasellus metus posuere.",
				category: DemandCategory.FEATURE, 
				project: Project.first()
				).save()
		}
		
		if(!Issue.count()){
			new Issue(
				title: "Felmeddelande vid skapande av krav",
				description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sit amet auctor ligula. In varius enim et nisi consectetur, sagittis auctor nunc congue. Proin facilisis tellus sit amet sollicitudin commodo. Duis congue dictum ultricies. Suspendisse potenti. Ut vitae dignissim orci. Nam purus metus.",  
				assigned: People.findWhere(userName: "tess"),
				reporter: People.findWhere(userName: "jhas"),
				date: new Date(),
				status: ReportStatus.NEW, 
				type: IssuesType.BUG, 
				requirement: Requirement.first(), 
				).save()
		}
		
    }
    def destroy = {
    }
}
