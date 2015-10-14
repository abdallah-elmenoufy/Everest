//
//  FoursquarePhotoForVenue.swift
//  Everest
//
//  Created by Abdallah ElMenoufy on 10/6/15.
//  Copyright © 2015 Abdallah ElMenoufy. All rights reserved.
//

import Foundation
import CoreData

@objc(FoursquarePhotoForVenue)

class FoursquarePhotoForVenue: NSManagedObject {
    
    //MARK: - NSManagedProperties for the Foursquare Photo for each Venue
    
    @NSManaged var resolvablePhotoUrl: String
    @NSManaged var resolvablePhotoFilePath: String?
    @NSManaged var foursquareVenue: FoursquareVenue
   
    //MARK: - Initialisers
    
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    init(resolvablePhotoUrl: String, foursquareVenue: FoursquareVenue, context: NSManagedObjectContext) {
        
        // Core Data
        let entity = NSEntityDescription.entityForName("FoursquarePhotoForVenue", inManagedObjectContext: context)!
        super.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.resolvablePhotoUrl = resolvablePhotoUrl
        self.foursquareVenue = foursquareVenue
    }

    
}