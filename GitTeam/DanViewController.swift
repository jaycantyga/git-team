//
//  DanViewController.swift
//  GitTeam
//
//  Created by Dan Hefter on 12/20/16.
//  Copyright © 2016 jay. All rights reserved.
//

import UIKit

class DanViewController: BaseViewController {
   
   @IBOutlet weak var myImage: UIImageView!
   
   @IBOutlet weak var buttonOutlet: UIButton!
   
   
   @IBAction func startDance(_ sender: Any) {
      print(myImage.frame)
      
      myImage.isHidden = false
      
      UIView.animate(withDuration: 4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 30, options: UIViewAnimationOptions.curveEaseInOut, animations: {
         self.myImage.frame.origin.y += 100
      }, completion: { _ in
            self.buttonOutlet.setTitle("You're a weird kid Lloyd...", for: .normal)
      })
      
   }
      
   
   
   

    override func viewDidLoad() {
        super.viewDidLoad()
      
      myImage.isHidden = true
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

   
   





}
