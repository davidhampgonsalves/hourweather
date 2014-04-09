package com.hourlyweather.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.joda.time.DateTime;
import org.joda.time.DateTimeZone;

import com.hourlyweather.forecast.ForecastBackFillUtil;
import com.hourlyweather.forecast.HourlyForecast;
import com.hourlyweather.yrno.forecast.ForecastFetcher;


@SuppressWarnings("serial")
public class HourlyWeatherByLocationServlet extends HttpServlet {
    
    public void doGet(HttpServletRequest req, HttpServletResponse resp)
	    throws IOException {
	Double lat = null, lon = null;
	int timezoneOffset = 0;
	String timezone = null;
	
	try {
	    lat = Double.valueOf(req.getParameter("lat"));
	    lon = Double.valueOf(req.getParameter("long"));
	    if(req.getParameter("timezoneOffset") != null)
		timezoneOffset = Integer.valueOf(req.getParameter("timezoneOffset")).intValue();
	    if(req.getParameter("timezone") != null)
		timezone = req.getParameter("timezone");
	}catch(Exception e)
	{
	    //we'll handle this in the next check of the lat and long
	}
	
	//check if the lat/long are valid
	if (lat == null || lon == null || lat > 90 || lat < -90 || lon > 180 || lon < -180 ) {
	    // throw error, redirect to error page
	    System.out.println("error with params");
	    return;
	}
	
	// get the forecast for a full week
	HourlyForecast forecast;
	
	if(timezone != null)
	    forecast = new HourlyForecast(lat, lon, new DateTime(), 168, DateTimeZone.forID(timezone));
	else
	    forecast = new HourlyForecast(lat, lon, new DateTime(), 168, timezoneOffset);
	
	// get the forecast
	ForecastFetcher.getHourlyForecast(forecast);
	// back fill the unpopulated forecast entries
	ForecastBackFillUtil.backfillForecast(forecast);
	
	// build the forecast and add it to the response
	resp.setContentType("application/json; charset=UTF-8");
	PrintWriter writer = resp.getWriter();
	HourlyForecastBuilder.writeForecast(forecast, writer);
	writer.close();
    }
}
