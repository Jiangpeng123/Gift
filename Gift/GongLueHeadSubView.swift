//
//  GongLueHeadSubView.swift
//  Gift
//
//  Created by qianfeng on 16/10/30.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher
//攻略顶部ScrollView第二视图
class GongLueHeadSubView: UIViewController,UITableViewDataSource,UITableViewDelegate,JLTableViewProtocol1 {
    var dataArray:[GongLueHeadSubModel] = []
    var number:NSNumber!
    var url:String!
    var tableView:UITableView!
    var currentCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        configUI()
        loadData()
        
    }
    
    func configUI() {
        automaticallyAdjustsScrollViewInsets = false
        tableView = UITableView(frame: CGRect(x: 0, y: 64, width: screenWidth, height: screenHeight-64), style: .Grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(UINib(nibName: "GongLueHeadSubCell", bundle: nil), forCellReuseIdentifier: "GongLueHeadSubCellId")
        view.addSubview(tableView)
    }
    
    func loadData() {
        url = "http://api.liwushuo.com/v2/columns/\(number)?limit=20&offset=0"
        Alamofire.request(.GET, url).responseJSON { (response) in
            
                let array = (response.result.value)!["data"]!!["posts"] as! [AnyObject]
                for item in array {
                    
                    let model = GongLueHeadSubModel()
                    model.setValuesForKeysWithDictionary(item as! [String : AnyObject])
                    
                    self.dataArray.append(model)
                }
                self.tableView.reloadData()
                
            
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension GongLueHeadSubView {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GongLueHeadSubCellId", forIndexPath: indexPath) as! GongLueHeadSubCell
        let model = dataArray[indexPath.row]
        cell.mainImageView.kf_setImageWithURL(NSURL(string: model.cover_image_url ?? ""))
        cell.titleLabel.text = model.title ?? ""
        cell.nameLabel.text = model.author[0].nickname ?? ""
        cell.likeLabel.text = "\(model.likes_count!)" ?? "0"
        var date = NSDate()
        let a = Double(arc4random()%3000)
        date = NSDate(timeIntervalSinceNow: (-a)*80*80)
        let str = "\(date)"
        let range = str.startIndex.advancedBy(5)...str.startIndex.advancedBy(9)
        let str1 = str.substringWithRange(range)
        cell.dateLabel.text = str1
        
        return cell
    }
    
}
extension GongLueHeadSubView {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc = GongLueThirdView()
        let url = dataArray[indexPath.row].url
        vc.webStr = url
        navigationController?.pushViewController(vc, animated: true)
    }
}










