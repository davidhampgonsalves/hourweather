<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.hourlyweather.web.HourlyWeatherByCity" %>
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
		<h1><a href="/"><span>H</span>our Weather</a></h1>
		<div id='slogan'>where you are for when you're there</div>
		<div id='forecast'><% HourlyWeatherByCity.writeHourlyForecast(request, out); %></div>
		
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
	</body>
</html>