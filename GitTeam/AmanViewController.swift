//
//  AmanViewController.swift
//  GitTeam
//
//  Created by Aman Singh on 12/20/16.
//  Copyright © 2016 jay. All rights reserved.
//

import UIKit

class AmanViewController: BaseViewController {
    
    @IBOutlet weak var imageResult: UIImageView!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func pressThis(_ sender: Any) {
            searchForImages(searchTerm: "Happy")
    }
    
    var imageSearches = [ImageSearch]()
    
    func searchForImages(searchTerm: String) {

        let newSearchTerm = searchTerm.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        
        let urlString = "https://api.giphy.com/v1/gifs/search?q=\(newSearchTerm)&api_key=dc6zaTOxFJmzC"

        let url = URL(string: urlString)!
        
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let responseData = data else {
                return
            }
            do {
                let object = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) as! [String: Any]
                let arrayDict = object["data"] as! [[String: Any]]
                
                let randomOutput = (Int(arc4random()))%arrayDict.count
                
                let randomValue = arrayDict[randomOutput] 
                let imageDict = randomValue["images"] as! [String: Any]
                let fixedHeightDict = imageDict["fixed_height"] as! [String: String]
                let imageURL = fixedHeightDict["url"] 
            
                let newURL = URL(string: imageURL!)
                URLSession.shared.dataTask(with: newURL!) { data, response, error in
                    guard let responseData = data else {
                        return
                    }
                    let image = UIImage(data: responseData)
                    DispatchQueue.main.async {
                        self.imageResult.image = image
                    }
                    }.resume()
            } catch {
                print(error)
            }
        }).resume()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        searchForImages(searchTerm: "Happy")
    }
}

class ImageSearch {
    private var _imageURL: String!
    
    var imageURL: String {
        return _imageURL
    }
    
    init(imageURL: String) {
        _imageURL = imageURL
    }
}
