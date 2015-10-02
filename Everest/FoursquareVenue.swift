//
//  FoursquareVenue.swift
//  Everest
//
//  Created by Abdallah ElMenoufy on 10/2/15.
//  Copyright © 2015 Abdallah ElMenoufy. All rights reserved.
//

import Foundation
import CoreData
import UIKit

@objc(FoursquareVenue)

class FoursquareVenue: NSManagedObject {
    
    
    
    //MARK: - Initialisers
    
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    
}
