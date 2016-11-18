//
//  GongLueHeadView.swift
//  Gift
//
//  Created by qianfeng on 16/10/28.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher
//攻略顶部scrollView的一个封装
class GongLueHeadView: UIView,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var collectionView:UICollectionView!
    var scrollerView:UIScrollView!
    var dataArray:[GongLueModel] = []
    let contentW:CGFloat = screenWidth
    let contentH:CGFloat = 250
    let currentCount = 0
    lazy var webNumber:NSNumber = 0
    var bool = false
    var jumpClosure:(NSNumber->Void)!
    
     override init(frame:CGRect) {
        super.init(frame:frame)
        backgroundColor = UIColor.whiteColor()
        configUI()
        loadData()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func configUI() {
        scrollerView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 250))
        scrollerView.backgroundColor = UIColor.whiteColor()
        scrollerView.contentSize = CGSizeMake(contentW, contentH)
        scrollerView.showsVerticalScrollIndicator = false
        scrollerView.showsHorizontalScrollIndicator = false
        scrollerView.bounces = false
        
        addSubview(scrollerView)
        let view1 = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 250))
        view1.backgroundColor = UIColor.whiteColor()
        scrollerView.addSubview(view1)
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 10
        flowLayout.scrollDirection = .Horizontal
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 250), collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.whiteColor()
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.userInteractionEnabled = true
        collectionView.registerNib(UINib(nibName: "GongLueHeadCell", bundle: nil), forCellWithReuseIdentifier: "gongLueHeadCellId")
        view1.addSubview(collectionView)
        
    }
    
    func loadData() {
        Alamofire.request(.GET, String(format: GongLueHeadUrl,currentCount)).responseJSON(completionHandler: {[unowned self] (response) in
            if response.result.error==nil{
                let dic = (response.result.value) as! [String:AnyObject]
                let array = dic["data"]!["columns"] as! [[String:AnyObject]]
                for item in array {
                    let model = GongLueModel()
                    model.setValuesForKeysWithDictionary(item)
                    self.dataArray.append(model)
                }
                self.collectionView.reloadData()
                //print(self.dataArray.count)
            }})
    }
    
}

extension GongLueHeadView {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(300, 70)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if dataArray.count > 12 {
            return 12
        }
        return dataArray.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 10, 10, 10)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("gongLueHeadCellId", forIndexPath: indexPath) as! GongLueHeadCell
        let model = dataArray[indexPath.row]

        cell.GongLueHeadImageView.kf_setImageWithURL(NSURL(string: model.banner_image_url))
        
        
        cell.GongLueTitleLabel.text = model.title
        cell.GongLueNameLabel.text = model.author
        
        return cell
    }
    
}


extension GongLueHeadView {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
   //        vc.url = "http://api.liwushuo.com/v2/columns/\(jumpId!)?limit=20&offset=%ld"
        if dataArray.count != 0 {
            jumpClosure(dataArray[indexPath.row].id)
        }
        
    }
    
}





