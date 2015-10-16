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
    @NSManaged var venueId: String?
    @NSManaged var venuePhotoUrlString: String
    @NSManaged var pin: Pin
    @NSManaged var photosForVenues: NSMutableOrderedSet
    
    
  
    //MARK: - Initialisers
    
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    init(venueName: String, venuePhotoUrlString: String, pin: Pin, context: NSManagedObjectContext) {
        
        // Core Data
        let entity = NSEntityDescription.entityForName("FoursquareVenue", inManagedObjectContext: context)!
        super.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.venueName = venueName
        self.venuePhotoUrlString = venuePhotoUrlString
        self.pin = pin
        self.photosForVenues = NSMutableOrderedSet()
        
    }
    
    
}
