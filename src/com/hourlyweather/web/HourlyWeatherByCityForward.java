package com.hourlyweather.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class HourlyWeatherByCityForward extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request,
	    HttpServletResponse response) throws ServletException, IOException {
	
	String city = request.getRequestURI();
	city = city.substring(city.lastIndexOf('/') + 1);
	city = city.trim();
	city = city.replaceAll("%20", " ");
	request.setAttribute("city", city);
	
	Location location = CityLocationUtil.getLocation(city);
	
	if (location == null) 
	    throw new LocationException(city + " wasn't found.");
	
	request.setAttribute("lat", location.getLat());
	request.setAttribute("lon", location.getLon());
	request.setAttribute("timeOffset", location.getTimeZone());
	
	RequestDispatcher dispatcher = getServletContext()
		.getRequestDispatcher("/");
	dispatcher.forward(request, response);
    }
}
