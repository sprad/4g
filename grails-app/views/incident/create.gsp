<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Incident</title>         
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${incident}">
            <div class="errors">
                <g:renderErrors bean="${incident}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="buttons">
                    <div class="button"><input class="save" type="submit" value="Create" /></div>
                </div>            
                <div class="dialog">
                    <table>
                        <tbody>                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="timeOfIncident">Time Of Incident:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:incident,field:'timeOfIncident','errors')}">
                                    <g:datePicker name="timeOfIncident" value="${incident?.timeOfIncident}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="type">Type:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:incident,field:'type','errors')}">
                                    <g:select id="type" name="type" from="${incident.constraints.type.inList.collect{it.encodeAsHTML()}}" value="${fieldValue(bean:incident,field:'type')}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="gangMember">Gang Member:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:incident,field:'gangMember','errors')}">
                                    <g:select optionKey="id" from="${GangMember.list()}" name="gangMember.id" value="${params.id}"></g:select>
                                </td>
                            </tr> 
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="address">Address:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:incident,field:'address','errors')}">
                                    <input type="text" id="address" name="address" value="${fieldValue(bean:incident,field:'address')}"/>
                                </td>
                            </tr>                             
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="city">City:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:incident,field:'city','errors')}">
                                    <input type="text" id="city" name="city" value="${fieldValue(bean:incident,field:'city')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="state">State:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:incident,field:'state','errors')}">
                                    <g:select id="state" name="state" from="${incident.constraints.state.inList.collect{it.encodeAsHTML()}}" value="${fieldValue(bean:incident,field:'state')}" ></g:select>
                                </td>
                            </tr> 
                        </tbody>
                    </table>
                </div>
            </g:form>
        </div>
    </body>
</html>
