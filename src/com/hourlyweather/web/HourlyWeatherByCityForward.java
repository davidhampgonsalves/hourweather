package com.hourlyweather.web;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;

@SuppressWarnings("serial")
public class HourlyWeatherByCityForward extends HttpServlet {
    private static final Logger log = Logger.getLogger(HourlyWeatherByCityForward.class.getName());
    
    @Override
    protected void doGet(HttpServletRequest request,
	    HttpServletResponse response) throws ServletException, IOException {
	
	String cityId = request.getParameter("id");

	City city;
	if (cityId == null)
	    city = getCityByName(request);
	else
	    city = getCityById(request);
	
	request.setAttribute("city", city.getName());
	request.setAttribute("lat", city.getLatitude());
	request.setAttribute("lon", city.getLongitude());
	request.setAttribute("timeOffset", city.getTimezone());

	RequestDispatcher dispatcher = getServletContext()
		.getRequestDispatcher("/");
	dispatcher.forward(request, response);
    }

    private static City getCityByName(HttpServletRequest request) {
	String cityName = request.getRequestURI().substring(
		request.getRequestURI().lastIndexOf('/') + 1);
	
	log.warning(cityName);
	int hashPos = cityName.lastIndexOf('#');
	int questionPos = cityName.lastIndexOf('?');

	if (questionPos > -1 && hashPos > -1) {
	    int end = questionPos;
	    if (end == -1 || (hashPos != -1 && end > hashPos))
		end = hashPos;
	    cityName = cityName.substring(0, end);
	}
	cityName = cityName.replaceAll("%20", " ");
		
	// query database for city geo data
	DatastoreService ds = DatastoreServiceFactory.getDatastoreService();

	Query cityByName = new Query("city");
	cityByName.addFilter("searchable-name", Query.FilterOperator.EQUAL, cityName.toLowerCase());
	PreparedQuery pq = ds.prepare(cityByName);

	for (Entity result : pq.asIterable()) {
		//just take the first one, not perfect but we can't do any better without the id
		return new City(result);
	}
	return null;
    }
    

    private static City getCityById(HttpServletRequest request) throws LocationException {
	Key cityKey = KeyFactory.createKey(City.ENTITY, request.getParameter("id"));

	// query database for city geo data
	DatastoreService ds = DatastoreServiceFactory.getDatastoreService();

	City city;
	try {
	    city = new City(ds.get(cityKey));
	} catch (EntityNotFoundException e) {
	    throw new LocationException(cityKey + " wasn't found.");
	}
	return city;
    }
}
