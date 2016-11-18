//
//  ClassifyModel.swift
//  Gift
//
//  Created by qianfeng on 16/10/26.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit

class ClassifyModel: NSObject {
    var name:String!
    var imageModels:[ClassifyImageModel] = []
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}

class ClassifyImageModel:NSObject {
    var cover_image_url:String!
    var id:NSNumber!
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}


