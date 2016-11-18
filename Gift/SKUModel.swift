//
//  SKUModel.swift
//  Gift
//
//  Created by qianfeng on 16/10/27.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit

class SKUModel: NSObject {
    var name:String!
    var subcategories:[Subcategories]!
    override func setValue(value: AnyObject?, forKey key: String) {
        if key == "subcategories" {
            var array:[Subcategories] = []
            for dic in value as! NSArray{
                let model = Subcategories()
                model.setValuesForKeysWithDictionary(dic as! [String : AnyObject])
                array.append(model)
            }
            subcategories = array
        }else{
            super.setValue(value, forKey: key)
        }
    }
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}

class Subcategories:NSObject {
    var name:String!
    var icon_url:String!
    var idNumber:NSNumber!
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    override func setValue(value: AnyObject?, forKey key: String) {
        if key == "id" {
            idNumber = value as! NSNumber
        }else {
            super.setValue(value, forKey: key)
        }
    }
}

