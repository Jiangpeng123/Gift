//
//  SubHotView.swift
//  Gift
//
//  Created by qianfeng on 16/10/27.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit

class SubHotView: UIViewController {
    var SubUrl:String!
    var webView:UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        configUI()
    }
    func configUI() {
        automaticallyAdjustsScrollViewInsets = false
        webView = UIWebView(frame: CGRect(x: 0, y: 64, width: screenWidth, height: screenHeight-103))
        let url = NSURL(string: SubUrl)
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        view.addSubview(webView)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
