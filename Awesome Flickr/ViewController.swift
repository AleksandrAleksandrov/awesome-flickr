//
//  ViewController.swift
//  Awesome Flickr
//
//  Created by Aleksandr on 8/9/18.
//  Copyright © 2018 Aleksandr. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let FLICK_URL = "https://api.flickr.com/services/rest/"
    let APP_KEY = "35128e160dd7c7c214715a5634434907"

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPosts()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func fetchPosts() {
        let params : [String : String] = ["api_key" : APP_KEY, "format" : "json", "nojsoncallback" : "1", "extras" : "url_s", "method" : "flickr.photos.getRecent"]
        
        Alamofire.request(FLICK_URL, method: .get, parameters: params).responseJSON {
            response in
            if response.result.isSuccess {
                print(response)
            } else {
                print("faile")
            }
        }
    }
}

