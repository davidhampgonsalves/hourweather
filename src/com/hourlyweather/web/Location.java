package com.hourlyweather.web;

import org.joda.time.DateTimeZone;

public class Location
{
	private Double lat, lon;
	private DateTimeZone timeZone;
	
	public Location(double lat, double lon, String timeZoneId) {
	    this.lat = lat;
	    this.lon = lon;
	    timeZone = DateTimeZone.forID(timeZoneId);
	}

	public Double getLat()
	{
		return lat;
	}

	public void setLon(Double lon)
	{
		this.lon = lon;
	}

	public Double getLon()
	{
		return lon;
	}

	public DateTimeZone getTimeZone() {
	    return timeZone;
	}
	
	
}
