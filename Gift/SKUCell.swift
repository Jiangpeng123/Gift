//
//  SKUCell.swift
//  Gift
//
//  Created by qianfeng on 16/11/2.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit

class SKUCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yellowView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .None
       
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
//        self.contentView.backgroundColor = selected ? (UIColor.whiteColor()) : (UIColor.init(white: 0.9, alpha: 0.1))
        
        if  selected {
            self.backgroundColor = UIColor.whiteColor()
            
        }else{
            self.backgroundColor = UIColor.init(white: 0, alpha: 0.1)
        }
        
        self.highlighted = selected
        self.titleLabel.highlighted = selected
        self.yellowView.hidden = !selected
    }
    
}













