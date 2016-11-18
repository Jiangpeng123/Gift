//
//  Extension-UIColor.swift
//  Gift
//
//  Created by qianfeng on 16/10/19.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    class func colorWith(R r:CGFloat,G g:CGFloat,B b:CGFloat,A a: CGFloat = 1.0) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
}
