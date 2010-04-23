<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create GangMember</title>         
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
           	 <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${gangMember}">
            <div class="errors">
                <g:renderErrors bean="${gangMember}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" enctype="multipart/form-data">
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>            
                <div class="dialog">
                    <table>
                        <tbody>                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="firstName">First Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:gangMember,field:'firstName','errors')}">
                                    <input type="text" maxlength="50" id="firstName" name="firstName" value="${fieldValue(bean:gangMember,field:'firstName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastName">Last Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:gangMember,field:'lastName','errors')}">
                                    <input type="text" maxlength="50" id="lastName" name="lastName" value="${fieldValue(bean:gangMember,field:'lastName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="gang">Gang:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:gangMember,field:'gang','errors')}">
                                    <g:select optionKey="id" from="${Gang.list()}" name="gang.id" value="${params.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="alias">Alias:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:gangMember,field:'alias','errors')}">
                                    <input type="text" maxlength="50" id="alias" name="alias" value="${fieldValue(bean:gangMember,field:'alias')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="joinDate">Join Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:gangMember,field:'joinDate','errors')}">
                                    <g:datePicker name="joinDate" value="${gangMember?.joinDate}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="mugshot">Mugshot:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:gangMember,field:'mugshot','errors')}">
                                    <input type="file" id="mugshotUpload" name="mugshotUpload" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:gangMember,field:'description','errors')}">
                                    <textarea id="description" name="description">${fieldValue(bean:gangMember,field:'description')}</textarea>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
            </g:form>
        </div>
    </body>
</html>
