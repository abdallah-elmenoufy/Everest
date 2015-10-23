//
//  FoursquareVenuesTableViewController.swift
//  Pin Explorer
//
//  Created by Abdallah ElMenoufy on 10/14/15.
//  Copyright © 2015 Abdallah ElMenoufy. All rights reserved.
//

import UIKit
import CoreData

class FoursquareVenuesTableViewController: UITableViewController  {
    
    //Pin received from MapViewController
    var receivedPin: Pin!
    
    
    //MARK: Core Data convenience
    var sharedContext: NSManagedObjectContext {
        return CoreDataStackManager.sharedInstance.managedObjectContext!
    }
    
    override func viewDidLoad() {
        tableView.reloadData()
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Dynamic sizing for the header view
        if let headerView = tableView.tableHeaderView {
            let height = headerView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height
            var headerFrame = headerView.frame
            
            // If we don't have this check, viewDidLayoutSubviews() will get repeatedly, causing the app to hang.
            if height != headerFrame.size.height {
                headerFrame.size.height = height
                headerView.frame = headerFrame
                tableView.tableHeaderView = headerView
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    // Function to fetchAllVenues from CoreData
    func fetchAllVenues() -> [FoursquareVenue] {
        
        let error: NSErrorPointer = nil
        let fetchRequest = NSFetchRequest(entityName: "FoursquareVenue")
        let results: [AnyObject]?
        do {
            results = try sharedContext.executeFetchRequest(fetchRequest)
        } catch let error1 as NSError {
            error.memory = error1
            results = nil
        }
        
        if error != nil {
            print("Error retreving saved Venues, its \(error.debugDescription)")
        }
        
        return results as! [FoursquareVenue]
    }

    // Function to fetchAllPhotosImages associated with this Venue
    func fetchAllPhotosForVenue() -> [FoursquarePhotoForVenue] {
        
        let error: NSErrorPointer = nil
        let fetchReauest = NSFetchRequest(entityName: "FoursquarePhotoForVenue")
        let results: [AnyObject]?
        do {
            results = try sharedContext.executeFetchRequest(fetchReauest)
        } catch let error1 as NSError {
            error.memory = error1
            results = nil
        }
        
        if error != nil {
            print("There was an error reteriving Photos images for this venue, its: \(error.debugDescription)")
        }
        
        return results as! [FoursquarePhotoForVenue]
    }

    
}

extension FoursquareVenuesTableViewController {
    
    // MARK: - TableView methods
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return fetchAllVenues().count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("FoursquareVenuesCell", forIndexPath: indexPath)
        let venue = fetchAllVenues()[indexPath.row]
        
        let imageForVenue = fetchAllPhotosForVenue()[indexPath.row]
        
        cell.textLabel?.text = venue.venueName
        cell.detailTextLabel?.text = venue.country!
        
        if imageForVenue.image != nil {
            
            let imageViewSize = CGSize(width: 500, height: 500)
            cell.imageView?.sizeThatFits(imageViewSize)
            cell.imageView?.image = imageForVenue.image
        }
        
        
        return cell
        
    }
}