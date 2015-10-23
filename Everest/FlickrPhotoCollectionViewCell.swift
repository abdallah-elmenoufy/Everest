//
//  FlickrPhotoCollectionViewCell.swift
//  Pin Explorer
//
//  Created by Abdallah ElMenoufy on 10/7/15.
//  Copyright © 2015 Abdallah ElMenoufy. All rights reserved.
//

import Foundation
import UIKit

class FlickrPhotoCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    override func prepareForReuse() {
        
        super.prepareForReuse()
        
        if imageView.image == nil {
            
            activityIndicatorView.startAnimating()
        }
    }
}
