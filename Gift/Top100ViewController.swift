//
//  Top100ViewController.swift
//  Gift
//
//  Created by qianfeng on 16/10/25.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit

class Top100ViewController: SuperViewController {
    //private var HotUrl:String!
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.whiteColor()
        url = Top100Url
        loadData()
        configUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}




