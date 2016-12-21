//
//  ViewController.swift
//  GitTeam
//
//  Created by jay on 12/19/16.
//  Copyright © 2016 jay. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    private static var segueIds = [
       "ToAndrew", "toAman", "toPaul","toKelly", "toDan", "ToAlex", "ToIsrael", "toRichel", "toGrace", "toOskar", "toEd", "toMatt"
    ]
    
    var index : Int {
        return navigationController!.viewControllers.count - 1
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if index < BaseViewController.segueIds.count {
            let button = UIBarButtonItem(barButtonSystemItem: .fastForward, target: self, action: #selector(forwardButtonHit(_:)))
            navigationItem.rightBarButtonItem = button
        }
    }
    
    func forwardButtonHit(_ sender: UIBarButtonItem) {
        
        navigationController?.performSegue(
            withIdentifier: BaseViewController.segueIds[index],
            sender: nil
        )
    }
}

