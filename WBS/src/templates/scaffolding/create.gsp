<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container">
			<div class="row row-offcanvas row-offcanvas-right">
				<div class="col-xs-12 col-sm-9">
					<div class="jumbotron">
		            	<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			            <p>This is an example to show the potential of an offcanvas layout pattern in Bootstrap. Try some responsive-range viewport sizes to see it in action.</p>
		          	</div>
		          	<div class="row">
		          		<div id="create-${domainClass.propertyName}" class="col-xs-12" role="main">
							<g:if test="\${flash.message}">
							<div class="alert alert-danger">\${flash.message}</div>
							</g:if>
							<g:hasErrors bean="\${${propertyName}}">
								<g:eachError bean="\${${propertyName}}" var="error">
								<div class="alert alert-danger" <g:if test="\${error in org.springframework.validation.FieldError}">data-field-id="\${error.field}"</g:if>>
									<g:message error="\${error}"/>
								</div>
								</g:eachError>
							</g:hasErrors>
						</div>
						<div class="col-xs-12">
							<g:form url="[resource:${propertyName}, action:'save']" <%= multiPart ? ' enctype="multipart/form-data"' : '' %>>
								<fieldset class="form">
									<g:render template="form"/>
								</fieldset>
								<fieldset class="buttons">
									<g:submitButton name="create" class="btn btn-default" value="\${message(code: 'default.button.create.label', default: 'Create')}" />
								</fieldset>
							</g:form>
						</div>
					</div>
	        	</div>
	        	<div role="navigation" id="sidebar" class="col-xs-6 col-sm-3 sidebar-offcanvas">
		          	<div class="list-group">
			            <a class="list-group-item" href="\${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
			            <g:link class="list-group-item" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
		          	</div>
	        	</div>
        	</div>
		</div>
	</body>
</html>
