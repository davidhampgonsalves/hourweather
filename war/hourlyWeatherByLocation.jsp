<%@page contentType="text/html" %>
<!doctype html>
<html>
<head>
	<meta name='keywords' content='weather forecast android location hour hourly'></meta>
	<meta name='description' content='super accurate location aware hourly weather forecast and android app'> </meta>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
  	<meta name="apple-mobile-web-app-capable" content="yes" /> 
	<title> Hour Weather is location based, dead easy, forecasting </title>	
	<script type="application/javascript" src="https://www.google.com/jsapi?key=ABQIAAAAtBXrBPeu06XUpudOXcQOuxRX2HH5zuNNjZghGMsxwI9-Ikp8AhSUmG3y0tErgw-y4DIX6YIBfiIDCw"></script>
	<script type="application/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
	<script type="application/javascript">
	  var _gaq = _gaq || [];
	  _gaq.push(['_setAccount', 'UA-19849283-3']);
	  _gaq.push(['_trackPageview']);
	
	  (function() {
	    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	  })();
	
	</script>
	<style>
		* {margin:0;padding:0;}
		
		body {
			background: #eaf1ff;
			font:15px helvetica,arial,freesans;
			color:#333;
		}
		
		h2 {
			font-size:15px;
			display:inline;
		}
		
		.obj, .rope, #title a {
			background: transparent url(/images/all.png) 0 0 no-repeat
		}
		
		#head {
			background:white;
			width:100%;
			height:300px;
			position:relative;
		}
		
		#clouds {
			height: 120px;
			width: 100%;
			background: transparent url('/images/cloud.png') center bottom repeat-x;
			z-index: 2;
			bottom:0;
			position:absolute;
		}
		
		#diorama {
			width:1000px;
			margin:0 auto;
			z-index: 1;
			position:relative;
		}
		
		#title {
			padding-top: 50px;
			
		}
		
		#title a {
			position: absolute;
			left:300px;
			display:block;
			width: 430px;
			height:150px;
			z-index:2;
			background-position:-267px -5px
		}
		
		#title a:hover {margin-top:4px;}
		
		#g-plusone-container {
			position: absolute;
			left:620px;
			top:160px;
			z-index:3;
		}
		
		#body {
			position:relative;
			background: #eaf1ff;
			padding-top:90px;
			z-index:2;
			margin:0 auto;
		}
		
		.content {
			margin: 0 auto;
			width:1000px;
		}
		
		#forecast {
			min-height: 500px;
			margin-top:-20px;
		}

		#controls {
			height:0;
			float:right;
		}
		
		#controls select {
			margin-right:5px;
		}
		
		#side-bar {
			width:200px;
			float:left;
		}
		
		.hour {
			background:rgb(250,250,250);
			overflow:auto;
			padding:5px 0;
			border-bottom: 2px solid rgb(230,230,230);
		}
		
		.day-start {
			background:#d8f6ea;
			line-height: 50px;
			height: 50px;
			padding-left:20px;
			font-size: 18px;
		}
		
		.hour.alt {background: #dcefff}
		
		.hour.night {background:#d8dfe4; border-bottom: 2px solid rgb(200,200,220);}
		.hour.night.alt {background:rgb(235, 240, 245)}
		
		.hour div {
			font-size:20px;
			float:left;
			height:70px;
			line-height: 70px;
			text-align:center;
			margin-right: 10px;
		}
		
		div.time {width:180px;font-size:22px;}
		div.symbol {
			width:70px;
			margin-top:0;
		}
		div.wind {width:250px;}
		div.temp {width:250px;}
		div.precip {width:210px;margin-right:0}
		
		.cold {color: #3F6B94}
		.hot {color: #9E1008}
		
		.strong {color: #EE5709}
		.moderate {color:#FCA21E}
		
		label {
			font-size:15px;
			color: black;
		}
		
		#about {
			font-size: 15px;
			margin:70px auto;
		}
		
		#about div {
			font-size: 10px;
			margin-top: 40px;
			text-align: center;
		}
		
		#marketing-blurb {
			font-size: 18px;
			border-radius: 8px;
			padding: 30px;
			width:630px;
			margin: 0 auto;
			margin-top:50px;
		}
		
		.important {
			text-align: center;
			font-size: 25px;
			font-weight:bold;
		}
		
		/* weather diorama */
		.hanging-obj {
			position:absolute;
			height:300px;
			width:160px;
			background: transparent;
			top:-320px;
		}
		
		.rope {
			width:10px;
			height:250px;
			background-position: -1077px 0;
			margin:0 auto;
			z-index:2;
			position:relative;
		}
		
		.obj {
			margin:0 auto;
			margin-top:-10px;
			height:70px;
			width: 70px;
		}
		
		.hanging-obj.sm .obj {
			height:50px;
			width: 50px;
			margin-top:-20px;
		}
		
		.hanging-obj.lg .obj {
			height:160px;
			width:160px;
			margin-top:-20px;
		}
		
		.hanging-obj.day .obj {background-position: -695px 0}
		.hanging-obj.night .obj {background-position: -866px 0}

		#day-night-sm.day .obj {background-position: -1026px -30px;}		
		#day-night-sm.night .obj {background-position: -1026px -74px;}

		
		#day-night {left:680px; top:-190px;}
		#day-night-sm {left:180px; top:-160px;}
		
		#weather-1 {left:0;}
		#weather-2 {left:900px;}
		
		#permissions_area {
			width:300px;
			margin:0 auto;
			display: block;
			position:absolute;
			right:20px;
			top:-150px;
			z-index: 3;
		}

		#arrow {
			border: 20px solid transparent;
			border-bottom: 20px solid #afcdf3;
			width: 0;
			margin-top: -20px;
			margin-left: 230px;
		}

		#permissions_msg {	
			border: 10px solid #afcdf3;
			background:white;
			padding: 10px;
			-moz-border-radius: 10px;
			-webkit-border-radius: 10px;
			border-radius: 10px;
		}
		
		.loading {
			margin:0 auto;
			width:175px;
		}
		
		.loading .obj {
			-webkit-animation-name: rotate;
			-webkit-animation-duration: 5s;
			-webkit-animation-iteration-count: infinite;
			-webkit-animation-timing-function: linear;

			-moz-animation-name: rotate; 
			-moz-animation-duration: 5s; 
			-moz-animation-iteration-count: infinite;
			-moz-animation-timing-function: linear;
			
			background-position: -695px 0;
			height:160px;
			width:160px;
    		margin:0 auto;
		}
		
		.loading-text {
			position:relative;
			background: #eaf1ff;
			width:100%;
			height: 95px;
			margin-top: -90px;
			z-index:5;
			font-size: 25px;
			font-weight:900;
			color: rgb(100,100,100);
			line-height: 60px;
			border-top: 2px solid rgb(200,200,200);
			text-align:center; 
		}

		@-webkit-keyframes rotate {
			from {-webkit-transform:rotate(0deg);}
			to {-webkit-transform:rotate(360deg);}
		}

		@-moz-keyframes rotate {
		    from {-moz-transform: rotate(0deg);}
		    to {-moz-transform: rotate(360deg);}
		}
	</style>
</head>
	<body>
<div id=head>
		<div id='permissions_area'>
			<div id='arrow'> </div>
			<div id='permissions_msg'>
				Allow your browser to share your rough location with us and we'll create an awesome hourly forecast just for you.
			</div>
		</div>
		<div id=diorama>	
			<div id=day-night class='lg hanging-obj day'>
				<div class=rope></div>
				<div class=obj> </div>
			</div>

			<div id=day-night-sm class='sm hanging-obj day'>
				<div class=rope></div>
				<div class='obj'></div>
			</div>
			
			<div id=weather-1 class='hanging-obj'>
				<div class=rope></div>
				<div class='obj bird'></div>
			</div>
			
			<div id=weather-2 class='hanging-obj'>
				<div class=rope></div>
				<div class='obj'></div>
			</div>
			<div id=title>
				<a href='/'></a>
				<div id=g-plusone-container><g:plusone></g:plusone></div>
			</div>
		</div>
		<div id=clouds> </div>
	</div>
	<div id=body>
		<div id=forecast class=content>
			<div id=marketing-blurb>
				<div class=important>	
				Hassle free forecasting based on your location!
				</div>    
				Wherever you are Hour Weather takes the hassle out of checking the forecast by figuring out the nearest weather station automatically. Stop bookmarking local weather forecasts and let Hour Weather simplify your day.
			</div>
		</div>
					
		<div id=about class=content>
			<h3>about</h3>Hour Weather uses the geo capatabilities of HTML5 to determine your rough location and then based on that is able to create a forecast just for you using the awesome <a href='http://www.yr.no/'>yr.no</a> weather service.
			<br><br>
			In the office, from your home or on vacation, Hour Weather will always give you a super accurate hourly weather forecast. 
			
			<div>a weekend project by <a href='http://www.davidhampgonsalves.com'>david hamp-gonsalves</a>.</div>
		</about>
	</div>
	<script type='text/javascript'>
		  (function() {
		    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
		    po.src = 'https://apis.google.com/js/plusone.js';
		    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
		  })();

		
		 /* This is a small part of jQuery Easing v1.3 - http://gsgd.co.uk/sandbox/jquery/easing/
		 That is used under a BSD Liscense and was created by: George McGinley Smith */
		jQuery.easing['jswing'] = jQuery.easing['swing'];

		jQuery.extend( jQuery.easing,
		{
			def: 'easeOutQuad',
			swing: function (x, t, b, c, d) {
				return jQuery.easing[jQuery.easing.def](x, t, b, c, d);
			},
			easeOutQuad: function (x, t, b, c, d) {
				return -c *(t/=d)*(t-2) + b;
			},
			easeOutBounce: function (x, t, b, c, d) {
				if ((t/=d) < (1/2.75)) {
					return c*(7.5625*t*t) + b;
				} else if (t < (2/2.75)) {
					return c*(7.5625*(t-=(1.5/2.75))*t + .75) + b;
				} else if (t < (2.5/2.75)) {
					return c*(7.5625*(t-=(2.25/2.75))*t + .9375) + b;
				} else {
					return c*(7.5625*(t-=(2.625/2.75))*t + .984375) + b;
				}
			}
		});

		window.locationReturned = false;
		if (typeof(localStorage) == 'undefined' ) 
			alert('Sorry, your browser is just too old to handle this site.');
		else if(isFirstVisit()) {
			localStorage.setItem('celsius', true);
			localStorage.setItem('metric', true);
		}
		
		jQuery.easing.def = "easeOutBounce";
		
		if (navigator.geolocation) {
 			window.setTimeout(setPermissionVisibility, 1100); 			
 			//request location
 			navigator.geolocation.getCurrentPosition(getForecast, showLocationError, {timeout: 5000}); 			
		} else {
			alert('Sorry but your browser is just to darn old.  It doesn\'t support GeoLocation.');
		}
		
		function getForecast(position) {
			window.locationReturned = true;
			setPermissionVisibility(false);
			
			//set loading indicator
			$('#main').html('<div class=loading><div class=obj></div><div class=loading-text>loading...!</div></div>');
			
			$.getJSON("HourlyWeatherByLocation", {lat: position.coords.latitude, long: position.coords.longitude, timezoneOffset: - new Date().getTimezoneOffset()/60}, function(json) {displayForecast(json, position);}).error(showError);
		}
		
		function displayForecast(json, position) {
			window.forecastData = json;
			
			//make sure the dom is ready
			$().ready(function() {
				if(window.forecastData.error != undefined)
					alert(window.forecastData.error);
				
				var forecastHours = window.forecastData.forecastHours;
				
				//set the day/night status + set the position
				animateDiorama(forecastHours[0]);
				
				var forecastArea = $('#forecast');
				forecastArea.html('');
				var forecastLength = forecastHours.length;
				for(var i=0; i < forecastLength ; i += 1) {
					var hour = forecastHours[i];
					if(hour.date != undefined)
						if(i == 0)
							forecastArea.append('<div class=day-start>' + hour.date + ' @ <a href=\'http://maps.google.com/maps?q=' + position.coords.latitude + ',' + position.coords.longitude + '\'>(' + Math.round(position.coords.latitude) + '&deg;,' + Math.round(position.coords.longitude)  + '&deg;)</a><div id=controls><label>units: </label><select id=units><option value=metric>metric</option><option value=imperial>imperial</option></select> <select id=temp-units><option value=celsius>celsius</option><option value=fahrenheit>fahrenheit</option></select></div></div>');
						else
							forecastArea.append('<div class=day-start>' + hour.date + '</div>');
					//add the forecast data to the forecast area
					forecastArea.append('<div class=\'hour ' + (hour.sunUp ? '':'night ') + (i % 2 == 0 ? '':'alt') + '\'> <div class=time>' + hour.hour + '</div> <div class=\'symbol obj\' style=\'background-position:' + (-71.5 * (hour.symbolCode - 1)) + (hour.sunUp ? 'px -160px':'px -230px') + '\'></div> <div class=\'temp ' + howHot(hour) + '\'><label>temperature: </label><span class=val>' + getTemp(hour) + '</span></div> <div class=\'wind ' + howWindy(hour) + '\'><label>wind speed: </label><span class=val>' + getWind(hour) + '</span></div> <div class=precip><label>precipitation: </label><span class=val>' + getPrecip(hour) + '</span></div> </div>');
					console.log(hour.temp + ' - ' +howHot(hour));
				}
				
				//hook up the control events/settings
				var controls = $('#controls');
				controls.find('select').change(updateUnitConfig);
				controls.find('#temp-units').val(isCelsius() ? 'celsius':'fahrenheit');
				controls.find('#units').val(isMetric() ? 'metric':'imperial');
			});
		}
		
		function howHot(hour) {
			if(hour.temp > 24)
				return 'hot';
			if(hour.temp <= 0)
				return 'cold';
			return '';
		}
		
		function howWindy(hour) {
			if(hour.wind >= 25)
				return 'strong';
			if(hour.wind >= 15)
				return 'moderate';			
			return '';
		}
		
		function getTemp(hour) {
			if(isCelsius()) 
				return Math.round(hour.temp) + '\u2103';
			else 
				return Math.round(1.8 * hour.temp + 32) + '\u2109';
		}
		
		function getWind(hour) {
			if(isMetric())
				return Math.round(hour.wind * 3.6) + ' km/h';
			else
				return Math.round(hour.wind) + ' mph';
		}
		
		function getPrecip(hour) {
			if(hour.precip == 0) return 'none';
			
			var precip;
			if(isMetric()) precip = formatDouble(hour.precip);
			else precip = formatDouble(hour.precip * 0.03937);
			
			if(precip === 0) return 'trace';
			
			if(isMetric()) return precip + ' mm';
			else return precip + '\'';
		}
		
		function formatDouble(double) {
			return Math.round(double * 100) / 100;
		}
		
		function isMetric() {return localStorage.getItem('metric') === 'true';}
		function isCelsius() {return localStorage.getItem('celsius') === 'true';}
		function isFirstVisit() {return  localStorage.getItem('metric') == null;}
		
		function updateUnitConfig() {
			var setting = $(this).val();
			switch(setting)
			{
				case 'metric':
				  localStorage.setItem('metric', true);
				  break;
				case 'imperial':
				  localStorage.setItem('metric', false);
				  break;
				case 'celsius':
					localStorage.setItem('celsius', true);
					break;
				case 'fahrenheit':
					localStorage.setItem('celsius', false);
					break;
			}
			
			updateForecast();
		}
		
		function updateForecast() {
			var hourNodes = $('#forecast').children('.hour');
			
			var forecastHours = window.forecastData.forecastHours;
			var forecastLength = forecastHours.length;
				for(var i=0; i < forecastLength ; i += 1) {
					var hour = forecastHours[i];
					$(hourNodes[i]).find('.temp .val').html(getTemp(hour));
					$(hourNodes[i]).find('.wind .val').html(getWind(hour));
					$(hourNodes[i]).find('.precip .val').html(getPrecip(hour));
				}
		}
		
		function animateToDark(object) {
			var brightness = 255;
			var interval = setInterval(function() {
				if(brightness > 100) {
					object.css('background-color','rgb(' + brightness + ',' + brightness + ',' + brightness + ')');
					brightness -= 5;
				}else
					 clearInterval(interval);
			}, 50);
		}
		
		function animateDiorama(firstForecastHour) {
			//if night then we need to remove the sun first
			if(!firstForecastHour.sunUp) {
				//pull up the sun
				$('#day-night').animate({'top':'-400px'}, {duration:1100, easing:'easeOutQuad'});
				$('#day-night-sm').animate({'top':'-400px'}, {duration:1100, easing:'easeOutQuad', complete:function() {performDropAnimation(firstForecastHour)}});
			} else
				performDropAnimation(firstForecastHour);		
		}
		
		function performDropAnimation(forecastHour) {
			//set the day/night states
			if(!forecastHour.sunUp) {
				$('.day').removeClass('day').addClass('night');
				animateToDark($('#head'));
			}
			//position the sun/moon based on the forecast
			$('#day-night').animate({'top': -193 + (forecastHour.symbolCode > 5? (16 * forecastHour.symbolCode - 1):0) + 'px'}, 2500);
			$('#day-night-sm').animate({'top':-160 + (9 * forecastHour.symbolCode - 1) + 'px'}, 3000);
			
			//change the state of the weather icons
			//avoid using icons with sun/moons
			var symbolCode = forecastHour.symbolCode - 1;
			if(symbolCode < 2) symbolCode = 2;
			if(symbolCode == 4) symbolCode = 8
			if(symbolCode > 4 && symbolCode < 8) symbolCode += 5;

			$('#weather-1 .obj, #weather-2 .obj').css('background-position', -71.5 * symbolCode + 'px -160px');
			//drop the weather icons
			$('#weather-1').animate({'top':'-100px'}, 2800);
			$('#weather-2').animate({'top':'-60px'}, 2500);
		}
		
		
		function showError(error) {
			alert('Sorry, but it looks like we\'ve hit some troubles generating your forecast!  Why don\'t you try again.');
		}
		
		function showLocationError(error) {
			var errors = {
				1: 'Permission denied',
			    2: 'Position unavailable',
			    3: 'Request timeout'};
			  alert("Sorry, we were unable to detect your location because: " + errors[error.code]);
		}
		
		
		function setPermissionVisibility(visible) {
			var permissionsDialog = $('#permissions_area');
			if((visible == undefined || !visible) && !window.locationReturned)
				permissionsDialog.animate({'top':'0'}); 
			else
				permissionsDialog.animate({'top':'-150px'}); 
		}
	</script>
	</body>
</html>