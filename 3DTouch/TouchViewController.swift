//
//  TouchViewController.swift
//  UserNotificationDemo
//
//  Created by Neha on 29/05/17.
//  Copyright © 2017 neha. All rights reserved.
//

import UIKit
private let reuseIdentifier = "photoCell"


class TouchViewController: UIViewController,UIViewControllerPreviewingDelegate,UICollectionViewDelegate,UICollectionViewDataSource{
    
    @IBOutlet weak var collectionView: UICollectionView!
    var photoName: [String] = []
//    lazy var photos:[Photo] = {
//        
//        return [
//            Photo(caption: "Lovely place", imageName: "GoaFort", city: "Goa"),
//            Photo(caption: "Capital", imageName: "RedFort", city: "Delhi"),
//            Photo(caption: "7 Wonders", imageName: "TajMahal", city: "Agra"),
//            Photo(caption: "Beautiful Place", imageName: "NandiHills", city: "Bangalore")
//        ]
//        
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //photoName = ["GoaFort", "RedFort","TajMahal","NandiHills"]
        photoName = ["GoaFort", "RedFort","TajMahal"]
        
        if( traitCollection.forceTouchCapability == .available)
        {
            
            registerForPreviewing(with: self as UIViewControllerPreviewingDelegate, sourceView: view)
            
        }
        
    


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: UICollectionViewDataSource methods
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return photoName.count
        
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! PhotoCollectionViewCell
        
        // Configure the cell
        let photo = photoName[indexPath.row]
        
        if let image = UIImage(named: photo)
        {
            cell.imageView.image = image
            
        }
        else
        {
            cell.imageView.image = UIImage(named: "image-not-found")
        }
        
        return cell
    }
    
    
    // MARK: UIViewControllerPreviewingDelegate methods
    
    public func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController?
    {
        guard let indexPath = collectionView?.indexPathForItem(at: location) else { return nil }
        
        guard let cell = collectionView?.cellForItem(at: indexPath) else { return nil }
        
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return nil }
        
        let photo = photoName[indexPath.row]
        detailVC.photoName = photo
        
        detailVC.preferredContentSize = CGSize(width: 0.0, height: 300)
        
        previewingContext.sourceRect = cell.frame
        
        return detailVC
    }
    
    @available(iOS 9.0, *)
    public func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController)
    {
        show(viewControllerToCommit, sender: self)
    }
    
    
    
    
    

}
