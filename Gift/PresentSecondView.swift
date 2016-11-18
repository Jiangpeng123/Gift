//
//  PresentSecondView.swift
//  Gift
//
//  Created by qianfeng on 16/11/2.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit
import Alamofire

class PresentSecondView: UIViewController,UITableViewDelegate,UITableViewDataSource,JLTableViewProtocol1 {
    var dataArray:[PresentModel] = []
    var url = ""
    lazy var WebUrl = ""
    var currentCount = 0
    var height:CGFloat = 330
    var tableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        congifUI()
        loadData()
        addRefresh({[unowned self] in
            self.currentCount = 0
            self.loadData()
        }) { [unowned self] in
            self.currentCount += 20
            self.loadData()
        }
        
    }
    
    func congifUI() {
        automaticallyAdjustsScrollViewInsets = false
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight-99-49), style: .Grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .None
        
        
        tableView.registerNib(UINib(nibName: "PresentCell", bundle: nil), forCellReuseIdentifier: "cell")

        view.addSubview(tableView)
    }
    func loadData() {
        
        Alamofire.request(.GET, String(format: url,currentCount)).responseJSON(completionHandler: {[unowned self] (response) in
            self.tableView.mj_header.endRefreshing() //结束刷新
            self.tableView.mj_footer.endRefreshing()
            if self.currentCount == 0 {
                self.dataArray.removeAll()
            }
            if response.result.error==nil{
                let dic=response.result.value as! [String:AnyObject]
                let array = dic["data"]!["items"] as! [[String:AnyObject]]
                for item in array {
                    let model = PresentModel()
                    model.setValuesForKeysWithDictionary(item)
                    self.dataArray.append(model)
                    
                }
                self.tableView.reloadData()
                //print(self.dataArray.count)
            }})
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

extension PresentSecondView {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return height
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        if indexPath.row==0{
//            let cell1=tableView.dequeueReusableCellWithIdentifier("cell1", forIndexPath: indexPath) as! ScrollViewCell
//            return cell1
//        }
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! PresentCell
        let model = dataArray[indexPath.row]
        if model.type == "ad"  {
            
        }else  {
            cell.PresentImage.kf_setImageWithURL(NSURL(string: model.cover_image_url ?? "0"))
            cell.titleLabel.text = model.title ?? "0"
            cell.detailLabel.text = model.introduction ?? "0"
            cell.columnLabel.text = "小礼菌出品" ?? "0"
            //WebUrl = model.content_url ?? ""
            
            if model.likes_count == nil {
                cell.collectCountLabel.text = "0"
                
            }else {
                cell.collectCountLabel.text = "\(model.likes_count!)"
                
            }
           
        }
        return cell
    }
    
}

extension PresentSecondView {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc = SubTableViewController()
        WebUrl = dataArray[indexPath.row].url ?? ""
        vc.SubUrl = self.WebUrl
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
