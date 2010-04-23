<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>GangMember List</title>
    </head>
    <body>
        <div class="buttons">
            <div class="menuButton"><g:link class="create" action="create">New GangMember</g:link></div>
        </div>
        <div class="body">
            <g:if test="${flash.message}">
           	 <div class="message">${flash.message}</div>
            </g:if>
            <div class="gangContainer">
            	<table class="gangTable" cellspacing="15" cellpadding="15">
                    <g:each in="${gangMemberList}" status="i" var="gangMember">
			            <tr>
							<td>
								<g:link action="show" id="${gangMember.id}"><img src="/4g/images/mugshots/${gangMember.mugshot ?: 'default.gif'}"/></g:link>
							</td>
							<td class="description">
								<g:link action="show" id="${gangMember.id}">${gangMember.encodeAsHTML()}</g:link><br />
								<strong>Alias: </strong>${gangMember.alias?.encodeAsHTML()}<br />
				                <strong>Join Date: </strong><g:formatDate format="MMMMM d, yyyy" date="${gangMember.joinDate}"/><br />
				                <strong>Description: </strong>${gangMember.description?.encodeAsHTML()}<br />
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td class="line">
					            <div class="buttons">
					                <g:form controller="gangMember">
					                    <input type="hidden" name="id" value="${gangMember?.id}" />
					                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
					                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
					                </g:form>
					            </div>   							
							</td>
						</tr>							
                    </g:each>
                </table>
            </div>            
            <div class="paginateButtons">
                <g:paginate total="${GangMember.count()}" />
            </div>
        </div>
    </body>
</html>
