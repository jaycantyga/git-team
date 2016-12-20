//
//  PaulViewController.swift
//  GitTeam
//
//  Created by Paul Jurczyk on 12/20/16.
//  Copyright © 2016 jay. All rights reserved.
//

import UIKit

class PaulViewController: BaseViewController {

    
    private enum Boo {
        case show
        case hide
        mutating func toggle() {
            switch self {
            case .hide:
                self = .show
            case .show:
                self = .hide
            }
        }
    }
    
    private var booStatus: Boo = .hide
    var orignalViewHeight: CGFloat!

    
    
    
    
    // MARK: IBOutlets ------------
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    
    
    // MARK: IBAction --------
    
    
    @IBAction func peekaTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1,
                       animations: {
                        self.heightConstraint.constant = self.booStatus == .show ? 0.0 : self.orignalViewHeight!
                        self.view.layoutIfNeeded()
                        self.booStatus.toggle()
        })
    }
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      orignalViewHeight = heightConstraint.constant
      heightConstraint.constant = 0
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
