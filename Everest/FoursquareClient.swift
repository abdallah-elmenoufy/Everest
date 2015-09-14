//
//  FoursquareClient.swift
//  Everest
//
//  Created by Abdallah ElMenoufy on 9/13/15.
//  Copyright (c) 2015 Abdallah ElMenoufy. All rights reserved.
//

import Foundation

class FoursquareClient {
    
    //MARK: - Shared Instance
    
    //Single line shared instance declaration as proved in http://krakendev.io/blog/the-right-way-to-write-a-singleton
    
    static let sharedInstance = FoursquareClient()
    
    //MARK: - Properties
    
    var session: NSURLSession
    
    //MARK: - Initialiser
    
    private init() {
        
        session = NSURLSession.sharedSession()
    }
    
    
    
    
    
}
