//
//  SKLaunchMenuItem.swift
//  Gift
//
//  Created by qianfeng on 16/11/16.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit

class SKLaunchMenuItem: UICollectionViewCell {
    
    var titleLabel:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel = UILabel(frame: CGRectMake(0, 0, kScreenWidth / 5, 40))
        titleLabel.backgroundColor = UIColor.groupTableViewBackgroundColor()
        //titleLabel.backgroundColor = UIColor.redColor()
        titleLabel.font = UIFont.systemFontOfSize(14)
        titleLabel.textAlignment = NSTextAlignment.Center
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.layer.borderColor = UIColor.init(white: 0.9, alpha: 1.0).CGColor
        self.layer.borderWidth = 0.5
        
        self.contentView.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
