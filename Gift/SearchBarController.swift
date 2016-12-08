//
//  SearchBarController.swift
//  Gift
//
//  Created by qianfeng on 16/11/17.
//  Copyright © 2016年 Jiangpeng. All rights reserved.


import UIKit

class SearchBarController: UIViewController,UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate {
    var textField:UITextField!
    var dataArray:[DataModel] = []
    var dataArray1:[DataModel] = []
    
    var tableView:UITableView!
    var model=DataModel()
    var isReturn:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        configUI()
        createNavBar()
        configUI()
        loadData()
    }
    
    func configUI() {
        tableView = UITableView(frame: CGRect(x: 0, y: 64, width: screenWidth, height: screenWidth-64), style: .Plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .None
        self.tableView.registerNib(UINib(nibName: "SearchBarCell", bundle: nil), forCellReuseIdentifier: "searchBarCellId")
        self.view.addSubview(tableView)
    }
    
    func loadData() {
        //反序
        dataArray.removeAll()
        dataArray1.removeAll()
        dataArray = DataBase.shareDataBase.selectNum(10) ?? []
        for(var i=dataArray.count-1;i>=0;i-=1){
            dataArray1.append(dataArray[i])
        }
        
        self.tableView.reloadData()
        
    }
    
    func createNavBar() {
        textField = UITextField(frame: CGRect(x: 10, y: 7, width: kScreenWidth-10-50, height: 30))
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
        self.navigationItem.hidesBackButton = true
    }
    
    func btnClick() {
        
        navigationController?.popViewControllerAnimated(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

extension SearchBarController {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray1.count
        
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("searchBarCellId", forIndexPath: indexPath) as! SearchBarCell
        let model = dataArray1[indexPath.row]
        cell.titleLabel.text =  model.title ?? ""
        return cell
        
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return .Delete
    }
    
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "删除"
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let model = dataArray1[indexPath.row]
        DataBase.shareDataBase.deleteWith(Title: model.title)
        dataArray1.removeAtIndex(indexPath.row)
        
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }
    
    
    
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let vc = SearchBarSubController()
        self.navigationController?.pushViewController(vc, animated: true)
        let urlString:NSString = "http://api.liwushuo.com/v2/search/item?keyword=\(textField.text!)&limit=20&offset=%ld&sort=\(textField.text!)"
        vc.urlString = urlString
        
        model.title = textField.text!
        
        let result = DataBase.shareDataBase.selectEntity(textField.text!)
        if result == nil {
            DataBase.shareDataBase.insertWithModel(model)
        }
        isReturn = true
        loadData()
        
        return true
    }
    
}





