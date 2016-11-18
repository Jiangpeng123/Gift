//
//  SKUHeadView.swift
//  Gift
//
//  Created by qianfeng on 16/11/2.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit

class SKUHeadView: UICollectionReusableView {
    var label:UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        label = UILabel(frame: CGRect(x: 0, y: 2,width: screenWidth-80, height: 20))
        label.textAlignment = .Center
        label.font = UIFont.systemFontOfSize(14)
        label.backgroundColor = UIColor.colorWith(R: 245, G: 245, B: 245, A: 0.8)
        addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
