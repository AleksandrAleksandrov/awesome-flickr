//
//  BaseResponseModel.swift
//  Awesome Flickr
//
//  Created by Aleksandr on 8/11/18.
//  Copyright © 2018 Aleksandr. All rights reserved.
//

import Foundation
import Unbox

struct BaseResponseModel {
    var stat: String
    var photos: Photos
}

extension BaseResponseModel: Unboxable {
   init(unboxer: Unboxer) throws {
        self.stat = try unboxer.unbox(key: "stat")
        self.photos = try unboxer.unbox(key: "photos")
    }
}
