//
//  GongLueSubView.swift
//  Gift
//
//  Created by qianfeng on 16/10/29.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

//单品和对象的下一个页面
class GongLueSubView: UIViewController,UITableViewDelegate,UITableViewDataSource,JLTableViewProtocol1 {
    var tableView:UITableView!
    var dataArray:[GongLueSubModel] = []
    var url:String!
    var currentCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        configUI()
        loadData()
        addRefresh({[unowned self] in
            self.currentCount = 0
            self.loadData()
        }) { [unowned self] in
            self.currentCount += 20
            self.loadData()
        }

    }
    
    
    func configUI() {
        automaticallyAdjustsScrollViewInsets = false
        tableView = UITableView(frame: CGRect(x: 0, y: 64, width: screenWidth, height: screenHeight-64), style: .Grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(UINib(nibName: "SubSuperCell", bundle: nil), forCellReuseIdentifier: "subSuperCellId")
        view.addSubview(tableView)
    }
    
    func loadData() {
        Alamofire.request(.GET,String(format: url,currentCount)).responseJSON { (response) in
            if response.result.error == nil {
                self.tableView.mj_header.endRefreshing() //结束刷新
                self.tableView.mj_footer.endRefreshing()
                if self.currentCount == 0 {
                    self.dataArray.removeAll()
                }

                let array = (response.result.value)!["data"]!!["items"] as! [AnyObject]
                for item in array {
                    
                    let model = GongLueSubModel()
                    model.setValuesForKeysWithDictionary(item as! [String : AnyObject])
                    
                    self.dataArray.append(model)
                }
                self.tableView.reloadData()
                
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension GongLueSubView {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dataArray.count != 0 {
            return dataArray.count
        }
        return 0
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 350
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "subSuperCellId"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath) as! SubSuperCell
        let model = dataArray[indexPath.row]
        cell.titleLabel.text = model.title
        cell.detailLabel.text = model.introduction
        cell.likeLabel.text = "\(model.likes_count!)"
        cell.superImageView.kf_setImageWithURL(NSURL(string:model.cover_image_url))
        
        cell.nameImageView.kf_setImageWithURL(NSURL(string: model.author[0].avatar_url))
        cell.nameLabel.text = model.author[0].nickname
        cell.subnameLabel.text = model.author[0].introduction
        cell.programa.text = "栏目:\(model.column[0].title)"

        return cell
    }
}

extension GongLueSubView {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc = GongLueThirdView()
        let thirdUrl = dataArray[indexPath.row].url
        vc.webStr = thirdUrl
        navigationController?.pushViewController(vc, animated: true)
    }
}



