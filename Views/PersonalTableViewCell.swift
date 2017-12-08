//
//  PersonalTableViewCell.swift
//  TalksBeauty
//
//  Created by sunny on 2017/11/14.
//  Copyright © 2017年 sunny. All rights reserved.
//

import UIKit

class PersonalTableViewCell: UITableViewCell {

    @IBOutlet weak var imageContainer: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func setImage(image: String, title: String) {
        
        self.imageContainer.kf.setImage(with: URL(string: image))
        self.imageContainer.layer.masksToBounds = true
        self.imageContainer.contentMode = .scaleAspectFill
        self.titleLabel.text = title
    }
}
