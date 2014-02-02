<%=packageName%>
<% import grails.persistence.Event %>
<% import org.codehaus.groovy.grails.commons.DefaultGrailsDomainClass %>


<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container">
			<div class="row row-offcanvas row-offcanvas-right">
				<div class="col-xs-12 col-sm-9">
					<div class="jumbotron">
		            	<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			            <p>This is an example to show the potential of an offcanvas layout pattern in Bootstrap. Try some responsive-range viewport sizes to see it in action.</p>
		          	</div>
		          	<div class="row">
		          		<div class="col-xs-12">
							<g:if test="\${flash.message}">
							<div class="alert alert-info">\${flash.message}</div>
							</g:if>
						
						<%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
							//println(Arrays.toString(excludedProps.toArray()))
							allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
							//println(Arrays.toString(allowedNames.toArray()))
							props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) }
							//println(Arrays.toString(props.toArray()))

							constraintsMap = domainClass.getConstrainedProperties() 
							Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
							props.each { p -> %>
							<!--<g:if test="\${${propertyName}?.${p.name}}">-->
									
								<%  if (p.isEnum()) { %>
									<div class="col-md-4">
										<div class="form-group">
											<label><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></label>
											<p class="property-value" aria-labelledby="${p.name}-label"><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></p>
										</div>
									</div>
								<%  } else if (p.oneToMany || p.manyToMany) { %>
									<div class="col-xs-12">
										<div class="form-group">
											<label><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></label>
											<g:each in="\${${propertyName}.${p.name}}" var="${p.name[0]}">
											<p class="property-value" aria-labelledby="${p.name}-label"><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${p.name[0]}.id}">\${${p.name[0]}?.encodeAsHTML()}</g:link></p>
											</g:each>
											<p><g:link class="btn btn-default btn-xs" controller="${p.referencedDomainClass.propertyName}" action="create" params="['${p.domainClass.propertyName}.id': ${propertyName}?.id]">>\${message(code: 'default.add.label', args: [message(code: '${p.referencedDomainClass.propertyName}.label', default: '${p.referencedDomainClass.shortName}')])}</g:link>
										</div>
									</div>
								<%  } else if (p.manyToOne || p.oneToOne) { %>
									<div class="col-md-4">
										<div class="form-group">
											<label><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></label>
											<p class="property-value" aria-labelledby="${p.name}-label"><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${propertyName}?.${p.name}?.id}">\${${propertyName}?.${p.name}?.encodeAsHTML()}</g:link></p>
										</div>
									</div>
								<%  } else if (p.type == Boolean || p.type == boolean) { %>
									<div class="col-md-4">
										<div class="form-group">
											<label><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></label>
											<p class="property-value" aria-labelledby="${p.name}-label"><g:formatBoolean boolean="\${${propertyName}?.${p.name}}" /></p>
										</div>
									</div>
								<%  } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
									<div class="col-md-4">
										<div class="form-group">
											<label><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></label>
											<p class="property-value" aria-labelledby="${p.name}-label"><g:formatDate date="\${${propertyName}?.${p.name}}" /></p>
										</div>
									</div>
								<%  } else if (!p.type.isArray()) { %>
									
										<%
										constraints = constraintsMap.get(p.name)
										if(constraints != null && constraints.getWidget() != null && constraints.getWidget() == "textarea" )
										{
											println "<div class=\"col-xs-12\">"
										}
										else{
											println "<div class=\"col-md-4\">"
										}

										%>
										<div class="form-group">
											<label><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></label>
											<p class="property-value" aria-labelledby="${p.name}-label"><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></p>
										</div>
									</div>
								<%  } %>
							<!--</g:if>-->
						<%  } %>
						</div>
						<div class="col-xs-12">
							<g:form url="[resource:${propertyName}, action:'delete']" method="DELETE">
								<fieldset class="buttons">
									<g:link class="btn btn-default" action="edit" resource="\${${propertyName}}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
									<g:actionSubmit class="btn btn-default" action="delete" value="\${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
								</fieldset>
							</g:form>
						</div>
					</div>
	        	</div>
	        	<div role="navigation" id="sidebar" class="col-xs-6 col-sm-3 sidebar-offcanvas">
		          	<div class="list-group">
			            <a class="list-group-item" href="\${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
			            <g:link class="list-group-item" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
			            <g:link class="list-group-item" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
		          	</div>
	        	</div>
        	</div>
       	</div>
	</body>
</html>
