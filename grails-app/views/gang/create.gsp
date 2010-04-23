<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Gang</title>         
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
            <g:form action="save" method="post" enctype="multipart/form-data">
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>            
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
                                    <label for="logo">Logo:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:gang,field:'logo','errors')}">
                                    <input type="file" id="logoUpload" name="logoUpload" />
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
            </g:form>
        </div>
    </body>
</html>
