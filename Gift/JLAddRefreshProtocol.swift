//
//  JLAddRefreshProtocol.swift
//  Gift
//
//  Created by qianfeng on 16/10/21.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import Foundation

import UIKit
import MJRefresh

//上下拉刷新
protocol JLTableViewProtocol:NSObjectProtocol {
    func addRefresh(header:(()->())?,footer:(()->())?)
}
extension JLTableViewProtocol where Self: UITableViewController{

    func addRefresh(header:(()->())?=nil,footer:(()->())?=nil) {
        if header != nil {
            tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: header)
        }
        if footer != nil {
            tableView.mj_footer=MJRefreshAutoNormalFooter(refreshingBlock: footer)
            
        }
    }
}
