package com.hourweather.importer;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.QueryResultIterable;
import com.google.appengine.tools.remoteapi.RemoteApiInstaller;
import com.google.appengine.tools.remoteapi.RemoteApiOptions;

public class CityDataImporter {
    public static void main(String[] args) throws IOException {
	String username = System.console().readLine("username: ");
	String password = new String(System.console().readPassword("password: "));
	
	//RemoteApiOptions options = new RemoteApiOptions().server("weatherhours.appspot.com", 443).credentials(username, password);
	RemoteApiOptions options = new RemoteApiOptions().server("localhost", 8888).credentials("","");
	RemoteApiInstaller installer = new RemoteApiInstaller();
	installer.install(options);
	
	try {
	    DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
	    
	    Query q = new Query("city");
	    q.setKeysOnly();
	    PreparedQuery pq = ds.prepare(q);
	    
	    QueryResultIterable<Entity> it = pq.asQueryResultIterable();
	    
	    for(Entity entity : it) {
		System.out.println("deleting " + entity.getKey());
		ds.delete(entity.getKey());
	    }
	    
	    FileReader input = new FileReader("cities.txt");	    
	    BufferedReader reader = new BufferedReader(input);
	    
	    String line;
	    String [] cityParts;
	    Entity city;
	    while((line = reader.readLine()) != null) {	
		cityParts = line.split("\t");
		
		city = new Entity("city", cityParts[0]);
		city.setProperty("name", cityParts[2]);
		city.setProperty("searchable-name", cityParts[2].toLowerCase());
		city.setProperty("latitude", Double.parseDouble(cityParts[4]));
		city.setProperty("longitude",Double.parseDouble(cityParts[5]));
		city.setProperty("country", cityParts[8]);
		city.setProperty("timezone", cityParts[17]);
		
		System.out.println("adding: " + cityParts[2]);
		ds.put(city);
	    }
	    
	} finally {
	    installer.uninstall();
	}
    }
}
