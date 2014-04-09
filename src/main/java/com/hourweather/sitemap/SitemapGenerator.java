package com.hourweather.sitemap;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.SortDirection;
import com.google.appengine.tools.remoteapi.RemoteApiInstaller;
import com.google.appengine.tools.remoteapi.RemoteApiOptions;
import com.hourlyweather.web.City;

public class SitemapGenerator {
    public static void main(String[] args) throws IOException {
	String username = null;//System.console().readLine("username: ");
	String password = null;//new String(System.console().readPassword("password: "));

	// RemoteApiOptions options = new
	// RemoteApiOptions().server("weatherhours.appspot.com",
	// 443).credentials(username, password);
	RemoteApiOptions options = new RemoteApiOptions().server("localhost",
		8888).credentials("", "");
	RemoteApiInstaller installer = new RemoteApiInstaller();
	installer.install(options);
	
	BufferedWriter writer = new BufferedWriter(new FileWriter("sitemap.xml"));
	
	//write header info
	writer.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
	writer.newLine();
	writer.write("<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">");
	writer.newLine();
	writer.newLine();
	writer.write("\t<url><loc>http://hourweather.com</loc><priority>8</priority></url>");

	writer.newLine();
	writer.newLine();
	
	try {
	    // query database for city geo data
	    DatastoreService ds = DatastoreServiceFactory.getDatastoreService();

	    Query citys = new Query("city");
	    citys.addSort("country", SortDirection.DESCENDING);
	    citys.addSort("searchable-name", SortDirection.DESCENDING);
	    PreparedQuery pq = ds.prepare(citys);
	    
	    String country = null;
	    for (Entity result : pq.asIterable()) {
		City city = new City(result);
		//write url
		writer.newLine();
		writer.write("\t<url><loc>");
		writer.write("http://www.hourweather.com/forecast/");
		writer.write(city.getName().replaceAll(" ", "%20"));
		writer.write("?id=");
		writer.write(city.getId());
		writer.write("</loc></url>");
	    }

	} finally {
	    installer.uninstall();
	}
	writer.newLine();
	writer.write("</urlset>");
	
	writer.close();
    }
}
