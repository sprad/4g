<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Incident</title>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
          	  <div class="message">${flash.message}</div>
            </g:if>
            <div class="buttons">
                <g:form controller="incident">
                    <input type="hidden" name="id" value="${incident?.id}" />
                    <div class="menuButton"><g:actionSubmit class="edit" value="Edit" /></div>
                    <div class="menuButton"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></div>
                </g:form>
            </div>            
            <div class="dialog">
                <table>
                    <tbody>                    
                        <tr class="prop">
                            <td valign="top" class="name">Incident Id:</td>                            
                            <td valign="top" class="value">${incident.id}</td>                            
                        </tr>                    
                        <tr class="prop">
                            <td valign="top" class="name">Time Of Incident:</td>                            
                            <td valign="top" class="value"><g:formatDate format="MMMMM d, yyyy - hh:mm:ss a" date="${incident.timeOfIncident}"/></td>                            
                        </tr>                    
                        <tr class="prop">
                            <td valign="top" class="name">Type:</td>                            
                            <td valign="top" class="value">${incident.type}</td>                            
                        </tr>                    
                        <tr class="prop">
                            <td valign="top" class="name">Gang Member:</td>                            
                            <td valign="top" class="value"><g:link controller="gangMember" action="show" id="${incident?.gangMember?.id}">${incident?.gangMember}</g:link></td>                            
                        </tr>       
                        <g:if test="${incident.address}">
	                        <tr class="prop">
	                            <td valign="top" class="name">Address:</td>                            
	                            <td valign="top" class="value">${incident.address}</td>                            
	                        </tr>                          	
                        </g:if>                                    
                        <tr class="prop">
                            <td valign="top" class="name">City:</td>                            
                            <td valign="top" class="value">${incident.city}</td>                            
                        </tr>                    
                        <tr class="prop">
                            <td valign="top" class="name">State:</td>                            
                            <td valign="top" class="value">${incident.state}</td>                            
                        </tr>   
                        <g:if test="${incident.zip}">
	                        <tr class="prop">
	                            <td valign="top" class="name">Zip:</td>                            
	                            <td valign="top" class="value">${incident.zip}</td>                            
	                        </tr>                                            	
						</g:if>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
