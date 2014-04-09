package com.hourlyweather.web;

import org.joda.time.DateTimeZone;

import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;

public class City
{
	private Entity city;
	public static final String ENTITY = "city"; 
	
	public City(Entity city) {
	    this.city = city;
	}
	
	public String getId() {
	    return city.getKey().getName();
	}
	
	public String getName() {
	    return (String) city.getProperty("name");
	}

	public Double getLatitude()
	{
	    return (Double) city.getProperty("latitude");
	}


	public Double getLongitude()
	{
		return (Double) city.getProperty("longitude");
	}
	
	public String getCountry() {
	    return (String)city.getProperty("country");
	}

	public DateTimeZone getTimezone() {
	    return DateTimeZone.forID((String) city.getProperty("timezone"));
	}
	
	
}
