package com.paramparaevents.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.paramparaevents.config.DbConfig;
import com.paramparaevents.model.ServiceModel;
import com.paramparaevents.model.UserModel;

/**
 * Service class for handling event services operations.
 * Connects to the database and retrieves service information.
 */
public class ServicesService {
    private Connection dbConn;
    private boolean isConnectionError = false;

    /**
     * Constructor initializes the database connection.
     * Sets the connection error flag if the connection fails.
     */
    public ServicesService() {
        try {
            dbConn = DbConfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            isConnectionError = true;
        }
    }

    /**
     * Retrieves all distinct service types from the database.
     * 
     * @return List of unique service types
     */
    public List<String> getAllServiceTypes() {
        List<String> types = new ArrayList<>();

        if (isConnectionError) {
            System.out.println("Connection Error!");
            return types;
        }

        String query = "SELECT DISTINCT Type FROM service ORDER BY Type";

        try (PreparedStatement stmt = dbConn.prepareStatement(query);
             ResultSet result = stmt.executeQuery()) {

            while (result.next()) {
                types.add(result.getString("Type"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return types;
    }

    /**
     * Retrieves services by type from the database.
     * 
     * @param type The type of services to retrieve
     * @return List of ServiceModel objects filtered by type
     */
    public List<ServiceModel> getServicesByType(String type) {
        List<ServiceModel> services = new ArrayList<>();

        if (isConnectionError) {
            System.out.println("Connection Error!");
            return services;
        }

        String query = "SELECT Service_ID, Name, Description, Cost, Type, ServiceTags FROM service WHERE Type = ?";

        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, type);
            ResultSet result = stmt.executeQuery();

            while (result.next()) {
                ServiceModel service = new ServiceModel();
                service.setServiceId(result.getInt("Service_ID"));
                service.setName(result.getString("Name"));
                service.setDescription(result.getString("Description"));
                service.setCost(result.getInt("Cost"));
                service.setType(result.getString("Type"));
                service.setServiceTags(result.getString("ServiceTags"));

                services.add(service);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return services;
    }

    /**
     * Retrieves a service by its ID.
     * 
     * @param serviceId The ID of the service to retrieve
     * @return ServiceModel object containing service information; null if not found
     */
    public ServiceModel getServiceById(int serviceId) {
        if (isConnectionError) {
            System.out.println("Connection Error!");
            return null;
        }

        String query = "SELECT Service_ID, Name, Description, Cost, Type, ServiceTags FROM service WHERE Service_ID = ?";

        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setInt(1, serviceId);
            ResultSet result = stmt.executeQuery();

            if (result.next()) {
                ServiceModel service = new ServiceModel();
                service.setServiceId(result.getInt("Service_ID"));
                service.setName(result.getString("Name"));
                service.setDescription(result.getString("Description"));
                service.setCost(result.getInt("Cost"));
                service.setType(result.getString("Type"));
                service.setServiceTags(result.getString("ServiceTags"));

                return service;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * Retrieves all services from the database.
     * 
     * @return List of ServiceModel objects containing service information; empty list if no services found or on error
     */
    public List<ServiceModel> getAllServices() {
        List<ServiceModel> services = new ArrayList<>();

        if (isConnectionError) {
            System.out.println("Connection Error!");
            return services;
        }

        String query = "SELECT Service_ID, Name, Description, Cost, Type, ServiceTags FROM service";

        try (PreparedStatement stmt = dbConn.prepareStatement(query);
             ResultSet result = stmt.executeQuery()) {

            while (result.next()) {
                ServiceModel service = new ServiceModel();
                service.setServiceId(result.getInt("Service_ID"));
                service.setName(result.getString("Name"));
                service.setDescription(result.getString("Description"));
                service.setCost(result.getInt("Cost"));
                service.setType(result.getString("Type"));
                service.setServiceTags(result.getString("ServiceTags"));

                services.add(service);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return services;
    }

    public List<ServiceModel> getServices() {
    	if (isConnectionError) {
    		System.out.println("Connection Error!");
    		return null;
    	}

    	String query = "SELECT Service_ID, Name, Description, Cost, Type, ImgPath FROM service";
    	System.out.println("Running getServices()...");

    	try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
    		ResultSet result = stmt.executeQuery();
    		List<ServiceModel> serviceList = new ArrayList<>();

    		while (result.next()) {
    			ServiceModel s = new ServiceModel(
    				result.getInt("Service_ID"),
    				result.getString("Name"),
    				result.getString("Description"),
    				result.getInt("Cost"),
    				result.getString("Type"),
    				result.getString("ImgPath")
    			);
    			serviceList.add(s);
    			System.out.println("Fetched service: " + s.getName());
    		}

    		System.out.println("Total services fetched: " + serviceList.size());
    		return serviceList;

    	} catch (SQLException e) {
    		System.out.println("SQL error: " + e.getMessage());
    		e.printStackTrace();
    		return null;
    	}
    }

}
