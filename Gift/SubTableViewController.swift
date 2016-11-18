//
//  SubTableViewController.swift
//  Gift
//
//  Created by qianfeng on 16/10/27.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit
import Alamofire

class SubTableViewController: UIViewController {
    var SubUrl:String! 
    var webView:UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        view.backgroundColor = UIColor.whiteColor()
    }
    
    func configUI() {
        automaticallyAdjustsScrollViewInsets = false
        webView = UIWebView(frame: CGRect(x: 0, y: 64, width: screenWidth, height: screenHeight-104))
        
        let url = NSURL(string: SubUrl)
        
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        view.addSubview(webView)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
