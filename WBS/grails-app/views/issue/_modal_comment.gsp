<%@ page import="wbs.Comment" %>



<div class="form-group ${hasErrors(bean: commentInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="comment.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="createdBy" name="createdBy.id" from="${wbs.People.list()}" optionKey="id" required="" value="${commentInstance?.createdBy?.id}" class="form-control"/>
</div>

<div class="form-group ${hasErrors(bean: commentInstance, field: 'created', 'error')} required">
	<label for="created">
		<g:message code="comment.created.label" default="Created" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker class="form-control" name="created" precision="day"  value="${commentInstance?.created}"  />
</div>

<div class="form-group ${hasErrors(bean: commentInstance, field: 'text', 'error')} ">
	<label for="text">
		<g:message code="comment.text.label" default="Text" />
		
	</label>
	<g:textArea class="form-control" name="text" cols="40" rows="5" maxlength="500" value="${commentInstance?.text}"/>
</div>

<div class="form-group ${hasErrors(bean: commentInstance, field: 'answer', 'error')} ">
	<label for="answer">
		<g:message code="comment.answer.label" default="Answer" />
		
	</label>
	<g:select id="answer" name="answer.id" from="${wbs.Comment.list()}" optionKey="id" value="${commentInstance?.answer?.id}" class="form-control" noSelection="['null': '']"/>
</div>

<div class="form-group ${hasErrors(bean: commentInstance, field: 'requirement', 'error')} ">
	<label for="requirement">
		<g:message code="comment.requirement.label" default="Requirement" />
		
	</label>
	<g:select id="requirement" name="requirement.id" from="${wbs.Requirement.list()}" optionKey="id" value="${commentInstance?.requirement?.id}" class="form-control" noSelection="['null': '']"/>
</div>

<div class="form-group ${hasErrors(bean: commentInstance, field: 'task', 'error')} ">
	<label for="task">
		<g:message code="comment.task.label" default="Task" />
		
	</label>
	<g:select id="task" name="task.id" from="${wbs.Task.list()}" optionKey="id" value="${commentInstance?.task?.id}" class="form-control" noSelection="['null': '']"/>
</div>

<div class="form-group ${hasErrors(bean: commentInstance, field: 'issue', 'error')} ">
	<label for="issue">
		<g:message code="comment.issue.label" default="Issue" />
		
	</label>
	<g:select id="issue" name="issue.id" from="${wbs.Issue.list()}" optionKey="id" value="${commentInstance?.issue?.id}" class="form-control" noSelection="['null': '']"/>
</div>

<div class="form-group ${hasErrors(bean: commentInstance, field: 'responses', 'error')} ">
	<label for="responses">
		<g:message code="comment.responses.label" default="Responses" />
		
	</label>
	
<g:each in="${commentInstance?.responses?}" var="r">
    <p><g:link controller="comment" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></p>
</g:each>
<p><g:link class="btn btn-default btn-xs" controller="comment" action="create" params="['comment.id': commentInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'comment.label', default: 'Comment')])}</g:link></p>

</div>

