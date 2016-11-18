//
//  GongLueSortSubCell.swift
//  Gift
//
//  Created by qianfeng on 16/10/31.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit

class GongLueSortSubCell: UICollectionViewCell {

    @IBOutlet weak var gongLueSortSubImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        gongLueSortSubImageView.layer.cornerRadius = 5
        gongLueSortSubImageView.layer.masksToBounds = true
    }

}
