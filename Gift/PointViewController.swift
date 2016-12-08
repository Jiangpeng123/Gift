//
//  PointViewController.swift
//  Gift
//
//  Created by qianfeng on 16/11/30.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit

class PointViewController: UIViewController {
    var webString:String!
    var webView:UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        configUI()
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.hidden = false

    }
    
    
    func configUI() {
        automaticallyAdjustsScrollViewInsets = false
        webView = UIWebView(frame: CGRect(x: 0, y: 64, width: screenWidth, height: screenHeight-64))
        let url = NSURL(string: webString ?? "")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        view.addSubview(webView)
        let btn = UIButton()
        btn.frame = CGRectMake(0, 10, 60, 24)
        btn.setTitle("返回", forState: .Normal)
        btn.setTitleColor(UIColor.brownColor(), forState: .Normal)
        btn.setTitleColor(UIColor.grayColor(), forState: .Highlighted)
        btn.addTarget(self, action: #selector(btnClick), forControlEvents: .TouchUpInside)
        let bbtn = UIBarButtonItem(customView: btn)
        self.navigationItem.leftBarButtonItem = bbtn
    }
    
    func btnClick() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
