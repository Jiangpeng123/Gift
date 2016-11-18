//
//  SKUSubController.swift
//  Gift
//
//  Created by qianfeng on 16/11/3.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class SKUSubController: UIViewController,JLCollectionViewProtocol {
    var webUrl:String!
    var dataArray:[SKUSubModel] = []
    var collectionView:UICollectionView!
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
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 10
        flowLayout.scrollDirection = .Vertical
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 64, width: screenWidth, height: screenHeight-64-49), collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = UIColor.whiteColor()
        collectionView.registerNib(UINib(nibName: "SKUSubCell", bundle: nil), forCellWithReuseIdentifier: "SKUSubCellId")
        view.addSubview(collectionView)
        
    }
    
    func loadData() {
        Alamofire.request(.GET, String(format:webUrl,currentCount)).responseJSON { [unowned self] (response) in
            self.collectionView.mj_header.endRefreshing()
            self.collectionView.mj_footer.endRefreshing()
            if self.currentCount == 0 {
                self.dataArray.removeAll()
            }
            if response.result.error==nil{
                let dics = (response.result.value) as! [String:AnyObject]
                let array = dics["data"]!["items"] as! [[String:AnyObject]]
                for dic in array {
                    let model = SKUSubModel()
                    model.setValuesForKeysWithDictionary(dic)
                    self.dataArray.append(model)
                }
                //print(self.dataArray.count)
                self.collectionView.reloadData()
            }
        }

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}

extension SKUSubController {
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
        
        return CGSize(width: CGFloat((screenWidth-30)/2), height: 260)
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SKUSubCellId", forIndexPath: indexPath) as! SKUSubCell
        let model = dataArray[indexPath.row]
        cell.imageView1.kf_setImageWithURL(NSURL(string: model.cover_image_url!))
        cell.titleLabel.text = model.name
        cell.priceLabel.text = "¥\(model.price!)"
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let url = dataArray[indexPath.row].url
        let vc = GongLueThirdView()
        vc.webStr = url
        
        navigationController?.pushViewController(vc, animated: true)
    }

}



