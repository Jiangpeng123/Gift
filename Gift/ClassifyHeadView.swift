//
//  ClassifyHeadView.swift
//  Gift
//
//  Created by qianfeng on 16/10/26.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit

//攻略CollectionView的头部视图
class ClassifyHeadView: UICollectionReusableView {
    var hotHeadImageView:UIImageView!
    var leftLabel:UILabel!
    var rightLabel:UILabel!
    //var jumpClosure:(String -> Void)?
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.userInteractionEnabled = true
        hotHeadImageView = UIImageView(frame: CGRect(x: 0, y: 10, width: screenWidth, height: 30))
        leftLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 30, height: 20))
        leftLabel.font = UIFont.systemFontOfSize(13)
        leftLabel.textColor = UIColor.brownColor()
        hotHeadImageView.userInteractionEnabled = true
        hotHeadImageView.backgroundColor = UIColor.whiteColor()
        hotHeadImageView.addSubview(leftLabel)
        rightLabel = UILabel(frame: CGRect(x: screenWidth-80, y: 10, width: 80, height: 20))
        rightLabel.font = UIFont.boldSystemFontOfSize(13)
        rightLabel.textColor = UIColor.brownColor()
        rightLabel.userInteractionEnabled = true
        hotHeadImageView.addSubview(rightLabel)
        addSubview(hotHeadImageView)
        
//        let g = UITapGestureRecognizer(target: self, action: #selector(tapAction))
//        
//        rightLabel.addGestureRecognizer(g)
    }
//    func tapAction() {
//        jumpClosure!("")
//    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
