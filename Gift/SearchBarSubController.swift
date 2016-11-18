//
//  SearchBarSubController.swift
//  Gift
//
//  Created by qianfeng on 16/11/17.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit
import Alamofire
class SearchBarSubController: UIViewController,  UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,JLCollectionViewProtocol {
    
    var dataArray:[SearchBarSubModel] = []
    var urlString:NSString = ""
    
    var currentCount = 0
    var collectionView:UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        loadData()
        addRefresh({[unowned self] in
            self.currentCount = 0
            self.loadData()
        }) { [unowned self] in
            self.currentCount += 20
            self.loadData()
            
        }
        view.backgroundColor = UIColor.whiteColor()
    }
    func configUI() {
        automaticallyAdjustsScrollViewInsets = false
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 10
        flowLayout.scrollDirection = .Vertical
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 64, width: screenWidth, height: screenHeight-64), collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.whiteColor()
        collectionView.registerNib(UINib(nibName: "SearchBarSubCell", bundle: nil), forCellWithReuseIdentifier: "SearchBarSubCellId")
        view.addSubview(collectionView)
        
    }
    func loadData() {
        //url转码
        let url = NSString(format: urlString,currentCount)
        let encodedString = url.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
        
        Alamofire.request(.GET, encodedString! as String).responseJSON { [unowned self] (response) in
            self.collectionView.mj_header.endRefreshing()
            self.collectionView.mj_footer.endRefreshing()
            if self.currentCount == 0 {
                self.dataArray.removeAll()
            }
            if response.result.error==nil{
                let dics = (response.result.value) as! [String:AnyObject]
                let array = dics["data"]!["items"] as! [[String:AnyObject]]
                for dic in array {
                    let model = SearchBarSubModel()
                    model.setValuesForKeysWithDictionary(dic)
                    self.dataArray.append(model)
                }
            }
            self.collectionView.reloadData()
            
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SearchBarSubController {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 10, 10, 10)
        
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {

        return CGSize(width: CGFloat((screenWidth-30)/2), height: 240)
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SearchBarSubCellId", forIndexPath: indexPath) as! SearchBarSubCell
        let model = dataArray[indexPath.row]
        cell.titleLabel.text = model.short_description
        cell.detailLabel.text = model.name
        cell.priceLabel.text = "¥\(model.price)"
        cell.topImageView.kf_setImageWithURL(NSURL(string: model.cover_image_url))
        
        return cell
    }
    
}

extension SearchBarSubController {
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let idNumber = dataArray[indexPath.row].id
        let nextUrl = "http://hawaii.liwushuo.com/items/\(idNumber!)?"
     
        let vc = SearchBarSubWebController()
        vc.webStr = nextUrl
        navigationController?.pushViewController(vc, animated: true)
    
    }
}

