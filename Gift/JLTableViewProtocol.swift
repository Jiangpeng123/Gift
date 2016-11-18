//
//  JLTableViewProtocol.swift
//  Gift
//
//  Created by qianfeng on 16/10/21.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit
import MJRefresh

protocol JLAddRefreshProtocol1:NSObjectProtocol {
    func addRefresh(header:(()->())?,reload:Selector?,footer:(()->())?,loadMore:Selector?)
}

protocol JLTableViewProtocol1:UITableViewDelegate,UITableViewDataSource,JLTableViewProtocol {
    var tableView:UITableView!{get set}
    func addTableView()
}

extension JLTableViewProtocol1 where Self:UIViewController{
    func addTableView(){
        tableView=UITableView(frame: CGRectMake(0, 0, view.frame.size.width, view.frame.size.height), style: .Grouped)
        tableView.delegate=self
        tableView.dataSource=self
        view.addSubview(tableView)
    }
    
    func addRefresh(header:(()->())?=nil,footer:(()->())?=nil) {
        if header != nil {
            tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: header)
        }
        if footer != nil {
            tableView.mj_footer=MJRefreshAutoNormalFooter(refreshingBlock: footer)
            
        }
        
    }
    
}


