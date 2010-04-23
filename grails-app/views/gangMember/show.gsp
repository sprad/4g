

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show GangMember</title>
    </head>
    <body>
        <div class="body">
            <div class="buttons">
                <g:form controller="gangMember">
                    <input type="hidden" name="id" value="${gangMember?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>        	
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${gangMember.id}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">First Name:</td>
                            
                            <td valign="top" class="value">${gangMember.firstName}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Last Name:</td>
                            
                            <td valign="top" class="value">${gangMember.lastName}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Gang:</td>
                            
                            <td valign="top" class="value"><g:link controller="gang" action="show" id="${gangMember?.gang?.id}">${gangMember?.gang}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Alias:</td>
                            
                            <td valign="top" class="value">${gangMember.alias}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Join Date:</td>
                            
                            <td valign="top" class="value">${gangMember.joinDate}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Mugshot:</td>
                            
                            <td valign="top" class="value">${gangMember.mugshot}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Description:</td>
                            
                            <td valign="top" class="value">${gangMember.description}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Incidents:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="i" in="${gangMember.incidents}">
                                    <li><g:link controller="incident" action="show" id="${i.id}">${i}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
