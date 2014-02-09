<div class="col-xs-12">
	<div class="form-group">
		<h3><g:message code="issue.comments.label" default="Comments" /></h3>
     	<g:each in="${issueInstance.comments}" var="c">
     		<div class="media">
     			<a href="#" class="pull-left">
          			<img alt="64x64" data-src="holder.js/64x64" class="media-object" style="width: 64px; height: 64px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAACGElEQVR4nO2U0YqjQBBF5/8/paARpEFEEEEkCLIEkSBBwqyERkTqF+4+2JNk9jEhc1m2Hg5IosXxVCcfqor/mQ+2ABsLwBZgYwHYAmwsAFuAjQVgC7CxAGwBNhaALcDGArAF2FgAtgAbC8AWYGMB2AJsLABbgI0FYAuwsQAvD9lmtIWHcwKXeDTHCdu3ewLawiNNPbpp+fl57w2woM0EIgKXejjZr5vzXWw+FpD4eT2GH5737gDXfpfMOmyqWC8DDk2D4zmKrWf4KHsTXieU3sP7HP2s0DCg8B7el5h+PzGPGWAZmyjjkGUpkjTDob/cvh9KB5ECp9Phm/BYp/uWswp1nkBEkDbj0/N4Ac7NbRsuSW7X1XDFOrX79WmBfrbxKK/x2Rmlu29SkhrXl+aRA7iih6oiDBVEBEndo/XxmP7q0dUZRAS+ajFdt/3ZU3V7wa/f+CvzKAG+tuLKAaqKbTpE4QFN8rDhB8pTgGpA4x8+9wcsL80jBdBtin9KCaq2RZk6iAjy4yfWJSCEgLCs+IybrPoLNlVcunx/gTRHFl8s7y5Pz+MFUMUydUgeNpIUHcLfJyUe7WZcoNch3u/Qzfcti3iMyxPz2AFUFboGzPOM+fq60FvmvT3AP4wFYAuwsQBsATYWgC3AxgKwBdhYALYAGwvAFmBjAdgCbCwAW4CNBWALsLEAbAE2FoAtwMYCsAXYWAC2AJs/e6oQH1D4sBIAAAAASUVORK5CYII=">
        		</a>
		        <div class="media-body">	
	          		<p class="well" style="min-height: 64px">${c?.text.encodeAsHTML() }</p>
	          		<g:each in="${c.responses}" var="r">
	          			<div class="media" >
			            	<a href="#" class="pull-left">
			              		<img alt="64x64" data-src="holder.js/64x64" class="media-object" style="width: 64px; height: 64px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAACGElEQVR4nO2U0YqjQBBF5/8/paARpEFEEEEkCLIEkSBBwqyERkTqF+4+2JNk9jEhc1m2Hg5IosXxVCcfqor/mQ+2ABsLwBZgYwHYAmwsAFuAjQVgC7CxAGwBNhaALcDGArAF2FgAtgAbC8AWYGMB2AJsLABbgI0FYAuwsQAvD9lmtIWHcwKXeDTHCdu3ewLawiNNPbpp+fl57w2woM0EIgKXejjZr5vzXWw+FpD4eT2GH5737gDXfpfMOmyqWC8DDk2D4zmKrWf4KHsTXieU3sP7HP2s0DCg8B7el5h+PzGPGWAZmyjjkGUpkjTDob/cvh9KB5ECp9Phm/BYp/uWswp1nkBEkDbj0/N4Ac7NbRsuSW7X1XDFOrX79WmBfrbxKK/x2Rmlu29SkhrXl+aRA7iih6oiDBVEBEndo/XxmP7q0dUZRAS+ajFdt/3ZU3V7wa/f+CvzKAG+tuLKAaqKbTpE4QFN8rDhB8pTgGpA4x8+9wcsL80jBdBtin9KCaq2RZk6iAjy4yfWJSCEgLCs+IybrPoLNlVcunx/gTRHFl8s7y5Pz+MFUMUydUgeNpIUHcLfJyUe7WZcoNch3u/Qzfcti3iMyxPz2AFUFboGzPOM+fq60FvmvT3AP4wFYAuwsQBsATYWgC3AxgKwBdhYALYAGwvAFmBjAdgCbCwAW4CNBWALsLEAbAE2FoAtwMYCsAXYWAC2AJs/e6oQH1D4sBIAAAAASUVORK5CYII=">
			            	</a>
			            	<div class="media-body">
			            		<p class="well" style="min-height: 64px">${r?.encodeAsHTML()}</p>
		            		</div>
	          			</div>
	       			</g:each>
	    		</div>
	   		</div>
  		</g:each>
	 	<br />		
		<p>
		<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
	  		${message(code: 'default.add.label', args: [message(code: 'comment.label', default: 'Comment')])}
		</button>
		<g:link class="btn btn-default btn-xs col-xs-2" controller="comment" action="create" params="['issue': issueInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'comment.label', default: 'Comment')])}
		</g:link>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        <g:render template="modal_comment" />
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>