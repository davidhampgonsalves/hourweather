package com.hourlyweather.web;

import java.util.ArrayList;
import java.util.List;

import com.hourlyweather.forecast.ForecastHour;

/**
 * Handles the forecast image resource selection for forecast hours
 * 
 * @author dave
 * 
 */
public class ForecastSymbolUtil {
    private static final List<String> nightForecastSymbols = new ArrayList<String>();
    private static final String IMG_DIR = "/images/weather/";
    
    static {
	nightForecastSymbols.add("LIGHTRAINSUN");
	nightForecastSymbols.add("LIGHTRAINTHUNDERSUN");
	nightForecastSymbols.add("PARTLYCLOUD");
	nightForecastSymbols.add("SLEETSUN");
	nightForecastSymbols.add("SNOWSUN");
	nightForecastSymbols.add("SUN");
    }

    /**
     * returns the url to the associated symbol resource for a forecast hour
     * 
     * @param forecastHour
     * @return
     */
    public static String getForecastSymbol(ForecastHour forecastHour) {
	// if its night time check the night symbols first
	if (!forecastHour.isSunUp())
	    if (nightForecastSymbols.contains(forecastHour.getSymbol()))
		return IMG_DIR + "night_"
			+ forecastHour.getSymbol().toLowerCase() + ".png";

	return IMG_DIR + forecastHour.getSymbol().toLowerCase() + ".png";
    }
}
