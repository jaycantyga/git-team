//
//  DataModel.swift
//  GitTeam
//
//  Created by Benjamin Landau on 12/20/16.
//  Copyright © 2016 jay. All rights reserved.
//

import Foundation
import UIKit


class Presidents {
    
    var name: String
    var image: UIImage?
    
    init(name: String, image: UIImage?) {
        self.name = name
        self.image = image
    }
}


var arrayOfPresidents: [Presidents] = [

    Presidents(name: "Abraham Lincoln", image: #imageLiteral(resourceName: "AbrahamLincoln")),
    
    Presidents(name: "John Adams", image: #imageLiteral(resourceName: "JohnAdams")),
    
    Presidents(name: "George Washington", image: #imageLiteral(resourceName: "GeorgeWashington")),
    
    Presidents(name: "Dwight Eisenhower", image: #imageLiteral(resourceName: "DwightEisenHower")),
    
    Presidents(name: "John F Kennedy", image: #imageLiteral(resourceName: "JFK"))
    

]
