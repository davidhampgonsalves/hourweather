package com.hourlyweather.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspWriter;

import org.joda.time.DateTime;

import com.hourlyweather.forecast.ForecastBackFillUtil;
import com.hourlyweather.forecast.HourlyForecast;
import com.hourlyweather.yrno.forecast.ForecastFetcher;

public class HourlyWeatherByCity {
    public static void writeHourlyForecast(HttpServletRequest request,
	    JspWriter writer) throws Exception {
	String city = (String) request.getAttribute("city");

	// get the location for the requested city
	Location location = CityLocationUtil.getLocation(city);

	// if the cities location wasn't found then alert the user
	// TODO: error
	if (location == null) 
	    throw new Exception(city + " wasn't found.");
	
	// get the forecast
	HourlyForecast forecast = new HourlyForecast(location.getLat(),
		location.getLon(), new DateTime(), 36, location.getTimeZone());

	// get the forecast
	ForecastFetcher.getHourlyForecast(forecast);
	// back fill the unpopulated forecast entries
	ForecastBackFillUtil.backfillForecast(forecast);

	// write the forecast for the requested city
	HourlyForecastBuilder.writeForecast(forecast, writer);
    }
}

