//
//  JLCollectionViewProtocol.swift
//  Gift
//
//  Created by qianfeng on 16/10/25.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit
import MJRefresh


protocol JLCollectionViewProtocol:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,JLTableViewProtocol {
    var collectionView:UICollectionView!{get set}
    func addColllectionView()
}




extension JLCollectionViewProtocol where Self:UIViewController {
    func addColllectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 10
        flowLayout.scrollDirection = .Vertical
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 104, width: screenWidth, height: screenHeight-104-49), collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
    func addRefresh(header:(()->())?=nil,footer:(()->())?=nil) {
        if header != nil {
            collectionView.mj_header = MJRefreshNormalHeader(refreshingBlock: header)
        }
        if footer != nil {
            collectionView.mj_footer=MJRefreshAutoNormalFooter(refreshingBlock: footer)
        }
        
    }

}
