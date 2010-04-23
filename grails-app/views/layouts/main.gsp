<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
    <head>
        <title><g:layoutTitle default="Groovy, Grails, Google, and Gangs" /></title>
        <link rel="stylesheet" href="${createLinkTo(dir:'css/4gtheme',file:'main.css')}" />
        <link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />				
    </head>
    <body>
    	<div class="container">
    		<div class="header">
    			<h1></h1>
    			<div class="nav">
	            	<span class="menuButton"><a href="${createLinkTo(dir:'')}">Home</a></span>
	            	<span class="menuButton"><a href="${createLinkTo(dir:'gang')}">Gangs</a></span>
	            	<span class="menuButton"><a href="${createLinkTo(dir:'incident')}">Incidents</a></span>
	            	<span class="menuButton"><a href="${createLinkTo(dir:'trends')}">Trends</a></span>
	        	</div> 
    		</div>    		
     
	        <g:layoutBody />	
	        
	        <div class="footer">
	        	Groovy, Grails, Google, and Gangs - Justin Spradlin
	        </div>	        	
    	</div>	
    </body>	
</html>