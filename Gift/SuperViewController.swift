//
//  SuperViewController.swift
//  Gift
//
//  Created by qianfeng on 16/10/25.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit
import Alamofire
class SuperViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,JLCollectionViewProtocol {
    var dataArray:[HotModel] = []
    lazy var str:String = ""
    var url:String = ""
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
    }
    func configUI() {
        automaticallyAdjustsScrollViewInsets = false
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 10
        flowLayout.scrollDirection = .Vertical
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight-104-49), collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.whiteColor()
        collectionView.registerNib(UINib(nibName: "HotCell", bundle: nil), forCellWithReuseIdentifier: "collectionViewCell")
        collectionView.registerClass(HeaderReusableView.classForCoder(),
      forSupplementaryViewOfKind:UICollectionElementKindSectionHeader,withReuseIdentifier: "header")
        view.addSubview(collectionView)
        
    }
    func loadData() {
        Alamofire.request(.GET, String(format:url,currentCount)).responseJSON { [unowned self] (response) in
            //self.collectionView.mj_header.endRefreshing()
            //self.collectionView.mj_footer.endRefreshing()
            if self.currentCount == 0 {
                self.dataArray.removeAll()
            }
            if response.result.error==nil{
                let dics = (response.result.value) as! [String:AnyObject]
                let model1 = HeadHotModel()
                model1.cover_image = dics["data"]!["cover_image"] as? String
                self.str = model1.cover_image
                
                let arrays = dics["data"]!["items"] as! [[String:AnyObject]]
                for dic in arrays {
                    let model = HotModel()
                    model.setValuesForKeysWithDictionary(dic)
                    self.dataArray.append(model)
                }
//                self.array.append(model1)
                self.collectionView.reloadData()
                //print(self.str)
            }
            //print(self.str)
        }
    }
    
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SuperViewController {
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

        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collectionViewCell", forIndexPath: indexPath) as! HotCell
        let model = dataArray[indexPath.row]
        cell.titleLabel.text = model.short_description
        cell.detailLabel.text = model.name
        cell.priceLabel.text = "¥\(model.price!)"
        cell.hotImageView.kf_setImageWithURL(NSURL(string: model.cover_image_url))
      
        
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: screenWidth, height: 200)
    }
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let kind = UICollectionElementKindSectionHeader
        
        let header=collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "header", forIndexPath: indexPath) as! HeaderReusableView
        header.backgroundColor=UIColor.whiteColor()
        header.hotHeadImageView.kf_setImageWithURL(NSURL(string: str))
        return header
    }
}

extension SuperViewController {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let urlValue = dataArray[indexPath.row].url
        let vc = SubHotView()
        vc.SubUrl = urlValue
        
        navigationController?.pushViewController(vc, animated: true)
    }
}



