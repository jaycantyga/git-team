//
//  KellyViewController.swift
//  GitTeam
//
//  Created by Kelly McNevin on 12/20/16.
//  Copyright © 2016 jay. All rights reserved.
//

import UIKit
import Foundation

class KellyViewController: BaseViewController{
    
    var client = APIClient()

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        client.getData(search: "puppies", completion: { result in
            
            self.client.fetchImages(images: result, completion: { result in
                
                self.imageView.image = UIImage(data: result)
                
            })
        })

    }
    @IBAction func kittensButtonWasTapped(_ sender: Any) {
        
        client.getData(search: "kittens", completion: { result in
            
            self.client.fetchImages(images: result, completion: { result in
                
                self.imageView.image = UIImage(data: result)
                
            })
        })

        
    }
    @IBAction func refreshButtonWasTapped(_ sender: Any) {
        
        client.getData(search: "puppies", completion: { result in
            
            self.client.fetchImages(images: result, completion: { result in
                
                self.imageView.image = UIImage(data: result)
                
            })
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


class Image {
    var imageName: String
    
    init(imageName: String){
        self.imageName = imageName
    }
}


class APIClient{
    
    func getData(search: String, completion: @escaping (String) -> ()) {
        
        let endpoint = "https://api.giphy.com/v1/gifs/search?q=\(search)&api_key=dc6zaTOxFJmzC"
        print(endpoint)
        let url = URLRequest(url: URL(string: endpoint)!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) { data, _, _ in
            let json = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: Any]
            let images = self.getImages(json)
            
            DispatchQueue.main.async {
                completion(images)
            }
            
        }
        
        task.resume()
    }
    
    func getImages(_ json: [String: Any]) -> String {
        
        var list = json["data"] as! [Any]
        
        let randomNumber = Int(arc4random_uniform(9))
        
        let item = list[randomNumber] as! [String: Any]
        
        let itemComponent = item["images"] as! [String: Any]
        
        let firstIndex = itemComponent["fixed_height_small"] as! [String: Any]
        let image = firstIndex["url"] as! String
        
        return image
    }
    
    
    func fetchImages(images: String, completion: @escaping (Data) -> ()) {
        
        let endpoint = images
        let url = URLRequest(url: URL(string: endpoint)!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) { data, _, _ in
            guard let responseData = data else {
                return
            }
            DispatchQueue.main.async {
                completion(responseData)
            }
            
        }
        
        task.resume()
    }
}


