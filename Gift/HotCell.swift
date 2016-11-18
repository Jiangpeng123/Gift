//
//  HotCell.swift
//  Gift
//
//  Created by qianfeng on 16/10/25.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit

class HotCell: UICollectionViewCell {
    @IBOutlet weak var hotImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    var str:String!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
