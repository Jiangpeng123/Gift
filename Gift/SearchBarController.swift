//
//  SearchBarController.swift
//  Gift
//
//  Created by qianfeng on 16/11/17.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit

class SearchBarController: UIViewController,UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        createNavBar()
    }
    
    func createNavBar() {
        let textField = UITextField(frame: CGRect(x: 10, y: 7, width: kScreenWidth-10-50, height: 30))
        textField.placeholder = "🔍搜索单品、攻略"
        textField.clearButtonMode = .WhileEditing
        textField.borderStyle =  .RoundedRect
        textField.delegate = self
        self.navigationItem.titleView = textField
        
        
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
        btn.setTitle("取消", forState: .Normal)
        
        btn.setTitleColor(UIColor.brownColor(), forState: .Normal)
        let bbtn = UIBarButtonItem(customView: btn)
        btn.addTarget(self, action: #selector(btnClick), forControlEvents: .TouchUpInside)
        self.navigationItem.rightBarButtonItem = bbtn
        
    }
    
    func btnClick() {
        navigationController?.popViewControllerAnimated(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

extension SearchBarController {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let vc = SearchBarSubController()
        self.navigationController?.pushViewController(vc, animated: true)
        
        let urlString:NSString = "http://api.liwushuo.com/v2/search/item?keyword=\(textField.text!)&limit=20&offset=%ld&sort=\(textField.text!)"
        vc.urlString = urlString
        return true
    }
    /*http://api.liwushuo.com/v2/search/item?keyword=%E5%B8%BD%E5%AD%90&limit=20&offset=%ld&sort= */
    /*http://api.liwushuo.com/v2/search/item?keyword=裤子&limit=20&offset=%ld&sort=裤子*/
    /*http://api.liwushuo.com/v2/search/item?keyword=kuzi&limit=20&offset=0&sort=kuzi*/
    /*http://api.liwushuo.com/v2/search/item?keyword=kuzi&limit=20&offset=0&sort=kuzi*/
}





