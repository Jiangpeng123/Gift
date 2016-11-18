//
//  GongLueSubModel.swift
//  Gift
//
//  Created by qianfeng on 16/10/29.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit

class GongLueSubModel: NSObject {
    var cover_image_url:String!
    var title:String!
    var url:String!
    var introduction:String!
    var likes_count:NSNumber!
    var author:[GongLueSubAuthorModel] = []
    var column:[GongLueSubImageModel] = []
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    override func setValue(value: AnyObject?, forKey key: String) {
        if key == "author" {
            var dataArray1:[GongLueSubAuthorModel] = []
            let model = GongLueSubAuthorModel()
            model.setValuesForKeysWithDictionary(value as! [String : AnyObject])
            dataArray1.append(model)
            author = dataArray1
            
        
        } else if key == "column" {
            var dataArray2:[GongLueSubImageModel] = []
           
                let model = GongLueSubImageModel()
                model.setValuesForKeysWithDictionary(value as! [String : AnyObject])
                dataArray2.append(model)
        
            column = dataArray2
        } else {
            super.setValue(value, forKey: key)
            
            
        }
        
    }
    
}

class GongLueSubImageModel:NSObject {
    
    var title:String!
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}

class GongLueSubAuthorModel:NSObject {
    var avatar_url:String!
    var nickname:String!
    var introduction:String!
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}





