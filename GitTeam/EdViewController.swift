//
//  EdViewController.swift
//  GitTeam
//
//  Created by Edward Han on 12/20/16.
//  Copyright © 2016 jay. All rights reserved.
//

import UIKit


class EdViewController: BaseViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black
        
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.image = #imageLiteral(resourceName: "Image")
        imageView.alpha = 0
    
        
        imageView.layer.cornerRadius = imageView.layer.borderWidth / 5
        
        UIView.animate(withDuration: 11.0, delay: 2, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.imageView.alpha = 1.0
        }, completion: nil)
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
