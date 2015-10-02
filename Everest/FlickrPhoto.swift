//
//  FlickrPhoto.swift
//  Virtual Tourist
//
//  Created by Abdallah ElMenoufy on 9/13/15.
//  Copyright (c) 2015 Abdallah ElMenoufy. All rights reserved.
//

import Foundation
import CoreData
import UIKit

@objc(FlickrPhoto)

class FlickrPhoto: NSManagedObject {
    
    //MARK: - Properties
    
    @NSManaged var flickrPhotoURL: String
    @NSManaged var flickrImageFilePath: String?
    @NSManaged var pin: Pin
    
    var image: UIImage? {
        
        if let flickrImageFilePath = flickrImageFilePath {
            
            // Check to see if there's an error downloading the images for each Pin
            if flickrImageFilePath == "error" {
                
                return UIImage(named: "Ooops.jpg")
            }
            
            // Get the filePath
            let fileName = flickrImageFilePath.lastPathComponent
            let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] 
            let pathArray = [dirPath, fileName]
            let fileURL = NSURL.fileURLWithPathComponents(pathArray)!
            
            return UIImage(contentsOfFile: fileURL.path!)
        }
        return nil
    }
    
    //MARK: - Initialisers
    
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    init(flickrPhotoURL: String, pin: Pin, context: NSManagedObjectContext) {
        
        //Core Data
        let entity = NSEntityDescription.entityForName("FlickrPhoto", inManagedObjectContext: context)!
        super.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.flickrPhotoURL = flickrPhotoURL
        self.pin = pin
    }
    
    //MARK: - Overrides
    
    override func prepareForDeletion() {
        
        //Delete the associated image file when the FlickrPhoto managed object is deleted
        if let fileName = flickrImageFilePath?.lastPathComponent {
            
            let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] 
            let pathArray = [dirPath, fileName]
            let fileURL = NSURL.fileURLWithPathComponents(pathArray)!
            
            do {
                try NSFileManager.defaultManager().removeItemAtURL(fileURL)
            } catch _ {
            }
        }
    }
}

/* Added extension for String class to get the lastPathComponent as a workaround for non-existance in Swift 2.0
    Reference are here: https://forums.developer.apple.com/thread/13580 */

extension String {
    
    var lastPathComponent: String {
        
        get {
            return (self as NSString).lastPathComponent
        }
    }
}
