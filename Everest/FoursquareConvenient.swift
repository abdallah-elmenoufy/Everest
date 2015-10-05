//
//  FoursquareConvenient.swift
//  Everest
//
//  Created by Abdallah ElMenoufy on 9/13/15.
//  Copyright (c) 2015 Abdallah ElMenoufy. All rights reserved.
//

import Foundation


extension FoursquareClient {
    
    /* Function to download Venues near-around the dropped pin, using Search method, find more details here: https://developer.foursquare.com/docs/venues/search */
    
    func downloadVenuesForPin(pin: Pin, completionHandler: (success :Bool, error: NSError?) -> Void) {
        
        // Build the URL and make the GET request for Search method
        let urlRequest = buildRequestForVenueLocation(pin)
        let task = session.dataTaskWithRequest(urlRequest) {
            data, response, downloadError in
        
        // Check to see if there's an error in downloading Venues
        if let error = downloadError {
            print("There was an error downloading Venues response, its: \(error.localizedDescription)")
        } else {
            // Parse the received JSON response to extract the downloaded Venues
            var parsedResults: AnyObject?
            do {
                parsedResults = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as? NSDictionary
                    } catch let error as NSError {
                        print("There was an error parsing Venues JSON, its: \(error.localizedDescription)")
                        parsedResults = nil
                }
            print(parsedResults)
            }
        }
        task.resume()
    }
    
    
    
    
    
// MARK: - Helper functions
    
    // Function to build the called URL from its parameters as requested into foursquare docs
    func buildRequestForVenueLocation(pin: Pin) -> NSURLRequest {
        
        return NSURLRequest(URL: NSURL(string: Constants.BaseFoursquareURL + Methods.Search + "?ll=\(pin.coordinate.latitude),\(pin.coordinate.longitude)&client_id=\(Constants.FoursquareClientID)&client_secret=\(Constants.FoursquareClientSecret)&v=\(self.todaysDate())")!)
    }
 
    
    // Function to get today's date formatted as requested to be passed in GET Url for Search method
    func todaysDate() -> NSString {
        let date = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyMMdd"
        return formatter.stringFromDate(date)
    }
    
}