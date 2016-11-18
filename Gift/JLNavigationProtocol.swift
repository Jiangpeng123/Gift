//
//  JLNavigationProtocol.swift
//  Gift
//
//  Created by qianfeng on 16/10/21.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit

enum BarButtonPosition {
    case left
    case right
}

protocol JLNavigationProtocol:NSObjectProtocol {
    //设置标题
    func addTitle(title:String)
    //设置按钮
    func addBarButton(title:String?,imageName:String?,bgImageName:String?,postion:BarButtonPosition,select:Selector)
}

extension JLNavigationProtocol where Self:UIViewController{
    //封装navigationItem标题
    func addTitle(title:String){
        let label=UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        label.text=title
        label.font=UIFont.boldSystemFontOfSize(fontLeveOne)
        label.textColor=UIColor.whiteColor()
        label.textAlignment = .Center
        navigationItem.titleView=label
    }
    //封装navigationItem按钮
    func addBarButton(title:String?=nil,imageName:String?=nil,bgImageName:String?=nil,postion:BarButtonPosition,select:Selector){
        let button=UIButton(frame: CGRect(x: 0, y: 0, width: 55, height: 30))
        if title != nil{
            button.setTitle(title, forState: .Normal)
        }
        if imageName != nil {
            button.setImage(UIImage(named: imageName!), forState: .Normal)
        }
        if bgImageName != nil{
            button.setBackgroundImage(UIImage(named:bgImageName!) , forState: .Normal)
        }
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.setTitleColor(colorGray, forState: .Highlighted)
        button.addTarget(self, action: select, forControlEvents: .TouchUpInside)
        let barButtonItem=UIBarButtonItem(customView: button)
        if postion == .left {
            if navigationItem.leftBarButtonItems != nil{
                navigationItem.leftBarButtonItems=navigationItem.leftBarButtonItems!+[barButtonItem]
            }else{
                navigationItem.leftBarButtonItems=[barButtonItem]
            }
        }else{
            if navigationItem.rightBarButtonItems != nil{
                navigationItem.rightBarButtonItems=navigationItem.rightBarButtonItems!+[barButtonItem]
            }else{
                navigationItem.rightBarButtonItems=[barButtonItem]
            }
        }
    }
}

