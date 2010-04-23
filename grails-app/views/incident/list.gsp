<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Incident List</title>
    </head>
    <body>
    	<div class="buttons">
        	<div class="menuButton"><g:link class="create" action="create">New Incident</g:link></div>
    	</div>
        <div class="body">
            <g:if test="${flash.message}">
           	 <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
							<g:sortableColumn property="type" title="Type" />                        
                   	        <g:sortableColumn property="timeOfIncident" title="Time Of Incident" />                        
                   	        <th>Gang Member</th>                   	    
                   	        <g:sortableColumn property="city" title="City" />                        
                   	        <g:sortableColumn property="state" title="State" />                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${incidentList}" status="i" var="incident">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">                        
                            <td><g:link action="show" id="${incident.id}">${incident.type?.encodeAsHTML()}</g:link></td>
                            <td><g:formatDate format="MMMMM d, yyyy" date="${incident.timeOfIncident}"/></td>                        
                            <td>${incident.gangMember?.encodeAsHTML()}</td>                        
                            <td>${incident.city?.encodeAsHTML()}</td>                        
                            <td>${incident.state?.encodeAsHTML()}</td>                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Incident.count()}" />
            </div>
        </div>
    </body>
</html>
