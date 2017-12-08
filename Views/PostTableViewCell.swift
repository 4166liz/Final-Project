//
//  PostTableViewCell.swift
//  TalksBeauty
//
//  Created by sunny on 2017/11/7.
//  Copyright © 2017年 sunny. All rights reserved.
//

import UIKit
import Kingfisher

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageContainer: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    func setImage(image: String, title: String) {
        
        self.imageContainer.kf.setImage(with: URL(string: image))
        self.imageContainer.layer.masksToBounds = true
        self.imageContainer.contentMode = .scaleAspectFill
        self.label.text = title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
