package wbs



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PeopleController {
	static scaffold = true;
    
}
