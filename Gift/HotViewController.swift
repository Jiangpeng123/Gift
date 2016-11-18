//
//  HotViewController.swift
//  Gift
//
//  Created by qianfeng on 16/10/20.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit

class HotViewController: UIViewController,PageTitleViewDelegate, PageContentViewDelegate {
    
    lazy var titleView: PageTitleView = {
        let titleView = PageTitleView(frame: CGRect(x: 0, y: 64, width: UIScreen.mainScreen().bounds.width, height: 40), titiles: ["每日推荐", "Top100", "独立原创", "新星榜"])
        return titleView
    }()
    
    lazy var contentPageView: PageContentView = {
        // 确定所有子视图控制器
        var childVcs: [UIViewController] = []
        let vc1 = DailyViewController()
        let vc2 = Top100ViewController()
        let vc3 = OriginalityViewController()
        let vc4 = NewStarViewController()
        childVcs = [vc1,vc2,vc3,vc4]
        let contentView = PageContentView(frame: CGRect(x: 0, y: 104, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height-100), childVcS: childVcs, parentVc: self)
        return contentView
    }()
    
    var imageView: UIImageView!
    var smallImageView: UIImageView!
    var currentBtn: UIButton!
    var childVcs: [UIViewController] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor = UIColor.whiteColor()
        configUI()
    }
    
    func configUI() {
        titleView.delegate = self
        self.view.addSubview(titleView)
        contentPageView.delegate = self
        self.view.addSubview(contentPageView)
    }
    
}



extension HotViewController {
    func pageContentView(contentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        titleView.setContentWith(progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
    func pageTitleView(titleView: PageTitleView, selectedIndex: Int) {
        contentPageView.setCurrentIndex(selectedIndex)
    }
}
