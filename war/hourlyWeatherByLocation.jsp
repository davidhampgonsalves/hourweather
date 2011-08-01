<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.hourlyweather.web.CityLocationUtil" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
       "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en"> 

<head>
	<meta name='keywords' content='weather forecast android location hour hourly'></meta>
	<meta name='description' content='super accurate location aware hourly weather forecast and android app'> </meta>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
  	<meta name="apple-mobile-web-app-capable" content="yes" /> 
	<link rel="stylesheet" type="text/css" media="screen" href="/hourlyweather.css" />
	<title> Hour Weather, your location aware hourly forecast </title>
	<script type="text/javascript">
	  var _gaq = _gaq || [];
	  _gaq.push(['_setAccount', 'UA-19849283-3']);
	  _gaq.push(['_trackPageview']);
	
	  (function() {
	    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	  })();
	
	</script>
</head>
	<body>
		<div id='permissions_area'>
			<div id='arrow'> </div>
			<div id='permissions_msg'>
				Tell us where you are we'll create a location aware hourly forecast for you.
			</div>
		</div>
		
		<div id='error_area'> 
			<h3 > Error </h3>
			<div class='msg'> </div>
			<div class='smaller'> If you want to see how this would have worked try one of the city links at the bottom. </div>
		</div>
	
		<h1><a href="/"><span>H</span>our Weather</a></h1>
		<div id='slogan'>where you are for when you're there</div>
		
		<div id='forecast'>
			<div id='welcome' style='display:none'>
				We use your browsers built in location awareness and the awesome <a href='http://www.yr.no/'>yr.no</a> weather service to create a super accurate hourly weather forecast for your current location.
				<br/>
				Or take your location aware weather forecast with you using our even more accurate <a href=''>Android App</a>.
			</div>
			
			<img id='loading' style='display:none' src='images/loading.gif'> </img>
		</div>
		
		<a id='android_button' href='http://market.android.com/details?id=com.hourlyweather'>
			<div> Check out Hourly Weather on your Andoid phone! </div>
			<img src='/images/android.png'></img>
		</a>
		
		<div id='places'>		
			<%	boolean alt = false;
				for(String city : CityLocationUtil.getLocations()) { %>
					<a href='/city/<%= city %>' <%= alt ? "class='alt'" : "" %>><%= city %></a>
			<% alt = !alt; } %>	
		</div>
    	<div id="footer">
	      <span><a href="http://davidhampgonsalves.com/">by: David Hamp-Gonsavles</a></span>
	      <iframe src="http://www.facebook.com/plugins/like.php?href=http%3A%2F%2Fhourweather.com&amp;layout=button_count&amp;show_faces=false&amp;width=55&amp;action=like&amp;font&amp;colorscheme=light&amp;height=21" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:55px; height:20px;" allowTransparency="true"></iframe>
	      <a href="http://twitter.com/share" class="twitter-share-button" data-url="http://hourweather.com" data-text="hour weather" data-count="none">Tweet</a><script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
		</div>
	<script src="http://code.google.com/apis/gears/gears_init.js" type="text/javascript" charset="utf-8"></script> 
	<script src="/javascript/geo.js" type="text/javascript" charset="utf-8"></script> 
	<script>
		window.onload = init;
		var locationReturned = false;
		
		function init() {
			
			if (geo_position_js.init())
				geo_position_js.getCurrentPosition(getForecastForLocation, showLocationError);
			else
				showError('Your browser doesn\'t support the HTML5 Location api. Upgrade to a current version of Firefox or Chrome.');
		
			//prompt user for location access after a second
			window.setTimeout(displayPermissionPrompt, 100);
		}
		
		function getForecastForLocation(pos) {
			//mark the location as returned
			locationReturned = true;
			hidePermissionPrompt();

			document.getElementById('loading').style.display = 'block';
			
			var lat = pos.coords.latitude;
			var lon = pos.coords.longitude;
			var timezoneOffset = - new Date().getTimezoneOffset()/60;
			
			//make request to get forecast for this location
			var xmlHttpRequest = createXMLHttpRequest();
			xmlHttpRequest.open('GET', 'HourlyWeatherByLocation?lat=' + lat + '&long=' + lon + '&timezoneOffset=' + timezoneOffset, true);
			xmlHttpRequest.onreadystatechange = function() {
				if (xmlHttpRequest.readyState == 4)
					document.getElementById('forecast').innerHTML = xmlHttpRequest.responseText;
			};
			xmlHttpRequest.send(null);
		}
		
		function displayPermissionPrompt() {
			if(!locationReturned) {
				document.getElementById('permissions_area').style.display = 'block';
				document.getElementById('welcome').style.display = 'block';
			}
		}
		
		 function createXMLHttpRequest() {
			try { return new XMLHttpRequest(); } catch(e) {}
			try { return new ActiveXObject("Msxml2.XMLHTTP"); } catch (e) {}
			try { return new ActiveXObject("Microsoft.XMLHTTP");} catch (error) {}
			alert("XMLHttpRequest not supported");
			return null;
		}
		
		function hidePermissionPrompt() {
			document.getElementById('permissions_area').style.display = 'none';
			document.getElementById('welcome').style.display = 'none';
			
		}
		
		function showLocationError(err, msg) {
			//mark the location as returned
			locationReturned = true;
			
			var errorMsg;
			if(err.code == 1)
				//user rejected access
				errorMsg = 'We can\'t generate a location aware forecast unless you share your location with us.\n'
			else if(err.code == 2)
				//users position is unavailiable
				errorMsg = 'Your browser currently doesn\'t know where you are.';
			else if(err.code == 3)
				//timeout
				errorMsg = 'It took too long for your browser to determine its location.';
			else
				errorMsg = err.msg;
				
			//hide the prompt and display the error
			hidePermissionPrompt();
			showError(errorMsg);
		}
		
		function showError(msg) {
			var errorBox = document.getElementById('error_area');	
			var children = errorBox.getElementsByTagName('div');	
			for(var i in children) 
				if(children[i].getAttribute('class') == 'msg') {
					children[i].innerHTML = msg;
					errorBox.style.display = 'block';
					break;
				}
		}
		
	</script>
	</body>
</html>