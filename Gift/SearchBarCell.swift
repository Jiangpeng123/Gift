//
//  SearchBarCell.swift
//  Gift
//
//  Created by qianfeng on 16/11/26.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit

class SearchBarCell: UITableViewCell {

    @IBOutlet weak var leftImageView: UIImageView!
    
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
