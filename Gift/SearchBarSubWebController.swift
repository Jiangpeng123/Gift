//
//  SearchBarSubWebController.swift
//  Gift
//
//  Created by qianfeng on 16/11/18.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit

class SearchBarSubWebController: UIViewController {
    var webStr:String!
    var webView:UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        view.backgroundColor = UIColor.whiteColor()
    }
    
    
    func configUI() {
        automaticallyAdjustsScrollViewInsets = false
        webView = UIWebView(frame: CGRect(x: 0, y: 4, width: screenWidth, height: screenHeight-4))
        let url = NSURL(string: webStr)
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        
        view.addSubview(webView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
