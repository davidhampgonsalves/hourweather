package com.hourlyweather.web;

import java.io.IOException;
import java.io.Writer;
import java.text.DecimalFormat;

import org.joda.time.DateTimeFieldType;
import org.joda.time.MutableDateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import com.hourlyweather.forecast.ForecastHour;
import com.hourlyweather.forecast.HourlyForecast;

public class HourlyForecastBuilder {
    private static final DateTimeFormatter dayFormatter = DateTimeFormat
	    .forPattern("EEEE, MMMM dd");
    private static final DateTimeFormatter hourFormatter = DateTimeFormat
	    .forPattern("hh:00 aa");

    private static DecimalFormat windSpeedFormat = new DecimalFormat("#.#");

    public static void writeForecast(HourlyForecast forecast, Writer writer) {

	// get the time that corresponds to this forecast
	MutableDateTime forecastTime = new MutableDateTime(forecast.getStart());
	try {
	    // create the forecast list
	    ForecastHour[] forecastHours = forecast.getForecastHours();
	    ForecastHour forecastHour;
	    for (int i = 0; i < forecastHours.length; i++) {
		forecastHour = forecastHours[i];

		if (forecastHour != null) {
		    if (i == 0
			    || forecastTime.get(DateTimeFieldType.hourOfDay()) == 0) {
			writer.append("<div class='header'>");
			writer.append(dayFormatter.print(forecastTime));
			writer.append("</div>");
		    }

		    writer.append("<div class='forecast_hour");
		    if (i == 0)
			writer.append(" current");
		    if (!forecastHour.isSunUp())
			writer.append(" night");
		    if (i % 2 == 1)
			writer.append(" alt");
		    
		    writer.append("'><img src='");
		    writer.append(ForecastSymbolUtil
			    .getForecastSymbol(forecastHour));
		    writer.append("' /><div>");
		    writer.append(hourFormatter.print(forecastTime));
		    writer.append("</div><div>wind: ");
		    writer.append(formatWindSpeed(forecastHour));
		    writer.append("</div><div>");
		    writer.append(formatTemperature(forecastHour));
		    writer.append("</div><div>precip: ");
		    writer.append(formatPrecipitation(forecastHour));
		    writer.append("</div></div>");
		} else
		    writer.append("<div>forecast error</div>");

		// increment the forecast time to move to the next hour
		forecastTime.addHours(1);
	    }

	    writer.flush();
	} catch (IOException e) {
	    // this should never be thrown since I only use String and Print
	    // writers
	    // we can't do much anyway
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
	return forecastHour.getTemp().intValue() + "\u2103 | " + (int)(1.8 * forecastHour.getTemp() + 32) + "\u2109";
    }

    public static String formatPrecipitation(ForecastHour forecastHour) {
	if (forecastHour.getPrecipitation() != null && forecastHour.getPrecipitation().doubleValue() > 0)
	    return windSpeedFormat.format(forecastHour.getPrecipitation())
		    + " mm";
	else
	    return "none";

    }

    public static String formatWindSpeed(ForecastHour forecastHour) {
	return windSpeedFormat.format(forecastHour.getWindSpeed() * 3.6)
		+ " km/h";
    }

}
