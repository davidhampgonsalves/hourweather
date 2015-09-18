package com.hourlyweather.web;

import java.io.IOException;
import java.io.Writer;
import java.text.DecimalFormat;

import org.joda.time.DateTimeFieldType;
import org.joda.time.MutableDateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import com.hourlyweather.forecast.ForecastHour;
import com.hourlyweather.forecast.HourlyForecast;

public class HourlyForecastBuilder {
    private static final DateTimeFormatter dayFormatter = DateTimeFormat
	    .forPattern("EEEE, MMMM dd");
    private static final DateTimeFormatter hourFormatter = DateTimeFormat
	    .forPattern("HH");

    private static final DecimalFormat windSpeedFormat = new DecimalFormat(
	    "#.#");
    private static final DecimalFormat precipitationFormat = new DecimalFormat(
	    "#.##");

    public static void writeForecast(HourlyForecast forecast, Writer writer) {

	// get the time that corresponds to this forecast
	MutableDateTime forecastTime = new MutableDateTime(forecast.getStart());
	try {
	    // create the forecast list
	    ForecastHour[] forecastHours = forecast.getForecastHours();
	    ForecastHour forecastHour;
	    JSONObject jsonForecast = new JSONObject();
	    JSONArray jsonForecastHours = new JSONArray();
	    for (int i = 0; i < forecastHours.length; i++) {
		forecastHour = forecastHours[i];
		JSONObject jsonHour = new JSONObject();

		if (forecastHour != null) {
		    if (i == 0
			    || forecastTime.get(DateTimeFieldType.hourOfDay()) == 0)
			jsonHour.put("date", dayFormatter.print(forecastTime));
		    
		    jsonHour.put("sunUp", forecastHour.isSunUp());
		    jsonHour.put("symbolCode", forecastHour.getSymbolCode());
		    jsonHour.put("hour", hourFormatter.print(forecastTime));
		    jsonHour.put("wind", forecastHour.getWindSpeed());
		    jsonHour.put("temp", forecastHour.getTemp());
		    jsonHour.put("precip", forecastHour.getPrecipitation());

		    jsonForecastHours.put(i, jsonHour);
		} else {
		    jsonForecast.put("error",
			    "there was an error generating your forecast.");
		    break;
		}
		// increment the forecast time to move to the next hour
		forecastTime.addHours(1);
	    }
	    jsonForecast.put("forecastHours", jsonForecastHours);

	    writer.append(jsonForecast.toString());
	    writer.flush();

	} catch (IOException e) {
	    // this should never be thrown since I only use String and Print
	    // writers
	    // we can't do much anyway
	} catch (JSONException e) {

	}
    }

    /**
     * Returns a string thats is formatted to meet the current settings
     * 
     * @param forecastTime
     * @return
     */
    public static String formatTemperature(ForecastHour forecastHour) {
	// convert celsius to fahrenheit and format
	return forecastHour.getTemp().intValue() + "\u2103 | "
		+ (int) (1.8 * forecastHour.getTemp() + 32) + "\u2109";
    }

    public static String formatPrecipitation(ForecastHour forecastHour) {
	if (forecastHour.getPrecipitation() != null
		&& forecastHour.getPrecipitation().doubleValue() > 0)
	    if (forecastHour.getPrecipitation().doubleValue() >= 1)
		return windSpeedFormat.format(forecastHour
			.getPrecipitation()) + " mm";
	    else
		return precipitationFormat.format(forecastHour
			.getPrecipitation()) + " mm";
	else
	    return "none";

    }

    public static String formatWindSpeed(ForecastHour forecastHour) {
	return windSpeedFormat.format(forecastHour.getWindSpeed()); // in miles
    }

}
