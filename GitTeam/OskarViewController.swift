//
//  OskarViewController.swift
//  GitTeam
//
//  Created by oskar morett on 12/20/16.
//  Copyright © 2016 jay. All rights reserved.
//

import UIKit

class OskarViewController: BaseViewController  {
   
   @IBOutlet weak var image: UIImageView!
   override func viewDidLoad() {
      super.viewDidLoad()
      
      let url = URL(string: "http://vmagazine.com/wp-content/uploads/2016/08/V103_COVERSTORY_HR_NOTEXT7-e1471987178392.jpg")!
      
      let request = NSMutableURLRequest(url: url)
      
      let task = URLSession.shared.dataTask(with: request as URLRequest) {
         data, response, error in
         
         if error != nil {
            
            print(error.debugDescription)
            
         } else {
            
            if let data = data {
               
               if let bachImage = UIImage(data: data) {
                  
                  self.image.image = bachImage
                  
               }
               
            }
            
         }
         
      }
      task.resume()
      
   }
}
