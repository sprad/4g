<html>
	<head>
		<meta http-equiv="Content-type" content="text/html; charset=utf-8">
		<meta name="layout" content="main" />
		<title>Gang Charts</title>	
		<g:javascript library="prototype" />	
	</head>
	<body>
		<div class="chartContainer">			
			<h1>Incident Type By Gang</h1>			
			<div>		
				<div>
					<g:form  name="incident_by_gang_form">
						<g:select noSelection="['0':'Select a Gang']" optionKey="id" from="${Gang.list().sort()}" name="gang.id" onchange="${remoteFunction(action:'incidentTypeByGang',update:'incident_type_by_gang', , params:'Form.serialize(this.form)')}" />
					</g:form >						
				</div>							
				<div id="incident_type_by_gang">
					<img src="http://chart.apis.google.com/chart?cht=p3&chd=t:50,50&chs=525x170&chl=Incident Type 1: N|Incident Type 2: N" />
				</div>			
			</div>
		</div>
		
		<hr/>
		
		<div class="chartContainer">							
			<h1>Incident Type By Year</h1>
			<div>
				<div>
					<g:form  name="incident_by_year_form">
						<g:select noSelection="['0':'Select a Year']" name="year" from="${2000..(new Date().year + 1900)}" onchange="${remoteFunction(action:'incidentTypePerYear',update:'incident_type_by_year', , params:'Form.serialize(this.form)')}" />
					</g:form >		
				</div>
				<div id="incident_type_by_year">
					<img src="http://chart.apis.google.com/chart?cht=bvg&chxt=y&chxr=0,0,5&chbh=95,1&chd=t:0,0,0,0&chs=549x299&chl=Disturbing the Peace|Grand Theft Auto|Movie Pirating|Shoplifting" />
				</div>				
			</div>
		</div>
    </body>
</html>