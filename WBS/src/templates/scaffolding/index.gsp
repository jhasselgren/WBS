<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container">
			<div class="row row-offcanvas row-offcanvas-right">
				<div class="col-xs-12 col-sm-9">
					<div class="jumbotron">
		            	<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			            <p>This is an example to show the potential of an offcanvas layout pattern in Bootstrap. Try some responsive-range viewport sizes to see it in action.</p>
		          	</div>
		          	<div class="row">
			          	<div id="list-${domainClass.propertyName}" class="col-xs-12 content scaffold-list" role="main">
							<g:if test="\${flash.message}">
								<div class="alert alert-info">\${flash.message}</div>
							</g:if>
							<table class="table table-striped table-hover">
							<thead>
									<tr>
									<%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
										allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
										props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && it.type != null && !Collection.isAssignableFrom(it.type) }
										Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
										props.eachWithIndex { p, i ->
											if (i < 6) {
												if (p.isAssociation()) { %>
										<th><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></th>
									<%      } else { %>
										<g:sortableColumn property="${p.name}" title="\${message(code: '${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')}" />
									<%  }   }   } %>
									</tr>
								</thead>
								<tbody>
								<g:each in="\${${propertyName}List}" status="i" var="${propertyName}">
									<tr>
									<%  props.eachWithIndex { p, i ->
											if (i == 0) { %>
										<td><g:link action="show" id="\${${propertyName}.id}">\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</g:link></td>
									<%      } else if (i < 6) {
												if (p.type == Boolean || p.type == boolean) { %>
										<td><g:formatBoolean boolean="\${${propertyName}.${p.name}}" /></td>
									<%          } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
										<td><g:formatDate date="\${${propertyName}.${p.name}}" /></td>
									<%          } else { %>
										<td>\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</td>
									<%  }   }   } %>
									</tr>
								</g:each>
								</tbody>
							</table>
							<div class="pagination">
								<g:paginate total="\${${propertyName}Count ?: 0}" />
							</div>
						</div>
		          	</div>

				</div>
				<div role="navigation" id="sidebar" class="col-xs-6 col-sm-3 sidebar-offcanvas">
		          	<div class="list-group">
			            <g:link class="list-group-item" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
		          	</div>
		        </div>
			</div>
		</div>
	</body>
</html>
