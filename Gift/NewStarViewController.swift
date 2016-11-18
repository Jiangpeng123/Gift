
//  NewStarViewController.swift
//  Gift

//  Created by qianfeng on 16/10/25.
//  Copyright © 2016年 Jiangpeng. All rights reserved.


import UIKit

class NewStarViewController: SuperViewController {
    //private var HotUrl:String!
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.whiteColor()
        url = NewStarUrl
        loadData()
        configUI()
    }
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}




