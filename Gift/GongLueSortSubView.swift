//
//  GongLueSortSubView.swift
//  Gift
//
//  Created by qianfeng on 16/10/31.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

//品类
class GongLueSortSubView: UIViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    var collectionView:UICollectionView!
    var dataArray:[GongLueAllSubModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        congifUI()
        loadData()
        navigationItem.title = "品类"
    }
    func congifUI() {
        automaticallyAdjustsScrollViewInsets = false
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 10
        flowLayout.scrollDirection = .Vertical
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 64, width: screenWidth, height: screenHeight-64), collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.whiteColor()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerNib(UINib(nibName: "GongLueSortSubCell", bundle: nil), forCellWithReuseIdentifier: "gongLueSortSubCellId")
        view.addSubview(collectionView)
    }
    
  
    func loadData() {
        Alamofire.request(.GET, classifyAllUrl).responseJSON { [unowned self] (response) in
            if response.result.error == nil {
                let array = (response.result.value)!["data"]!!["channel_groups"] as! [AnyObject]
                let dics = array[0]["channels"] as! [[String:AnyObject]]
                for dic in dics {
                    let model = GongLueAllSubModel()
                        model.setValuesForKeysWithDictionary(dic)
                    self.dataArray.append(model)
                }
                self.collectionView!.reloadData()
            }
        }
            
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

extension GongLueSortSubView {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(170, 70)
        
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 10, 10, 10)
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("gongLueSortSubCellId", forIndexPath: indexPath) as! GongLueSortSubCell
        let model = dataArray[indexPath.row]
        cell.gongLueSortSubImageView.kf_setImageWithURL(NSURL(string: model.cover_image_url))
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let id = dataArray[indexPath.row].id
        let str = "http://api.liwushuo.com/v2/channels/\(id!)/items_v2?limit=20&offset=%ld"
        let vc = GongLueSubView()
        vc.url = str
        navigationController?.pushViewController(vc, animated: true)
    }

}






