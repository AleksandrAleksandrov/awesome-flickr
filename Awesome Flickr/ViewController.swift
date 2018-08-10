//
//  ViewController.swift
//  Awesome Flickr
//
//  Created by Aleksandr on 8/9/18.
//  Copyright © 2018 Aleksandr. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON
import Foundation

class ViewController: UITableViewController {
    
    let FLICK_URL = "https://api.flickr.com/services/rest/"
    let APP_KEY = "35128e160dd7c7c214715a5634434907"
    var itemArray: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 350
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
                let postsJSON : JSON = JSON(response.result.value!)
                let posts = postsJSON["photos"]["photo"].array

                for item in posts! {
                    let post: Post = Post()
                    post.title = item["title"].stringValue
                    post.url_s = item["url_s"].stringValue
                    self.itemArray.append(post)
                }
                self.tableView.reloadData()
            } else {
                print("faile")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableViewCell
        if itemArray.count != 0 {
            let post = itemArray[indexPath.row]
            cell.labelTitle.text = post.title
            if post.url_s != "" {
                let url = URL(string: post.url_s)
                let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                cell.imagePost.image = UIImage(data: data!)
            } else {
                cell.imagePost.image = nil
            }
            
//            Alamofire.request(post.url_s).responseImage { response in
//                if let image = response.result.value {
//                    cell.imagePost.image = image
//                }
//            }
        } else {
            cell.labelTitle?.text = "empty"
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if itemArray.count == 0 {
            return 1
        } else {
            return itemArray.count
        }
    }

}

