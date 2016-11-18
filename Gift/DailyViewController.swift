//
//  DailyViewController.swift
//  Gift
//
//  Created by qianfeng on 16/10/25.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit

class DailyViewController: SuperViewController {
    //private var HotUrl:String!
    var strArray:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        url = DailyUpdataUrl
        
        loadData()
        configUI()
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


