package com.hourlyweather.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.joda.time.DateTime;

import com.hourlyweather.forecast.ForecastBackFillUtil;
import com.hourlyweather.forecast.HourlyForecast;
import com.hourlyweather.yrno.forecast.ForecastFetcher;

@SuppressWarnings("serial")
public class HourlyWeatherByLocationServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp)
	    throws IOException {
	resp.setContentType("text/html; charset=UTF-8");

	Double lat = null, lon = null;
	int timezoneOffset = 0;
	
	try {
	    lat = Double.valueOf(req.getParameter("lat"));
	    lon = Double.valueOf(req.getParameter("long"));
	    timezoneOffset = Integer.valueOf(req.getParameter("timezoneOffset")).intValue();
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

	// get the forecast
	HourlyForecast forecast = new HourlyForecast(lat,
		lon, new DateTime(), 36, timezoneOffset);
	
	// get the forecast
	ForecastFetcher.getHourlyForecast(forecast);
	// back fill the unpopulated forecast entries
	ForecastBackFillUtil.backfillForecast(forecast);
	
	// build the forecast and add it to the response
	PrintWriter writer = resp.getWriter();
	HourlyForecastBuilder.writeForecast(forecast, writer);
	writer.close();
    }
}
