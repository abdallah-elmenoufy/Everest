//
//  FoursquareConstants.swift
//  Everest
//
//  Created by Abdallah ElMenoufy on 9/13/15.
//  Copyright (c) 2015 Abdallah ElMenoufy. All rights reserved.
//

import Foundation

extension FoursquareClient {
    
    // MARK: - Constants
    
    struct Constants {
        
        static let FoursquareClientID  = "BCRH14BH5Q5WI5F3G3G4IQV52CRUM33HLTPEONQHLTECH3KO"
        
        static let FoursquareClientSecret = "ELA2TBX4NSXHIDR54YN0QTI2JTACCF33U4ECMJUREQF3CDJU"
        
        static let BaseFoursquareURL = "https://api.foursquare.com/v2/"
    }

    
    // MARK: - Methods
    
    struct Methods {
        
        static let Search = "venues/search"
        
        static let Explore = "venues/explore"
    }
    
    
}