//
//  PresentViewController.swift
//  Gift
//
//  Created by qianfeng on 16/11/2.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit

class PresentViewController: UIViewController {
   let titlesName = ["精选","送女票","海淘","创意生活","送基友","送爸妈","送同事","设计感","文艺风","奇葩搞怪","科技范","数码","萌萌哒","爱读书"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        createController()
        createNavBtn()
        createSearchBar()
    }
    
    func createSearchBar() {
        let textField = UITextField(frame: CGRect(x: 10, y: 7, width: kScreenWidth-10-50, height: 30))
        textField.placeholder = "🔍搜索单品、攻略"
        textField.clearButtonMode = .WhileEditing
        textField.borderStyle =  .RoundedRect
        textField.delegate = self
        self.navigationItem.titleView = textField
        
        
    }
    
    func createNavBtn()  {
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 17))
        view.image = UIImage(named: "jingxuan_navi_left")
        let bbtn1 = UIBarButtonItem(customView: view)
        self.navigationItem.leftBarButtonItem = bbtn1
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 19))
        btn.setImage(UIImage(named: "btn_remind"), forState: .Normal)
        let bbtn2 = UIBarButtonItem(customView: btn)
        self.navigationItem.rightBarButtonItem = bbtn2

    }
    
    func createController(){
        var array:[UIViewController]=[]
        for i in 0..<titlesName.count {
            if i==0 {
                let vc1=ViewControllerZero()
                vc1.title=titlesName[i]
                vc1.view.backgroundColor=UIColor.clearColor()
                vc1.url = urlArray[i]
                vc1.loadData()
                array.append(vc1)
            }else {
                let vc2 = PresentSecondView()
                vc2.title=titlesName[i]
                vc2.url = urlArray[i]
                vc2.view.backgroundColor = UIColor.whiteColor()
                vc2.loadData()
                array.append(vc2)
            }
        }
        let skScNavC=SKScNavViewController(subViewControllers: array)
        skScNavC.addParentController(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}

extension PresentViewController:UITextFieldDelegate {
   
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        let vc = SearchBarController()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
        
        return true
    }
    
}

