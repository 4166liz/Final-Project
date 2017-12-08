//
//  FollowTableViewCell.swift
//  TalksBeauty
//
//  Created by sunny on 2017/11/13.
//  Copyright © 2017年 sunny. All rights reserved.
//

import UIKit
import Kingfisher

class FollowTableViewCell: UITableViewCell {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var imageContainer: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    
    func load(email: String, content: String, image: String) {
        self.imageContainer.kf.setImage(with: URL(string: image))
        self.imageContainer.layer.masksToBounds = true
        self.imageContainer.contentMode = .scaleAspectFill
        self.contentLabel.text = content
        self.emailLabel.text = email
    }
}
