//
//  ScrollViewCell.swift
//  Gift
//
//  Created by qianfeng on 16/10/21.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit

class ScrollViewCell: UITableViewCell {
    
    var jlScrollView:JLScrollView!
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        jlScrollView=JLScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 200))
        contentView.addSubview(jlScrollView)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
