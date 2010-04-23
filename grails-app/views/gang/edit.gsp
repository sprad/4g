<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Gang</title>
    </head>
    <body>  	
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${gang}">
            <div class="errors">
                <g:renderErrors bean="${gang}" as="list" />
            </div>
            </g:hasErrors>
            <g:form controller="gang" method="post" enctype="multipart/form-data">
	        <div class="buttons">
	            <span class="button"><g:actionSubmit class="save" value="Update" /></span>
	            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
	        </div>              
                <input type="hidden" name="id" value="${gang?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:gang,field:'name','errors')}">
                                    <input type="text" maxlength="50" id="name" name="name" value="${fieldValue(bean:gang,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="gangColor">Gang Color:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:gang,field:'gangColor','errors')}">
                                    <g:select id="gangColor" name="gangColor" from="${gang.constraints.gangColor.inList.collect{it.encodeAsHTML()}}" value="${fieldValue(bean:gang,field:'gangColor')}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:gang,field:'description','errors')}">
                                    <textarea id="description" name="description">${fieldValue(bean:gang,field:'description')}</textarea>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="gangMembers">Gang Members:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:gang,field:'gangMembers','errors')}">
                                    
									<ul>
									<g:each var="g" in="${gang?.gangMembers?}">
									    <li><g:link controller="gangMember" action="show" id="${g.id}">${g}</g:link></li>
									</g:each>
									</ul>
									<g:link controller="gangMember" params="["gang.id":gang?.id]" action="create" params="[id:gang.id]">Add GangMember</g:link>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
            </g:form>
        </div>
    </body>
</html>