//
//  HeaderReusableView.swift
//  Gift
//
//  Created by qianfeng on 16/10/25.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit

class HeaderReusableView: UICollectionReusableView {
    var hotHeadImageView:UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        hotHeadImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 200))
        addSubview(hotHeadImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
