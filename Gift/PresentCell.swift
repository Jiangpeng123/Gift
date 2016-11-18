//
//  PresentCell.swift
//  Gift
//
//  Created by qianfeng on 16/10/20.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit

class PresentCell: UITableViewCell {
    @IBOutlet weak var PresentImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var pageLine: UIView!
    @IBOutlet weak var columnLabel: UILabel!
    @IBOutlet weak var collectLabel: UIView!
    
    @IBOutlet weak var collectCountLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
