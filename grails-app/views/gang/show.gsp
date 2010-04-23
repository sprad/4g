<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Gang</title>      
    </head>
    <body>
        <div class="buttons">
            <div class="menuButton"><g:link class="create" controller="gangMember" action="create" params="[id:gang.id]">New Gang Member</g:link></div>
        </div>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <div class="gangContainer">
            	<table class="gangTable" cellspacing="15" cellpadding="15">
                    <g:each var="gangMember" in="${gang.gangMembers.sort()}">
			            <tr>
							<td>
								<img src="/4g/images/mugshots/${gangMember.mugshot ?: 'default.gif'}"/>
							</td>
							<td class="description">
								<strong>${gangMember.encodeAsHTML()}</strong><br />
								<strong>Alias: </strong>${gangMember.alias?.encodeAsHTML()}<br />
				                <strong>Join Date: </strong><g:formatDate format="MMMMM d, yyyy" date="${gangMember.joinDate}"/><br />
				                <strong>Description: </strong>${gangMember.description?.encodeAsHTML()}<br />
				                <br />
				                <strong>Incidents: </strong><br/>
                                <ul>
	                                <g:each var="i" in="${gangMember.incidents.sort()}">
	                                    <li><g:link controller="incident" action="show" id="${i.id}">${i}</g:link></li>
	                                </g:each>
                                </ul>	                             			                
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
        </div>
    </body>
</html>
