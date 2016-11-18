//
//  GongLueHeadSubCell.swift
//  Gift
//
//  Created by qianfeng on 16/10/30.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit

class GongLueHeadSubCell: UITableViewCell {
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!

    @IBOutlet weak var likeImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
