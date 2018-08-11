//
//  Post.swift
//  Awesome Flickr
//
//  Created by Aleksandr on 8/9/18.
//  Copyright © 2018 Aleksandr. All rights reserved.
//

import Foundation
import Unbox

struct Post {
    var title: String?
    var url_s: String?
}

extension Post: Unboxable {
    init(unboxer: Unboxer) throws {
        self.title = try unboxer.unbox(key: "title")
        self.url_s = try unboxer.unbox(key: "url_s")
    }
}
