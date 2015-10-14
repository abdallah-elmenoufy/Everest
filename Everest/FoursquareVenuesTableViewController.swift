//
//  FoursquareVenuesTableViewController.swift
//  Everest
//
//  Created by Abdallah ElMenoufy on 10/14/15.
//  Copyright © 2015 Abdallah ElMenoufy. All rights reserved.
//

import UIKit
import CoreData

class FoursquareVenuesTableViewController: UITableViewController, NSFetchedResultsControllerDelegate  {

    
    //Pin received from MapViewController
    var receivedPin: Pin!
    
    
    //MARK: Core Data convenience
    var sharedContext: NSManagedObjectContext {
        return CoreDataStackManager.sharedInstance.managedObjectContext!
    }
    
    
    // fetchedResultsController
    lazy var fetchedResultsController: NSFetchedResultsController = {
        
        //Create fetch request for photos which match the sent Pin.
        let fetchRequest = NSFetchRequest(entityName: "FoursquareVenue")
        fetchRequest.predicate = NSPredicate(format: "pin == %@", self.receivedPin)
        fetchRequest.sortDescriptors = []
        
        //Create fetched results controller with the new fetch request.
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,
            managedObjectContext: self.sharedContext,
            sectionNameKeyPath: nil,
            cacheName: nil)
        
        fetchedResultsController.delegate = self
        
        return fetchedResultsController
        }()
  
    
}

extension FoursquareVenuesTableViewController {
    
    // MARK: - TableView methods
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Return the number of objects fetched from the NSFetchResultsController
        if let sectionInfo = self.fetchedResultsController.sections![section] as NSFetchedResultsSectionInfo? {
            return sectionInfo.numberOfObjects
        } else {
            return 1
        }
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("FoursquareVenuesCell", forIndexPath: indexPath)
        let venue = fetchedResultsController.objectAtIndexPath(indexPath) as! FoursquareVenue
        
        cell.textLabel?.text = venue.venueName
        
        return cell
        
    }
}