//
//  Theme.swift
//  Gift
//
//  Created by qianfeng on 16/10/21.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import Foundation

import UIKit

let screenWidth=UIScreen.mainScreen().bounds.width
let screenHeight=UIScreen.mainScreen().bounds.height
let rate=screenWidth/320.0
let navBarHeight:CGFloat=64
let tabBarHeight:CGFloat=49

//定义字体
let fontLeveOne:CGFloat=24
let fontLeveTwo:CGFloat=20
let fontLeveThree:CGFloat=18
let fontLeveFour:CGFloat=16
let fontLeveFive:CGFloat=14

//定义颜色 定义常出现的颜色
let colorTitle=UIColor.colorWith(R: 86, G: 177, B: 230)
let colorGray=UIColor.colorWith(R: 134, G: 134, B: 134)

//搜索
//顶部
let searchTopUrl = "http://api.liwushuo.com/v2/search/post?keyword=%E5%B8%BD%E5%AD%90&limit=2&offset=0&sort=kuzi"
//tableView部分
let searchTbViewUrl = "http://api.liwushuo.com/v2/search/post?keyword=%E5%B8%BD%E5%AD%90&limit=2&offset=0&sort="
//精选
let presentUrl = "http://api.liwushuo.com/v2/channels/101/items_v2?ad=2&gender=1&generation=2&limit=20&offset=%ld"
//海淘
let foreignBuy = "http://api.liwushuo.com/v2/channels/129/items_v2?gender=1&generation=2&limit=20&offset=%ld"
//滚动视图网址
let headUrl = "http://api.liwushuo.com/v2/banners?channel=iOS"
//送女票
let sendGfUrl = "http://api.liwushuo.com/v2/channels/10/items_v2?gender=1&generation=2&limit=20&offset=%ld"
//创意生活
let creatUrl = "http://api.liwushuo.com/v2/channels/125/items_v2?gender=1&generation=2&limit=20&offset=%ld"
//送基友
let sendFirendsUrl = "http://api.liwushuo.com/v2/channels/26/items_v2?gender=1&generation=2&limit=20&offset=%ld"
//送父母
let sendParentsUrl = "http://api.liwushuo.com/v2/channels/6/items_v2?gender=1&generation=2&limit=20&offset=%ld"
//送同事
let sendColleagueUrl = "http://api.liwushuo.com/v2/channels/17/items_v2?gender=1&generation=2&limit=20&offset=%ld"
//社交感
let designUrl = "http://api.liwushuo.com/v2/channels/127/items_v2?gender=1&generation=2&limit=20&offset=%ld"
//文艺风
let artUrl = "http://api.liwushuo.com/v2/channels/14/items_v2?gender=1&generation=2&limit=20&offset=%ld"
//奇葩搞怪
let curiousUrl = "http://api.liwushuo.com/v2/channels/126/items_v2?gender=1&generation=2&limit=20&offset=%ld"
//科技感
let sATUrl = "http://api.liwushuo.com/v2/channels/28/items_v2?gender=1&generation=2&limit=20&offset=%ld"
//数码
let figureUrl = "http://api.liwushuo.com/v2/channels/121/items_v2?gender=1&generation=2&limit=20&offset=%ld"
//萌萌哒
let cuteUrl = "http://api.liwushuo.com/v2/channels/11/items_v2?gender=1&generation=2&limit=20&offset=%ld"
//爱读书
let likeReadingUrl = "http://api.liwushuo.com/v2/channels/124/items_v2?gender=1&generation=2&limit=20&offset=%ld"


var urlArray = [presentUrl,sendGfUrl,foreignBuy,creatUrl,sendFirendsUrl,
    sendParentsUrl,sendColleagueUrl,designUrl,artUrl,curiousUrl,sATUrl,
    figureUrl,cuteUrl,likeReadingUrl]


let DailyUpdataUrl = "http://api.liwushuo.com/v2/ranks_v2/ranks/1?limit=20&offset=%ld"

let Top100Url = "http://api.liwushuo.com/v2/ranks_v2/ranks/2?limit=20&offset=%ld"


let OriginalityUrl = "http://api.liwushuo.com/v2/ranks_v2/ranks/3?limit=20&offset=%ld"


let NewStarUrl = "http://api.liwushuo.com/v2/ranks_v2/ranks/4?limit=20&offset=%ld"

let GongLueHeadUrl = "http://api.liwushuo.com/v2/columns?limit=20&offset=%ld"

let classifyAllUrl = "http://api.liwushuo.com/v2/channel_groups/all?"

//攻略页面所以cell的网址，左右来回切换
//品类
let GongLuUrl11 = "http://api.liwushuo.com/v2/channels/111/items_v2?limit=20&offset=ld"
let GongLueUrl12 = "http://api.liwushuo.com/v2/channels/112/items_v2?limit=20&offset=0"
let GongLueUrl13 = "http://api.liwushuo.com/v2/channels/110/items_v2?limit=20&offset=0"
let GongLueUrl14 = "http://api.liwushuo.com/v2/channels/2/items_v2?limit=20&offset=0"
let GongLueUrl15 = "http://api.liwushuo.com/v2/channels/116/items_v2?limit=20&offset=0"
let GongLueUrl16 = "http://api.liwushuo.com/v2/channels/117/items_v2?limit=20&offset=0"
//风格
let GongLueUrl21 = "http://api.liwushuo.com/v2/channels/125/items_v2?limit=20&offset=0"
let GongLueUrl22 = "http://api.liwushuo.com/v2/channels/11/items_v2?limit=20&offset=0"
let GongLueUrl23 = "http://api.liwushuo.com/v2/channels/14/items_v2?limit=20&offset=0"
let GongLueUrl24 = "http://api.liwushuo.com/v2/channels/28/items_v2?limit=20&offset=0"
let GongLueUrl25 = "http://api.liwushuo.com/v2/channels/126/items_v2?limit=20&offset=0"
let GongLueUrl26 = "http://api.liwushuo.com/v2/channels/127/items_v2?limit=20&offset=0"

//对象
let GongLueUrl31 = "http://api.liwushuo.com/v2/channels/10/items_v2?limit=20&offset=0"
let GongLueUrl32 = "http://api.liwushuo.com/v2/channels/9/items_v2?limit=20&offset=0"
let GongLueUrl33 = "http://api.liwushuo.com/v2/channels/24/items_v2?limit=20&offset=0"
let GongLueUrl34 = "http://api.liwushuo.com/v2/channels/6/items_v2?limit=20&offset=0"
let GongLueUrl35 = "http://api.liwushuo.com/v2/channels/26/items_v2?limit=20&offset=0"
let GongLueUrl36 = "http://api.liwushuo.com/v2/channels/5/items_v2?limit=20&offset=0"

