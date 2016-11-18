//
//  GongLueHeadCell.swift
//  Gift
//
//  Created by qianfeng on 16/10/28.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit

class GongLueHeadCell: UICollectionViewCell {

    @IBOutlet weak var GongLueHeadImageView: UIImageView!
    
    @IBOutlet weak var GongLueTitleLabel: UILabel!
    
    @IBOutlet weak var GongLueNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        GongLueHeadImageView.layer.cornerRadius = 5
        GongLueHeadImageView.layer.masksToBounds = true
        GongLueHeadImageView.userInteractionEnabled = true
        
    }

}
