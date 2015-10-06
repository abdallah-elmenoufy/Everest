//
//  FoursquareVenue.swift
//  Everest
//
//  Created by Abdallah ElMenoufy on 10/2/15.
//  Copyright © 2015 Abdallah ElMenoufy. All rights reserved.
//

import Foundation
import CoreData


@objc(FoursquareVenue)

class FoursquareVenue: NSManagedObject {
    
    //MARK: - NSManagedProperties for the Foursquare Venue
    
    @NSManaged var venueName: String
    @NSManaged var venuePostalCode: Int
    @NSManaged var venueLocation: String
    @NSManaged var venueFormattedAddress: String
    @NSManaged var venueId: Int
    @NSManaged var venuePhotoUrlString: String
    @NSManaged var pin: Pin
    
    
  
    //MARK: - Initialisers
    
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    init(venueName: String, venuePostalCode: Int, venueLocation:String, venueFormattedAddress: String, venuePhotoUrlString: String, pin: Pin, context: NSManagedObjectContext) {
        
        // Core Data
        let entity = NSEntityDescription.entityForName("FoursquareVenue", inManagedObjectContext: context)!
        super.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.venueName = venueName
        self.venuePostalCode = venuePostalCode
        self.venueLocation = venueLocation
        self.venueFormattedAddress = venueFormattedAddress
        self.venuePhotoUrlString = venuePhotoUrlString
        self.pin = pin
        
    }
    
    
}
