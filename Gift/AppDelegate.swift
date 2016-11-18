//
//  AppDelegate.swift
//  Gift
//
//  Created by qianfeng on 16/10/19.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        creatRoot()
        return true
    }
    
    func creatRoot() {
        let tabBarController=UITabBarController()
        tabBarController.tabBar.tintColor = UIColor.init(red: 248.0/255, green: 37.0/255, blue: 63.0/255, alpha: 1.0)
        tabBarController.tabBar.backgroundColor = UIColor.colorWith(R: 255, G: 255, B: 255)
        let nameVC = ["Gift.PresentViewController","Gift.HotViewController","Gift.ClassifyViewController","Gift.SettingViewController"]
        let images = ["tab_icon_home_default@2x","tab_btn_list_default@2x","tab_btn_sort_default@2x","tab_btn_mine_default@2x"]
        
        let selectImages = ["tab_icon_home_select@2x","tab_btn_list_select@2x","tab_btn_sort_select@2x","tab_btn_mine_select@2x"]
        let titles = ["首页","榜单","分类","我的",]
        var viewControllers:[UIViewController]=[]
        for i in 0..<nameVC.count{
            let vcClass=NSClassFromString(nameVC[i]) as! UIViewController.Type
            let vc=vcClass.init()
            vc.title=titles[i]
            let nav=UINavigationController(rootViewController: vc)
            nav.navigationBar.setBackgroundImage(UIImage(named: "top-bg"), forBarMetrics: .Default)
            nav.tabBarItem.image=UIImage(named: images[i])
            nav.tabBarItem.selectedImage=UIImage(named: selectImages[i])
            viewControllers.append(nav)
        }
        tabBarController.viewControllers=viewControllers
        window?.rootViewController=tabBarController
    }
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

