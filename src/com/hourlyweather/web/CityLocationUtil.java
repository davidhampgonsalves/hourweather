package com.hourlyweather.web;

import java.util.HashMap;
import java.util.Set;

import org.joda.time.DateTimeZone;

/**
 * Provides Locations for city names. Currently this is just building a static
 * hashmap of names but later this should be moved to the datastore if more
 * cities get added.
 * 
 * @author dave
 * 
 */
public class CityLocationUtil {

    private static final HashMap<String, Location> cityLocations = new HashMap<String, Location>();

    static {
	cityLocations.put("toronto", new Location(43.65, -79.38, "America/Toronto"));
	cityLocations.put("quebec", new Location(46.83, -71.25, "Canada/Eastern"));
	cityLocations.put("vancouver", new Location(49.26, -123.11, "America/Vancouver"));
	cityLocations.put("halifax", new Location(44.50, -63.46, "America/Halifax"));

	cityLocations.put("new york", new Location(40.77, -73.98, "America/New_York"));
	cityLocations.put("los angeles", new Location(33.93, -118.4, "America/Los_Angeles"));
	cityLocations.put("chicago", new Location(41.90, 87.65, "America/Chicago"));
	cityLocations.put("san francisco", new Location(37.75, -122.68, "US/Pacific"));
	cityLocations.put("seattle", new Location(47.45, -122.30, "US/Pacific"));

	cityLocations.put("london", new Location(51.5, -0.12, "Europe/London"));
	cityLocations.put("melbourne", new Location(0, 0, "Australia/Melbourne"));
	cityLocations.put("tokyo", new Location(0, 0, "Asia/Tokyo"));
	cityLocations.put("moscow", new Location(0, 0, "Europe/Moscow"));
    }

    /**
     * Returns a Location for a city name
     * 
     * @param city
     * @return
     */
    public static Location getLocation(String city) {
	return cityLocations.get(city.toLowerCase());
    }

    public static Set<String> getLocations() {
	return cityLocations.keySet();
    }

    public static DateTimeZone getTimezone(String city) {
	city = city.toLowerCase();
	Location location;
	if((location = cityLocations.get(city.toLowerCase())) != null)
		return location.getTimeZone();
	return null;
    }
}
