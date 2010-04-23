<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Gang List</title>
    </head>
    <body>        
        <g:if test="${flash.message}">
        	<div class="message">${flash.message}</div>
        </g:if>
    	<div class="buttons">
        	<div class="menuButton"><g:link class="create" action="create">New Gang</g:link></div>
    	</div>        
        <div id="gangContainer">
			<table class="gangTable" cellspacing="15" cellpadding="15">
	            <g:each in="${gangList}" status="i" var="gang">
		            <tr>
						<td>
							<g:link action="show" id="${gang.id}"><img src="/4g/images/logos/${gang.logo ?: 'default.gif'}"/></g:link>
						</td>
						<td class="description">
							<strong>Gang Name: </strong><g:link action="show" id="${gang.id}">${gang.name?.encodeAsHTML()}</g:link><br />
							<strong>Gang Color: </strong>${gang.gangColor?.encodeAsHTML()}<br />
			                <strong>Description: </strong>${gang.description?.encodeAsHTML()}<br />		                
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td class="line">
				            <div class="buttons">
				                <g:form controller="gang">
				                    <input type="hidden" name="id" value="${gang?.id}" />
				                    <span class="button"><g:actionSubmit class="view" value="Show" /></span>
				                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
				                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
				                </g:form>
				            </div>								
						</td>
					</tr>
	            </g:each>
            </table>
        </div>
        <!-- <div class="paginateButtons">
            <g:paginate total="${Gang.count()}" />
        </div> -->        
    </body>
</html>
