//
//  GongLueHeadSubModel.swift
//  Gift
//
//  Created by qianfeng on 16/10/30.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit

class GongLueHeadSubModel: NSObject {
    //头部视图
    //var banner_image_url:String!
    //var description1:String!
    var title:String!
    var likes_count:NSNumber!
    var url:String!
    var cover_image_url:String!
    var author:[GongLueHeadThirdModel] = []
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    override func setValue(value: AnyObject?, forKey key: String) {
        if key == "author" {
            var array1:[GongLueHeadThirdModel] = []
            let model = GongLueHeadThirdModel()
            model.setValuesForKeysWithDictionary(value as! [String : AnyObject])
            array1.append(model)
            author = array1
        }else {
            super.setValue(value, forKey: key)
        }
    }
    
}



class GongLueHeadThirdModel:NSObject {
    var nickname:String!
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}


