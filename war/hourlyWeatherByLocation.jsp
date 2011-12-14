<%@page contentType="text/html" %>
<!doctype html>
<html>
<head>
	<meta name='keywords' content='weather forecast location hour hourly'></meta>
	<meta name='description' content='super accurate location aware hourly weather forecasts'> </meta>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
  	<meta name="apple-mobile-web-app-capable" content="yes" /> 
	<title> Hour Weather is your location based, dead easy, weather forecasting app</title>	
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
		
		a {color: #333;}
		
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
			margin-top:-50px;
		}

		.controls {
			height:0;
			float:right;
			margin-right: 10px;
			font-size:15px;
		}
		
		#controls select {
			margin-right:5px;
		}
		
		#side-bar {
			width:200px;
			float:left;
		}
		
		.day-start {
			background:#d8f6ea;
			line-height: 80px;
			height: 80px;
			padding-left:20px;
			font-size:20px;
		}
		
		#links {
			float:right;
			text-align:right;
			margin-top:-30px;
		}
		
		#links a {
			text-decoration:none;
			background: white;
			border-radius: 5px;
			padding:5px;
		}
		
		#links a:hover {
			padding:8px;
		}
		
		#links a.selected {
			padding:8px;
		}
		
		#forecast .day {
			display:block;
			color:#333;
			height:150px;
			text-decoration:none;
		}
		#forecast .day:hover {background:#E7CCB2;}

		.day .date {
			float:left;
			width: 150px;
		}

		#forecast .day div {text-align:center; width: 166px; float:left}
		.day .date {padding-top: 30px;}
		.day .date .day-of-week {font-size: 25px;}
		.day .date .month {font-size: 16px;}
		.day .date .day-of-month {font-size: 40px;}
		.day .date .day-of-month span {font-size: 12px;}

		#forecast .day .icon.single .symbol {height: 105px;width:105px;margin-top:10px;background-size: 1629px 445px;}
		.day .icon.single .symbol.right {display:none}

		.day .icon.double .symbol.left {width:75px;}
		.day .icon.double .symbol.right {width:75px;}

		#forecast .day div.wind {width: 250px}
		#forecast .day div.temp {width: 250px} 
		#forecast .day div.precip {}
		.day label {display:block; padding-top: 40px;}
		.day .val {font-size: 25px; padding-top: 20px; display:block}
		
		.hour {
			padding:5px 0;
		}

		.row {
			background:rgb(250,250,250);
			overflow:auto;
			border-bottom: 2px solid rgb(230,230,230);
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
				Share your location and we'll build an awesome hourly weather forecast just for you!
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
		<a name=top></a>
		<div id=forecast class=content>
			<div id=marketing-blurb>
				<div class=important>	
				Hassle free forecasting based on your location!
				</div>    
				Wherever you are Hour Weather takes the hassle out of checking the forecast by figuring out the nearest weather station automatically. Stop bookmarking local weather forecasts and let Hour Weather simplify your day.
			</div>
		</div>
					
		<div id=about class=content>
			<h3>about</h3>Hour Weather uses the geo capatabilities of HTML5 to determine your rough location and then based on that is able to create a weather forecast just for you using the awesome <a href='http://www.yr.no/'>yr.no</a> weather forecasting service.
			<br><br>
			In the office, from your home or on vacation, Hour Weather will always give you a super accurate hourly weather forecast. 
			
			<div>a weekend project by <a href='http://www.davidhampgonsalves.com'>david hamp-gonsalves</a>.</div>
		</about>
	</div>
	<script type='text/javascript'>
		<% if(request.getAttribute("city") != null) { %>
				var cityInfo = {city: '<%= request.getAttribute("city") %>', lat: <%= request.getAttribute("lat") %>, lon:<%= request.getAttribute("lon") %>, timeOffset: <%= request.getAttribute("timezone") %>};
		<%}%>
		
		//google +1 button	
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

		var DAY = 'day';
		var WEEKLY = '#weekly';
		var SUFFIXES = ['st', 'nd', 'rd', 'th'];
	
		var locationReturned = false;
		if (typeof(localStorage) == 'undefined') 
			alert('Sorry, your browser is just too old to handle this site.');
		else if(isFirstVisit()) {
			localStorage.setItem('celsius', true);
			localStorage.setItem('metric', true);
		}
		
		jQuery.easing.def = "easeOutBounce";
		
		if(typeof cityInfo !== "undefined")
			getForecast(cityInfo);
		else if (navigator.geolocation) {
 			window.setTimeout(setPermissionVisibility, 1100); 			
 			//request location
 			navigator.geolocation.getCurrentPosition(getForecast, showLocationError, {timeout: 5000}); 			
		} else
			alert('Sorry but your browser is just to darn old.  It doesn\'t support GeoLocation.');
		
		function getForecast(positionData) {
			locationReturned = true;
			setPermissionVisibility(false);
			
			//set loading indicator
			$('#forecast').html('<div class=loading><div class=obj></div><div class=loading-text>loading...!</div></div>');
					
			if(positionData.city == undefined)
				var position = {lat: positionData.coords.latitude, lon: positionData.coords.longitude, timeOffset: - new Date().getTimezoneOffset()/60};
			else
				var position = {city: positionData.city, lat: positionData.lat, lon: positionData.lon, timeOffset: positionData.timeOffset};
				
			
			$.getJSON("/HourlyWeatherByLocation", {lat: position.lat, long: position.lon, timezoneOffset: position.timeOffset}, function(json) {displayForecast(json, position);}).error(showError);
		}
		
		function displayForecast(forecast, position) {
			
			//make sure the dom is ready
			$().ready(function() {
				if(forecast.error != undefined)
					alert(forecast.error);		
				
				//set the day/night status + set the position
				animateDiorama(forecast.forecastHours[0]);
				
				var forecastArea = $('#forecast');
				forecastArea.html('');
				displayLinks(forecastArea);
				
				$(window).off('hashchange');
				$(window).on('hashchange', function() {displayForecast(forecast, position);});
				
				if(isWeeklyForecast())
					displayWeekly(forecastArea, forecast.forecastHours, position);
				else
					displayHourly(forecastArea, forecast.forecastHours, position);	
					
				//hook up the control events/settings
				var controls = $('.controls');
				controls.find('select').change(function() {
					updateUnitConfig(this);
					displayForecast(forecast, position);
				});
				controls.find('#temp-units').val(isCelsius() ? 'celsius':'fahrenheit');
				controls.find('#units').val(isMetric() ? 'metric':'imperial');
				
				setupStickyHeaders();
				
				scrollToDay();
			});
		}
		
		function displayLinks(forecastArea) {
			forecastArea.append('<div id=links><a href=#hourly' + (!isWeeklyForecast() ? ' class=selected':'') + '>hourly</a> <a href=#weekly' + (isWeeklyForecast() ? ' class=selected':'') + '>weekly</a></div>');
		}

		
		function displayHourly(forecastArea, forecastHours, position) {
				var forecastLength = forecastHours.length;
				var dayCount = 0;
				for(var i=0; i < forecastLength ; i += 1) {
					var hour = forecastHours[i];
					if(hour.date != undefined) {
						forecastArea.append('<div class=anchor day=' + dayCount + '></div>');
						if(i == 0)
							forecastArea.append('<div class=day-start>' + hour.date + ' @ ' + (position.city === undefined ? '' : position.city) + ' <a href=\'http://maps.google.com/maps?q=' + position.lat + ',' + position.lon + '\'>(' + Math.round(position.lat) + '&deg;,' + Math.round(position.lon)  + '&deg;)</a><div class=controls><label>units: </label><select id=units><option value=metric>metric</option><option value=imperial>imperial</option></select> <select id=temp-units><option value=celsius>celsius</option><option value=fahrenheit>fahrenheit</option></select></div></div>');
						else
							forecastArea.append('<div class=day-start>' + hour.date + '<div class=controls><a href=#top>back to top &uarr;</a></div></div>');
						dayCount++;
					}
					//add the forecast data to the forecast area
					forecastArea.append('<div class=\'hour row ' + (hour.sunUp ? '':'night ') + (i % 2 == 0 ? '':'alt') + '\'> <div class=time>' + hour.hour + '</div> <div class=\'symbol obj\' style=\'background-position:' + getSymbolPosition(hour.symbolCode, hour.sunUp) + '\'></div> <div class=\'temp ' + howHot(hour) + '\'><label>temperature: </label><span class=val>' + getTemp(hour) + '</span></div> <div class=\'wind ' + howWindy(hour) + '\'><label>wind speed: </label><span class=val>' + getWind(hour) + '</span></div> <div class=precip><label>precipitation: </label><span class=val>' + getPrecip(hour) + '</span></div> </div>');
				}
		}
		
		function displayWeekly(forecastArea, forecastHours, position) {
			forecastArea.append('<div class=day-start>weekly forecast @ ' + (position.city === undefined ? '' : position.city) + ' <a href=\'http://maps.google.com/maps?q=' + position.lat + ',' + position.lon + '\'>(' + Math.round(position.lat) + '&deg;,' + Math.round(position.lon)  + '&deg;)</a><div class=controls><label>units: </label><select id=units><option value=metric>metric</option><option value=imperial>imperial</option></select> <select id=temp-units><option value=celsius>celsius</option><option value=fahrenheit>fahrenheit</option></select></div></div>');
			var forecastLength = forecastHours.length;
			var precip, min, max, dateParts, symbolCounts, dayCount=0;
			for(var i=0; i < forecastLength ; i += 1) {
				var hour = forecastHours[i];
				if(hour.date != undefined) {
					if(i != 0) {
						var symbolCount = 0, symbol, symbol2;
						for(s in symbolCounts)
							if(symbolCounts[s] > symbolCount) {
								symbol2 = symbol;
								symbol = s;
							}
						forecastArea.append('<a class="day row" href=#hourly?day=' + dayCount + '><div class=date><div class=day-of-week>' + dateParts[0] + '</div><div class=month>' + dateParts[1] + '</div><div class=day-of-month>' + dateParts[2] + '<span>' + getSuffix(dateParts[2]) + '</span></div></div> <div class="icon single"><div class="left symbol obj" style="background-position:' + getSymbolPosition(symbol, true, true) + '"> </div><div class="right symbol obj" > </div></div><div class=temp><label>temperature</label><span class=val><span class=' + howHot(min['temp']) + '>' + getTemp(min['temp']) + '</span> | <span class=' + howHot(max['temp']) + '>' + getTemp(max['temp']) + '</span></span></div><div class=wind><label>wind speed</label><span class=val><span class="' + howWindy(min['wind']) + '">' + getWind(min['wind']) + '</span> | <span class=' + howWindy(max['wind']) + '>' + getWind(max['wind']) + '</span></span></span></div><div class=precip><label>precipitation</label><span class=val>' + getPrecip(precip) + '</span></div></a>');
						dayCount++;
					}
					min = {temp:99, wind:99}, max = {temp:-99, wind:-99}, symbolCounts = {}, precip = 0;
					dateParts = hour.date.replace(',','').split(' ');
				} else {
					if(min['temp'] > hour.temp)
						min['temp'] = hour.temp;
					else if(max['temp'] < hour.temp)
						max['temp'] = hour.temp;						
					if(min['wind'] > hour.wind)
						min['wind'] = hour.wind;
					else if(max['wind'] < hour.wind)
						max['wind'] = hour.wind;
					if(symbolCounts[hour.symbolCode] == undefined)
						symbolCounts[hour.symbolCode] = 1;
					else
						symbolCounts[hour.symbolCode] = symbolCounts[hour.symbolCode] + 1; 
						 
					precip += hour.precip;
				}
			}			
		}
		
		function isWeeklyForecast() {
			var i = window.location.href.indexOf('#');
			if(i !== -1 && window.location.href.substr(i, i+WEEKLY.length) === WEEKLY)
				return  true;
			return false;
		}
		
		function howHot(hour) {
			var temp = hour.temp == undefined ? hour:hour.temp;
			if(temp > 24)
				return 'hot';
			if(temp <= 0)
				return 'cold';
			return '';
		}
		
		function howWindy(hour) {
			var wind = hour.wind == undefined ? hour:hour.wind;
			if(wind >= 25)
				return 'strong';
			if(wind >= 10)
				return 'moderate';			
			return '';
		}
		
		function getSuffix(int) {
			int = int % 10 
			if(int > 0 && int < 4)
				return SUFFIXES[int-1];
			return SUFFIXES[3];		
		}
		
		function getSymbolPosition(symbolCode, sunUp, bigImages) {
			if(bigImages == undefined || !bigImages)
				return (-71.5 * (symbolCode - 1)) + (sunUp ? 'px -160px':'px -230px');
			else
				return (-71.5 * 1.5 * (symbolCode - 1)) + (sunUp ? 'px -240px':'px -345px');
		}
		
		function getTemp(hour) {
			var temp = hour.temp == undefined ? hour : hour.temp;
			if(isCelsius()) 
				return Math.round(temp) + '\u2103';
			else 
				return Math.round(1.8 * temp + 32) + '\u2109';
		}
		
		function getWind(hour) {
			var wind = hour.wind == undefined ? hour : hour.wind;
			if(isMetric())
				return Math.round(wind * 1.6093) + ' km/h';
			else
				return Math.round(wind) + ' mph';
		}
		
		function getPrecip(hour) {
			var precip = hour.precip == undefined ? hour : hour.precip;
			if(precip == 0) return 'none';
			
			if(isMetric()) precip = formatDouble(precip);
			else precip = formatDouble(precip * 0.03937);
			
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
		
		function updateUnitConfig(element) {
			var setting = $(element).val();
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
				$('.hour.day').removeClass('day').addClass('night');
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
			if((visible == undefined || !visible) && !locationReturned)
				permissionsDialog.animate({'top':'0'}); 
			else
				permissionsDialog.animate({'top':'-150px'}); 
		}
		
		function getSelectedDay() {
			var i = window.location.href.indexOf('?');
			if(i == -1) return null;
			else i+=1;
			
			if(window.location.href.substring(i, i+DAY.length) === DAY)
				return window.location.href.substr(i+DAY.length+1);
			return null;
		}
		
		function scrollToDay() {
			var day = getSelectedDay();
			if(day != null)
				$(window).scrollTop($('.anchor[day=\'' + day + '\']').offset().top);;
				
		}
		
		function setupStickyHeaders() {
			//get initial offset positions
			var headers = [];
			$.each($('div.day-start'), function(i, headerDiv) {
				var header = $(headerDiv);				
				headers.push({element:header, orgOffset: header.offset().top});
			});
			
			if(headers.length == 0)
				return;
				
			var orgCSS = {width:headers[0].element.css('width'), position:headers[0].element.css('position'), height:headers[0].element.css('height')};

			//handle scrolling
			$(window).scroll(function(){
				var scrollTop = $(this).scrollTop();
				//stick headers
				for(i in headers) {
					var header = headers[i];
					
					if(isStuck(header))
						header.element.css('top','0')
						
					if(scrollTop < header.orgOffset - parseInt(orgCSS.height)) 
						break;
						
					if(!isStuck(header))
						if(scrollTop >= header.orgOffset) {
							header.element.css('width', orgCSS.width).css('position', 'fixed').css('top','0').before('<div class=day-start> </div>');
							if(i > 0)
								headers[i-1].element.css('z-index', -1);
						}else if(i > 0)
							headers[i-1].element.css('top', header.orgOffset - scrollTop - parseInt(orgCSS.height));
				}
				
				//unstick headers
				for(i in headers) {
					var header = headers[i];
					if(!isStuck(header)) break;
					if(scrollTop <= header.orgOffset) {
						header.element.css('position', orgCSS.position).css('top','').prev().remove();
						if(i > 0)
							headers[i-1].element.css('z-index', 1);
					}
				}
			});
			
			function isStuck(header) {return header.element.css('position') === 'fixed'}
		}
	</script>
	</body>
</html>