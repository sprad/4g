<html>
	<head>
		<title>Incident Map</title>		
        <meta name="layout" content="main" />        
		<script type="text/javascript" src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=${mapKey}"></script>
		<g:javascript library="prototype" />
	    <script type="text/javascript">
	      //<![CDATA[
			function load() {					
		      if (GBrowserIsCompatible() && $('incidentMap')) {
		        		
		        var map = new GMap2($('incidentMap'));
				map.setCenter(new GLatLng(39.978030, -95.295274), 4); //White Cloud, KS
	
		        var baseIcon = new GIcon();
		        baseIcon.shadow = "http://www.google.com/mapfiles/shadow50.png";
		        baseIcon.iconSize = new GSize(20, 34);
		        baseIcon.shadowSize = new GSize(37, 34);
		        baseIcon.iconAnchor = new GPoint(9, 34);
		        baseIcon.infoWindowAnchor = new GPoint(5, 1);
		        baseIcon.infoShadowAnchor = new GPoint(18, 25);				    
		
	            <g:each in="${incidentList}" status="i" var="incident">
					var markerHTML = '<div><img src="/4g/images/mugshots/${incident.gangMember.mugshot}" style="height: 35px; width: 35px; float: left;" /></div>';
					markerHTML += '<div style="padding-left: 25px; text-align: left;"><h3 style="display:inline;">${incident}</h3><br/>';
					markerHTML += '<strong>Gang:</strong> ${incident.gangMember.gang}<br />';
					markerHTML += '<strong>Gang Member:</strong> ${incident.gangMember}<br />';
					markerHTML += '</div>';		            

					var point = new GLatLng(${incident.latitude},${incident.longitude});		
					var marker = createMarker(point, '${incident.gangMember.gang.gangColor}', markerHTML);
					map.addOverlay(marker);
				</g:each>
							
				map.enableScrollWheelZoom();		
				map.addControl(new GLargeMapControl());
				map.addControl(new GMapTypeControl());
			  }
			  
	          function createMarker(point, gangColor, markerHtml) {		          
	            var colorIcon = new GIcon(baseIcon);
	            colorIcon.image = '../images/4gtheme/' + gangColor + '.png';

	            markerOptions = { icon:colorIcon };
		        var marker = new GMarker(point, markerOptions);
	            GEvent.addListener(marker, "click", function() {			        
	              marker.openInfoWindowHtml(markerHtml, {maxWidth:700});
	            });
		
	            return marker;
	          }				  
			}			
			
			Event.observe(window, 'load', function() {load()});								
			Event.observe(window, 'unload', function() {GUnload()});
		  //]]>
		</script>							
	</head>
	<body>
		<div id="mapContainer">
    		<div id="incidentMap"></div>
		</div>
    </body>
</html>