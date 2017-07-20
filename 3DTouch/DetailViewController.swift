//
//  DetailViewController.swift
//  PeekPop
//
//  Created by Frederik Jacques on 06/10/15.
//  Copyright © 2015 Frederik Jacques. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // IBOutlets
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    // Properties
    //var photo:Photo?
    var photoName:String = ""
    
   
    
    // Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

            let image = UIImage(named: photoName)
            imageView.image = image
            //captionLabel.text = photo.caption
            print(photoName)
            captionLabel.text = photoName
    }

    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()

    }
    
//override func previewActionItems() -> [UIPreviewActionItem] {
//        
//        let likeAction = UIPreviewAction(title: "Like", style: .default) { (action, viewController) -> Void in
//            print("You liked the photo")
//        }
//        
//        let deleteAction = UIPreviewAction(title: "Delete", style: .destructive) { (action, viewController) -> Void in
//            print("You deleted the photo")
//        }
//        
//        return [likeAction, deleteAction]
//        
//    }

    
    override var previewActionItems: [UIPreviewActionItem]
    {
        let likeAction = UIPreviewAction(title: "Like", style: .default) { (action, viewController) -> Void in
            print("You liked the photo")
            print(self.photoName)
        }
        
        let commentAction = UIPreviewAction(title: "Comment", style: .default) { (action, viewController) -> Void in
            print("Comment")
            print(self.photoName)
        }

        
        let deleteAction = UIPreviewAction(title: "Delete", style: .destructive) { (action, viewController) -> Void in
            print("You deleted the photo")
        }
        
        return [likeAction,commentAction, deleteAction]
        
    }
    
}
    

