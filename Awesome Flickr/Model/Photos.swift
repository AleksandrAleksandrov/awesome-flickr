//
//  Photos.swift
//  Awesome Flickr
//
//  Created by Aleksandr on 8/11/18.
//  Copyright © 2018 Aleksandr. All rights reserved.
//

import Foundation
import Unbox

struct Photos {
    var total: Int
    var photosArray: [Post]
}

extension Photos: Unboxable {
    init(unboxer: Unboxer) throws {
        self.total = try unboxer.unbox(key: "total")
        self.photosArray = try unboxer.unbox(key: "photo")
    }
}
