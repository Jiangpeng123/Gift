//
//  SubSuperCell.swift
//  Gift
//
//  Created by qianfeng on 16/10/28.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit

class SubSuperCell: UITableViewCell {

    @IBOutlet weak var nameImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subnameLabel: UILabel!
    @IBOutlet weak var superImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var lineImageView: UIImageView!
    @IBOutlet weak var programa: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    
    @IBAction func likeBtn(sender: UIButton) {
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        nameImageView.backgroundColor = UIColor.redColor()
        nameImageView.layer.cornerRadius = 20
        nameImageView.layer.masksToBounds = true
        programa.font = UIFont.systemFontOfSize(14)
        programa.textColor = UIColor.grayColor()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
