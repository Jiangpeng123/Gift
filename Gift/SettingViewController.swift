//
//  SettingViewController.swift
//  Gift
//
//  Created by qianfeng on 16/10/20.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit
import SnapKit

class SettingViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    var loginView:UIImageView!
    var midView:UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createLoginUI()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.hidden = true
    }
    
    
    func createLoginUI() {
        
        self.view.backgroundColor = UIColor.whiteColor()
        loginView = UIImageView()
        self.loginView.userInteractionEnabled = true
        loginView.image = UIImage(named: "checkusertype_bg")
        self.view.addSubview(loginView)
        loginView.snp_makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(self.view)
        }
        let headerView = UIImageView()
        headerView.backgroundColor = UIColor.whiteColor()
        let g = UITapGestureRecognizer()
        g.addTarget(self, action: #selector(tapClick))
        headerView.addGestureRecognizer(g)
        loginView.addSubview(headerView)
        headerView.snp_makeConstraints { (make) in
            make.top.equalTo(80)
            make.centerX.equalTo(self.view)
            make.width.height.equalTo(80)
        }
        headerView.layer.cornerRadius = 40
        headerView.layer.masksToBounds = true
        
        let label = UILabel()
        loginView.addSubview(label)
        label.textColor = UIColor.whiteColor()
        label.textAlignment = .Center
        label.font = UIFont.systemFontOfSize(13)
        label.text = "18367430928"
        label.snp_makeConstraints { (make) in
            make.top.equalTo(170)
            make.width.equalTo(120)
            make.height.equalTo(20)
            make.centerX.equalTo(self.view)
        }
        //label.backgroundColor = UIColor.brownColor()
        
        let leftBtn = UIButton()
        loginView.addSubview(leftBtn)
        leftBtn.setTitle("积分:0", forState: .Normal)
        leftBtn.layer.borderColor = UIColor.whiteColor().CGColor
        leftBtn.layer.borderWidth = 1
        leftBtn.layer.cornerRadius = 10
        leftBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
        leftBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        leftBtn.snp_makeConstraints { (make) in
            make.top.equalTo(220)
            make.left.equalTo(60)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
        
        let rightBtn = UIButton(type: .InfoLight)
        loginView.addSubview(rightBtn)
        rightBtn.setTitle("积分指南", forState: .Normal)
        rightBtn.layer.borderColor = UIColor.whiteColor().CGColor
        rightBtn.layer.borderWidth = 1
        rightBtn.layer.cornerRadius = 10
        rightBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        rightBtn.setTitleColor(UIColor.grayColor(), forState: .Highlighted)
        rightBtn.addTarget(self, action: #selector(rightBtnClick), forControlEvents: .TouchUpInside)
        rightBtn.snp_makeConstraints { (make) in
            make.top.equalTo(220)
            make.right.equalTo(-60)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
        midView = UIView()
        midView.backgroundColor = UIColor.whiteColor()
        self.loginView.addSubview(midView)
        midView.snp_makeConstraints { (make) in
            make.left.right.equalTo(self.loginView)
            make.top.equalTo(260)
            make.height.equalTo(60)
        }
        
        let nameArray = ["shopcart_bt","order_bt","discount_bt","me_follow_bt","costomer_bt@2x"]
        let titleArray = ["购物车","订单","礼券","关注","客服"];
        let btnWidth = (screenWidth-20)/CGFloat(nameArray.count)
        var lastbtn = UIButton()
        for i in 0..<nameArray.count {
            let btn = UIButton()
            btn.setImage(UIImage(named: nameArray[i]), forState: .Normal)
            btn.titleLabel?.font = UIFont.systemFontOfSize(12)
            btn.setTitle(titleArray[i], forState: .Normal)
            btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
            btn.titleEdgeInsets = UIEdgeInsetsMake(40, -32, 0, 30)
            btn.tag = 200+i
            midView.addSubview(btn)
            if i == 0 {
                btn.snp_makeConstraints(closure: { (make) in
                    make.top.equalTo(0)
                    make.height.equalTo(50)
                    make.width.equalTo(btnWidth)
                    make.left.equalTo(20)
                })
            }else if i == 4 {
                btn.snp_makeConstraints(closure: { (make) in
                    make.top.equalTo(0)
                    make.height.equalTo(50)
                    make.width.equalTo(btnWidth)
                    make.right.equalTo(0)
                })
            }else {
                btn.snp_makeConstraints(closure: { (make) in
                    make.top.equalTo(0)
                    make.height.equalTo(50)
                    make.width.equalTo(btnWidth)
                    make.left.equalTo(lastbtn.snp_right).offset(0)
                })
            }
            lastbtn = btn
        }
        
    }
    
    func tapClick() {
        let imageCtrl = UIImagePickerController()
        imageCtrl.sourceType = .PhotoLibrary
        imageCtrl.delegate = self;
        self.presentViewController(imageCtrl, animated: true, completion: nil)
    }
    
    
    func rightBtnClick() {
        let vc = PointViewController()
        vc.webString = "http://www.liwushuo.com/credit/rules"
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
