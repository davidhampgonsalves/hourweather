package com.hourlyweather.web;

import javax.servlet.ServletException;

public class LocationException extends ServletException {
    private static final long serialVersionUID = 1L;
    
    public LocationException(String msg) {super(msg);}
}
