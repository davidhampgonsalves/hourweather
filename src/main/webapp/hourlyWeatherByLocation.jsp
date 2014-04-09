<%@page contentType="text/html" %>
<!doctype html>
<html>
<head>
	<meta name='keywords' content='weather forecast location hour hourly'></meta>
	<meta name='description' content='super accurate location aware hourly weather forecasts'> </meta>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=1000px, initial-scale=1.0" /> 
  	<meta name="apple-mobile-web-app-capable" content="yes" /> 
	<title> Weather for where you are, simple, accurate and hassle free</title>	
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
		
		a {color: #333;text-decoration:none}
		
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
			line-height: 60px;
			height: 60px;
			padding-left:20px;
			font-size:20px;
		}
		
		.unimportant {color: #777}
		
		.arrow_nav {font-size: 35px}
		.arrow_nav:hover {color:#999}
		
		#links {
			float:right;
			text-align:right;
			margin-top:-30px;
		}
		
		#links a {
			background: white;
			border-radius: 5px;
			border:3px solid #eaf1ff;
			padding:5px;
		}
		
		#links a:hover {
			border:0;
			padding:8px;
		}
		
		#links a.selected {
			border:0;
			padding:8px;
			background: #FFFFBE
		}
		
		#city-info {
			margin-top:-80px;
			margin-bottom: 100px;
			padding-left: 15px;
			overflow:auto;
			border-radius: 10px;
			background:white;
			padding:15px;
			width:900px;
		}
		
		#city-info h1 {
			font-size: 15px;
		}
		
		#city-info a {text-decoration: underline;}
		
		.row {
			background:rgb(250,250,250);
			overflow:auto;
			border-bottom: 2px solid #E6E6E6;
		}
		
		#forecast .day {
			display:block;
			color:#333;
			padding:20px 0;
			overflow:hidden;
		}
		a.day:hover {background:#eaf1ff}
		#forecast .day div {text-align:center;float:left}
		
		.day .date {padding-top: 10px;width:180px;}
		.day .date div {width:166px}
		.day .date .day-of-week {font-size: 25px;}
		.day .date .month {font-size: 16px;}
		.day .date .day-of-month {font-size: 40px;}
		.day .date .day-of-month span {font-size: 12px;}

		.symbols div {height:95px;width:78px;background-size: 1629px 445px;margin-top:0px}
		.symbols div div {margin-top: 95px;}
		.symbols ._2, .symbols ._3 {border-left:3px solid #999} 
		
		.symbols._1 div.obj {margin-left:70px}
		.symbols._1 ._1 {width:105px}
		.symbols._1 ._1 div {margin-left:10px}
		.symbols._1 ._2, .symbols._1 ._2 {display:none}

		.symbols._2 div.obj._1 {margin-left:30px}
		.symbols._2 ._1, .symbols._2 ._2 {width:90px}
		.symbols._2 ._3 {display:none}

		.day div.symbols {width:240px;} 		
		.day div.wind {width: 240px}
		.day div.temp {width: 170px}
		.day div.precip {width: 140px} 
		.day label {display:block; padding-top: 20px;}
		.day .val {font-size: 25px; padding-top: 20px; display:block}
		
		.hour {
			padding:5px 0;
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
			width:750px;
			margin: 0 auto;
			margin-top:50px;
			text-align:center;
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

		
		#location-permissions {
			left:50px;
			top: -150px;
			z-index: 3;
		}
		
		#location-permissions.ie {
			left:50%;
			top:auto;
			z-index: 3;
		}
		
		#weekly-instructions {
			position:absolute;
			top:-60px;
			margin-left:30px;
		}
		
		.dialogue {
			width:350px;
			display: block;
			text-align:center;
			position:fixed;
		}
		
		.dialogue.up:before, .dialogue.down:after {
			border: 20px solid transparent;
			width: 0;
			position:absolute;
			content:'';
			display:block;
		}
		.dialogue.up:before {			
			border-bottom: 20px solid #afcdf3;
			margin-top: -20px;
			margin-left: 30px;
		}
		
		.dialogue.down:after {
			border-top: 20px solid #afcdf3;
			margin-left:230px;
		}

		.msg {	
			border: 10px solid #afcdf3;
			background:white;
			padding: 10px;
			border-radius: 10px;
			margin-top:20px;
		}

		#cities {
			margin-top:40px;
		}
		
		#cities div {
			float:left;
			margin-top:8px;
			font-size: 13px;
			font-weight:700
		}
		
		#cities a {
			margin-top:5px;
			font-size:12px;
			background:white;
			border-radius:5px;
			padding:5px;
			display:block;
			float:left;
			margin: 3px;
		}
		#cities a:hover {background: #ddd}
		#cities a:nth-child(odd):hover {background: #ddd}
		#cities a:nth-child(odd) {background: #eee}
		
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
		<a name=top></a>
	</div>
	<div id=body>
		<% if(request.getAttribute("city") != null) { %>
		<div id=city-info class=content><h1>Weekly Weather Forecast for <%= request.getAttribute("city") %></h1> Hour weather always gives you a super accurate forecast of the weather in your future.  It uses the yr.no weather forecasting service to create a forecast just for you.  In this case its for <%= request.getAttribute("city") %> but we can create one just for you just as quick.  Simply pop on over to our <a href='/'>main page</a> to check the weather forecast for your current location, no matter where your hiding.</div>
		<% } %>
		<div id=forecast class=content>
			<div id=marketing-blurb>
				<div class=important>	
				Hassle free forecasting based on your location!
				</div>    
				Wherever you are Hour Weather takes the hassle out of checking your forecast!
				<br>
				Using location aware technology we can generate a super accurate forecast just for you. 
				<br><br>
				Stop bookmarking local weather forecasts and let Hour Weather simplify your day.
				
				
				<div id=cities>
					<div>Hour Weather reports on over 30000 cities:</div>
					<a href='/forecast/new%20york%20city'>new york</a>
					<a href='/forecast/san%20francisco?id=5391959'>san francisco</a>
					<a href='/forecast/seattle'>seattle</a>
					<a href='/forecast/los%20angeles?id=5368361'>los angeles</a>
					<a href='/forecast/philadelphia'>philadelphia</a>
					<a href='/forecast/chicago'>chicago</a>
					<a href='/forecast/toronto'>toronto</a>
					<a href='/forecast/calgary'>calgary</a>
					<a href='/forecast/montreal'>montreal</a>
					<a href='/forecast/halifax'>halifax</a>
					<a href='/forecast/london'>london</a>
					<a href='/forecast/beijing'>beijing</a>
					<a href='/forecast/moscow'>moscow</a>
					<a href='/forecast/mumbai'>mumbai</a>
					<a href='/forecast/tokyo'>tokyo</a>
					<a href='/forecast/hong%20kong'>hong kong</a>
					<a href='/forecast/cairo'>cairo</a>
					<a href='/forecast/cape%20town'>cape town</a>
					<a href='/forecast/hyderabad?id=1269843'>hyderabad</a>
				</div>
			</div>
		</div>
					
		<div id=about class=content>
			<h3>about</h3>Hour Weather uses the geo compatibilities of HTML5 to determine your rough location and then based on that is able to create a weather forecast just for you using the awesome <a href='http://www.yr.no/'>yr.no</a> weather forecasting service.
			<br><br>
			In the office, from your home or on vacation, Hour Weather will always give you a super accurate hourly weather forecast. 
			
			<div>a weekend project by <a href='http://www.davidhampgonsalves.com'>david hamp-gonsalves</a>.</div>
		</about>
	</div></div>
	<script type='text/javascript'>
		<% if(request.getAttribute("city") != null) { %>
				var cityInfo = {city: '<%= request.getAttribute("city") %>', lat: <%= request.getAttribute("lat") %>, lon:<%= request.getAttribute("lon") %>, timezone: '<%= request.getAttribute("timezone") %>'};
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
		var HOURLY = '#hourly';
		var SUFFIXES = ['st', 'nd', 'rd', 'th'];
		var MORNING ='morning', NOON = 'noon', EVENING='evening';
		var SYMBOL_KEYS = [MORNING, NOON, EVENING];
		
	
		var locationReturned = false;
		if (typeof(localStorage) == 'undefined') 
			alert('Sorry, your browser is just too old to handle this site.');
		else if(isFirstVisit()) {
			localStorage.setItem('celsius', true);
			localStorage.setItem('metric', true);
			localStorage.setItem('24hourclock', true);
		}
		
		jQuery.easing.def = "easeOutBounce";
		
		if(typeof cityInfo !== "undefined")
			getForecast(cityInfo);
		else if (navigator.geolocation) {
 			window.setTimeout(setPermissionVisibility, 1100); 			
 			//request location
 			navigator.geolocation.getCurrentPosition(getForecast, showLocationError, {maximumAge:6000000, timeout:10000, enableHighAccuracy:true});			
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
				var position = positionData;//{city: positionData.city, lat: positionData.lat, lon: positionData.lon, timezone: positionData.timezone};
			
			//get forecast
			$.getJSON("/HourlyWeatherByLocation", {lat: position.lat, long: position.lon, timezoneOffset: position.timeOffset, timezone: position.timezone}, function(json) {displayForecast(json, position);}).error(showError);
			
			//reverse geolocate the user to display human readable location
			if(position.city === undefined)
				getReadableLocation(position);
		}
		
		function displayForecast(forecast, position, shouldAnimate) {
			
			//make sure the dom is ready
			$().ready(function() {
				if(forecast.error != undefined)
					alert(forecast.error);		
				
				//set the day/night status + set the position
				if(shouldAnimate == undefined || shouldAnimate)
					animateDiorama(forecast.forecastHours[0]);
				
				var forecastArea = $('#forecast');
				forecastArea.html('');
				displayLinks(forecastArea);
				
				$(window).off('hashchange');
				$(window).on('hashchange', function() {displayForecast(forecast, position, false);});
				
				if(isWeeklyForecast())
					displayWeekly(forecastArea, forecast.forecastHours, position);
				else
					displayHourly(forecastArea, forecast.forecastHours, position);	
					
				//hook up the control events/settings
				var controls = $('.controls');
				controls.find('select').change(function() {
					updateUnitConfig(this);
					displayForecast(forecast, position, false);
				});
				controls.find('#temp-units').val(isCelsius() ? 'celsius':'fahrenheit');
				controls.find('#units').val(isMetric() ? 'metric':'imperial');
				
				setupStickyHeaders();
				
				scrollToDay();
			});
		}
		
		function displayLinks(forecastArea) {
			forecastArea.append('<div id=links><a href=#hourly' + (!isWeeklyForecast() ? ' class=selected':'') + ' title="view your forecast hour by hour">hourly</a> <a href=#weekly' + (isWeeklyForecast() ? ' class=selected':'') + ' title="view your forecast day by day">weekly</a></div>');
		}

		
		function displayHourly(forecastArea, forecastHours, position) {
				var forecastLength = forecastHours.length;
				var dayCount = 0;
				for(var i=0; i < forecastLength ; i += 1) {
					var hour = forecastHours[i];
					if(hour.date != undefined) {
						forecastArea.append('<a name=' + dayCount + ' day=' + dayCount + '></a>');
						if(i == 0)
							forecastArea.append('<div class=day-start>' + hour.date + ' @ <a id=location href=\'http://maps.google.com/maps?q=' + position.lat + ',' + position.lon + '\'>'  + (position.city === undefined ? '' : position.city) + ' (' + Math.round(position.lat) + '&deg;,' + Math.round(position.lon)  + '&deg;)</a><div class=controls><label>units: </label><select id=units><option value=metric>metric</option><option value=imperial>imperial</option></select> <select id=temp-units><option value=celsius>celsius</option><option value=fahrenheit>fahrenheit</option></select></div></div>');
						else {
							var header = '<div class=day-start>' + hour.date + '<div class=controls>';
							if(i < forecastLength - 24)
								header += '<a class=arrow_nav href=#' + (dayCount+1) + ' title="jump ahead one day of your forecast"> &darr; </a> ';
							header += '<a class=arrow_nav href=#top title="jump to the start of your forecast"> &uarr; </a></div></div>';
							forecastArea.append(header);
						}
						dayCount++;
					}
					//add the forecast data to the forecast area
					forecastArea.append('<div class=\'hour row ' + (hour.sunUp ? '':'night ') + (i % 2 == 0 ? '':'alt') + '\'> <div class=time>' + getTime(hour) + '</div> <div class=\'symbol obj\' style=\'background-position:' + getSymbolPosition(hour.symbolCode, {isSunUp: hour.sunUp}) + '\'></div> <div class=\'temp ' + howHot(hour) + '\'><label>temperature: </label><span class=val>' + getTemp(hour) + '</span></div> <div class=\'wind ' + howWindy(hour) + '\'><label>wind speed: </label><span class=val>' + getWind(hour) + '</span></div> <div class=precip><label>precipitation: </label><span class=val>' + getPrecip(hour) + '</span></div> </div>');
				}
		}
		
		function displayWeekly(forecastArea, forecastHours, position) {
			if(isFirstUsageOfWeekly()) {
				forecastArea.append('<div id=weekly-instructions class="dialogue down"><div class=msg>Click on a day to view the hour by hour forecast details you need!</div></div>');
				weeklyForecastUsed();
			}	
			forecastArea.append('<div class=day-start>weekly forecast @ <a id=location href=\'http://maps.google.com/maps?q=' + position.lat + ',' + position.lon + '\'>' + (position.city === undefined ? '' : position.city) + ' (' + Math.round(position.lat) + '&deg;,' + Math.round(position.lon)  + '&deg;)</a><div class=controls><label>units: </label><select id=units><option value=metric>metric</option><option value=imperial>imperial</option></select> <select id=temp-units><option value=celsius>celsius</option><option value=fahrenheit>fahrenheit</option></select></div></div>');
			var forecastLength = forecastHours.length;
			var precip, wind, temp, dateParts, symbols, dayCount=0;
			for(var i=0; i < forecastLength ; i += 1) {
				var h = forecastHours[i];
				if(h.date != undefined) {
					if(i != 0) {
						forecastArea.append('<a class="day row" href=#hourly?day=' + dayCount + '><div class=date><div class=day-of-week>' + dateParts[0] + '</div><div class=month>' + dateParts[1] + '</div><div class=day-of-month>' + dateParts[2] + '<span>' + getSuffix(dateParts[2]) + '</span></div></div>' + getSymbolArea(symbols) + '<div class=temp><label>temperature</label><span class=val><span class=' + howHot(temp.min) + '>' + getTemp(temp.min) + '</span><span class=unimportant> &#8226; </span><span class=' + howHot(temp.max) + '>' + getTemp(temp.max) + '</span></span></div><div class=wind><label>wind speed</label><span class=val><span class="' + howWindy(wind.min) + '">' + getWind(wind.min) + '</span><span class=unimportant> &#8226; </span><span class=' + howWindy(wind.max) + '>' + getWind(wind.max) + '</span></span></span></div><div class=precip><label>precipitation</label><span class=val>' + getPrecip(precip) + '</span></div></a>');
						dayCount++;
					}
					symbols = {}, wind = {min: 99, max:-1}, temp = {min:99, max:-99}, precip = 0;
					dateParts = h.date.replace(',','').split(' ');
				}
				
				if(temp.min > h.temp)
					temp.min = h.temp;
				if(temp.max < h.temp)
					temp.max = h.temp;						
				if(wind.min > h.wind)
					wind.min = h.wind;
				if(wind.max < h.wind)
					wind.max = h.wind;
				
				var field = null;
				if(h.hour > 5 && h.hour < 11) 
					 field = MORNING;
				else if(h.hour > 10 && h.hour < 16)
					field = NOON;
				else if(h.hour > 15)
					field = EVENING;

				if(field != null)
					if(symbols[field] == undefined || symbols[field] < h.symbolCode)
						symbols[field] = h.symbolCode;
					 
				precip += h.precip;
			}			
		}
		
		function getReadableLocation(position) {
			 $.getJSON('http://api.geonames.org/findNearbyJSON?formatted=false&lat=' + position.lat + '&lng=' + position.lon + '&fclass=P&fcode=PPLA&fcode=PPL&fcode=PPLC&username=davidhampgonsalves&style=SHORT&callback=?', 
			 	function(data) {
			 		if(data.geonames.length > 0) {
			 			if(data.geonames[0].name != undefined) {
			 				position.city = data.geonames[0].name;
			 				//handle case where reverse geo comes back after forecast
							var location = $('#location');
		 					if(location.length > 0)
			 					location.html(position.city + ' ' + location.html());
			 			}
			 		}
				});
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

		function getSymbolPosition(symbolCode, options) {
			var sunUp = options['isSunUp'] != undefined && options['isSunUp'];
			var bigImages = options['isBigImages'] != undefined && options['isBigImages'];
			var offset = options['offset'] == undefined ? 0:options['offset'];

			return (-71.5 * (bigImages? 1.5:1) * (symbolCode - 1) - offset) + 'px ' + ((bigImages? 1.5:1) * (sunUp ? -160:-230)) + 'px';
				
		}
		
		function getSymbolArea(symbols) {
		 	var symbolsHtml='', symbolCount = 0;
		 	var offsets = [0,12,25];
		 	
	 		for(var i=0 ; i < SYMBOL_KEYS.length ; i++)
	 			if(symbols[SYMBOL_KEYS[i]] != undefined) {
	 				symbolsHtml += '<div class="obj _' + (symbolCount + 1) + '" style="background-position:' + getSymbolPosition(symbols[SYMBOL_KEYS[i]], {isSunUp: true, isBigImages:true, offset:offsets[symbolCount]}) + '"><div>' + SYMBOL_KEYS[i] + '</div></div>';
	 				symbolCount++;
		 		}
		 	return '<div class="symbols _' + symbolCount + '">' + symbolsHtml + '</div>';
		}
	
		function getTime(hour) {
			if(is24Hour())
				return hour.hour + ':00';
			else {
				var h = hour.hour > 12 ? hour.hour - 12 : hour.hour;
				return (h==0 ? 12:h) + ':00 ' + (hour.hour < 13 ? 'AM':'PM');
			}
			
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
			
			if(isMetric()) precip = Math.round(precip);
			else precip = formatDouble(precip * 0.03937);
			
			if(precip === 0) return 'trace';
			
			if(isMetric()) return precip + ' mm';
			else return precip + '\'';
		}
		
		function formatDouble(double) {
			return Math.round(double * 100) / 100;
		}
		
		function is24Hour() {return localStorage.getItem('24hourclock') === 'true';}
		function isMetric() {return localStorage.getItem('metric') === 'true';}
		function isCelsius() {return localStorage.getItem('celsius') === 'true';}
		function isWeeklyForecast() {
			var i = window.location.href.indexOf('#');
			if(i === -1 || window.location.href.substr(i, WEEKLY.length) === WEEKLY)
				return true;
			return false;
		}
		function isFirstVisit() {return  localStorage.getItem('metric') == null;}
		function isFirstUsageOfWeekly() {return localStorage.getItem('first-use-of-weekly') == null;}
		function weeklyForecastUsed() {return localStorage.setItem('first-use-of-weekly', 'false');}
		
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
				$('.hanging-obj.day').removeClass('day').addClass('night');
				animateToDark($('#head'));
			}
			//position the sun/moon based on the forecast
			$('#day-night').animate({'top': -193 + (forecastHour.symbolCode > 5 ? (16 * forecastHour.symbolCode - 1):0) + 'px'}, 2500);
			$('#day-night-sm').animate({'top': -160 + (9 * forecastHour.symbolCode - 1) + 'px'}, 3000);
			
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
			var permissionsHtml = '<div id=location-permissions class=dialogue><div class=msg>Share your location with us! <br>We\'ll build you an awesome weather forecast!</div></div>';
			var body = $('body').append(permissionsHtml);
			
			var permissionsDialog = body.find('#location-permissions');
			var animateParams;
			var show = (visible == undefined || !visible) && !locationReturned;
			
			if($.browser.msie) {
				permissionsDialog.addClass('down ie');
				animateParams = show ? {'bottom':60} : {'bottom':'-150px'}; 
			} else {
				permissionsDialog.addClass('up');
				animateParams = show ? {'top':0} : {'top':'-150px'}; 
			}
			permissionsDialog.animate(animateParams);
		}
		
		function getSelectedDay() {
			var i = window.location.href.indexOf(DAY + '=');
			if(i == -1) return null;
			i = i + DAY.length + 1;
			return window.location.href.substr(i, i + 1);
		}
		
		function scrollToDay() {
			var day = getSelectedDay();
			if(day != null)
				$(window).scrollTop($('a[day=\'' + day + '\']').offset().top);
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
				
								
				//unstick headers
				for(i in headers) {
					var header = headers[i];
					if(!isStuck(header)) break;
					
					if(scrollTop < header.orgOffset) {
						header.element.css('position', orgCSS.position).css('top','').prev().remove();
						if(i > 0)
							headers[i-1].element.css('z-index', 1);
					}
				}
				
				//stick headers
				for(i in headers) {
					var header = headers[i];
					
					if(isStuck(header))
						header.element.css('top','0')
						
					if(scrollTop < header.orgOffset - parseInt(orgCSS.height)) 
						break;
						
					if(!isStuck(header)) {
						if(scrollTop > header.orgOffset) {
							header.element.css('width', orgCSS.width).css('position', 'fixed').css('top','0').before('<div class=day-start> </div>');
							if(i > 0)
								headers[i-1].element.css('z-index', -1);
						}else if(i > 0)
							//hide the element 
							headers[i-1].element.css('top', header.orgOffset - scrollTop - parseInt(orgCSS.height));
					}
				}
			});
			
			function isStuck(header) {return header.element.css('position') === 'fixed'}
		}
	</script>
	</body>
</html>