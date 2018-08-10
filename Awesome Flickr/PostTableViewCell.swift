//
//  PostTableViewCell.swift
//  Awesome Flickr
//
//  Created by Aleksandr on 8/10/18.
//  Copyright © 2018 Aleksandr. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imagePost: UIImageView!
    
    @IBOutlet weak var labelTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
