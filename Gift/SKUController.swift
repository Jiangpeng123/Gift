//
//  SKUController.swift
//  Gift
//
//  Created by qianfeng on 16/10/26.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit

class SKUController: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var dataArray:[SKUModel] = []
    var tableView:UITableView!
    var collectionView:UICollectionView!
    var selectIndex = 0
    var isScrollDown:Bool = true
    var lastOffsetY:CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        configUI()
        loadData()
    }
    func configUI() {
        automaticallyAdjustsScrollViewInsets = false
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 80, height: screenHeight-69-49-20), style: .Plain)
        tableView.separatorColor = UIColor.clearColor()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 55
        tableView.showsVerticalScrollIndicator = false
        tableView.registerNib(UINib(nibName: "SKUCell", bundle: nil), forCellReuseIdentifier: "SKUCellId")
        view.addSubview(tableView)
       
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 2
        flowLayout.minimumLineSpacing = 2
        flowLayout.scrollDirection = .Vertical
        collectionView = UICollectionView(frame: CGRect(x:80+2, y: 2, width: screenWidth-80-4, height: screenHeight-64-49-40-4), collectionViewLayout: flowLayout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.whiteColor()
        collectionView.registerNib(UINib(nibName: "SKUCollectionCell", bundle: nil), forCellWithReuseIdentifier: "SKUCollectionCellId")
        self.collectionView.registerClass(SKUHeadView.classForCoder(), forSupplementaryViewOfKind:UICollectionElementKindSectionHeader,withReuseIdentifier: "header")
        view.addSubview(collectionView)
        
    }
    
    func loadData() {
        let path = NSBundle.mainBundle().pathForResource("liwushuo", ofType: "json")
        let data = NSData(contentsOfFile: path!)
        
        let array = (try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers))["data"]!!["categories"] as! [AnyObject]
        for item in array {
            let model = SKUModel()
            model.setValuesForKeysWithDictionary(item as! [String : AnyObject])
            dataArray.append(model)
        }
        //self.tableView.reloadData()
        //self.collectionView.reloadData()
        self.tableView.selectRowAtIndexPath(NSIndexPath.init(forRow: 0, inSection: 0), animated: true, scrollPosition: .Top)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension SKUController {
    
    //MARK:tableView的代理方法
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return dataArray.count
//    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SKUCellId", forIndexPath: indexPath) as! SKUCell
        let model = dataArray[indexPath.row]
        cell.titleLabel.text = model.name
        return cell
    }
    
    //左边TableView被点击的时候，处理右边的CollectionView
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectIndex = indexPath.row
        self.collectionView.scrollToItemAtIndexPath(NSIndexPath.init(forItem: 0, inSection: selectIndex), atScrollPosition: .Top, animated: true)
    }

    
    //MARK:collectionView的代理方法
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return dataArray.count
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (dataArray[section].subcategories).count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake((screenWidth - 80 - 4 - 4) / 3,
                            (screenWidth - 80 - 4 - 4) / 3 + 30)
        
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SKUCollectionCellId", forIndexPath: indexPath) as! SKUCollectionCell
        let model = dataArray[indexPath.section]
        cell.topImageView.kf_setImageWithURL(NSURL(string: model.subcategories[indexPath.row].icon_url))
        cell.nameLabel.text = model.subcategories[indexPath.row].name
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSizeMake(screenWidth-80, 20)
    }
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let kind = UICollectionElementKindSectionHeader
        let model = dataArray[indexPath.section]
        let header=collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "header", forIndexPath: indexPath) as! SKUHeadView
        header.label.text = model.name
        
        return header
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let idNumber = dataArray[indexPath.section].subcategories[indexPath.row].idNumber
        if idNumber != nil {
            let url = "http://api.liwushuo.com/v2/item_subcategories/\(idNumber!)/items?limit=20&offset=%ld"
            let vc = SKUSubController()
            vc.webUrl = url
            vc.hidesBottomBarWhenPushed = true
            vc.title = dataArray[indexPath.section].subcategories[indexPath.row].name
            navigationController?.pushViewController(vc, animated: true)
        }

    }


}

extension SKUController {
    func collectionView(collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, atIndexPath indexPath: NSIndexPath) {
        //当前CollectionView滚动的方向向上，CollectionView是用户拖拽而产生滚动的（主要是判断CollectionView是用户拖拽而滚动的，还是点击TableView而滚动的）

        if !isScrollDown && collectionView.dragging {
            self.selectRowAtIndexPath(indexPath.section)
        }
    }
    
    func collectionView(collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, atIndexPath indexPath: NSIndexPath) {
        // 当前CollectionView滚动的方向向下，CollectionView是用户拖拽而产生滚动的（主要是判断CollectionView是用户拖拽而滚动的，还是点击TableView而滚动的）
        
        if isScrollDown && collectionView.dragging {
            self.selectRowAtIndexPath(indexPath.section+1)
        }

    }
    
    //右边CollectionView被拖动的时候处理tableView
    func selectRowAtIndexPath(index:NSInteger) {

        self.tableView.selectRowAtIndexPath(NSIndexPath.init(forRow: index, inSection: 0), animated: true, scrollPosition: .Middle)
    }
    
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if (self.collectionView == scrollView)
        {
            isScrollDown = lastOffsetY < scrollView.contentOffset.y;
            lastOffsetY = scrollView.contentOffset.y;
        }

    }
    
    
}















