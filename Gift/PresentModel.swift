//
//  PresentModel.swift
//  Gift
//
//  Created by qianfeng on 16/10/20.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit

class PresentModel: NSObject {
    var cover_image_url:String!
    var title:String!
    var introduction:String!
    var likes_count:NSNumber?
    var content_url:String?
    var type:String!
    var url:String!
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}


//class ColumnModel:NSObject {
//    var title:String!
//    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
//        
//    }
//
//}