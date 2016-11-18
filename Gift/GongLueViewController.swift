//
//  GongLueViewController.swift
//  Gift
//
//  Created by qianfeng on 16/10/26.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

//总攻略
class GongLueViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var dataArray:[ClassifyModel] = []
    var collectionView:UICollectionView!
    //var scrollView:UIScrollView!
    var id:NSNumber = 0
    var jumpClosure:(NSNumber->Void)!
    //lazy var webNumber:NSNumber = 0
    var vc:GongLueHeadView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        loadData()
        
        view.backgroundColor = UIColor.whiteColor()
        vc = GongLueHeadView.init(frame: CGRect(x: 0, y: -250, width: screenWidth, height: 250))
        
        collectionView.addSubview(vc)
        vc.jumpClosure = { (a) in
          let vc1 = GongLueHeadSubView()
          self.navigationController?.pushViewController(vc1, animated: true)
           vc1.number = a
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
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
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = UIColor.whiteColor()
        collectionView.contentInset = UIEdgeInsets(top: 250, left: 0, bottom: 0, right: 0)
        collectionView.userInteractionEnabled = true
        self.collectionView?.registerNib(UINib(nibName: "GongLueCell", bundle: nil), forCellWithReuseIdentifier: "GongLueCellId")
        self.collectionView.registerClass(ClassifyHeadView.classForCoder(), forSupplementaryViewOfKind:UICollectionElementKindSectionHeader,withReuseIdentifier: "header")
        view.addSubview(collectionView)
       
 
    }
    //整个攻略的CollectionView的数据解析
    func loadData() {
        Alamofire.request(.GET, classifyAllUrl).responseJSON { [unowned self] (response) in
            if response.result.error == nil {
                let array = (response.result.value)!["data"]!!["channel_groups"] as! [AnyObject]
                for items in array {
                    let model = ClassifyModel()
                    model.name = items["name"] as! String
                
                    let array1 = items["channels"] as! [[String:AnyObject]]
                    for item in array1 {
                        let model1 = ClassifyImageModel()
                        model1.setValuesForKeysWithDictionary(item)
                        model.imageModels.append(model1)
                    }
                    self.dataArray.append(model)
                }
                self.collectionView!.reloadData()
                
            }
        }
        
    }
    
    
    // MARK: - Navigation
    
    
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return dataArray.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
            return CGSizeMake(170, 70)
        
        
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSizeMake(screenWidth, 40)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 10, 10, 10)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("GongLueCellId", forIndexPath: indexPath) as! GongLueCell
        let model = dataArray[indexPath.section].imageModels[indexPath.row]
        
        cell.GongLueImageView.kf_setImageWithURL(NSURL(string: model.cover_image_url))
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        let kind = UICollectionElementKindSectionHeader
        let model = dataArray[indexPath.section]
        let header=collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "header", forIndexPath: indexPath) as! ClassifyHeadView
        header.backgroundColor=UIColor.colorWith(R: 212, G: 212, B: 212, A: 0.8)
        header.leftLabel.text = model.name
        
        if (dataArray[indexPath.section].imageModels).count > 6 {
            header.rightLabel.text = "查看全部 >"
            if indexPath.section == 0 {
                let g1 = UITapGestureRecognizer(target: self, action: #selector(tapAction1))
                header.rightLabel.addGestureRecognizer(g1)
            }else if indexPath.section == 2 {
                let g2 = UITapGestureRecognizer(target: self, action: #selector(tapAction2))
                header.rightLabel.addGestureRecognizer(g2)
            }
            
        }
        
        
        return header
    }
}

extension GongLueViewController {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
         let vc = GongLueSubView()
         vc.hidesBottomBarWhenPushed = true
         let id = dataArray[indexPath.section].imageModels[indexPath.row].id ?? ""
         let str = "http://api.liwushuo.com/v2/channels/\(id!)/items_v2?limit=20&offset=%ld"
         vc.url = str
         navigationController?.pushViewController(vc, animated: true)
       

        
    }
    
    func tapAction1() {
        let vc = GongLueSortSubView()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
//        print("1")
//        let url1 = NSURL(string:"TestKitChen_1607://")
//        UIApplication.sharedApplication().openURL(url1!)
    }
    
    func tapAction2() {
        let vc = GongLueTargetSubView()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
















