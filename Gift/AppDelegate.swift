//
//  AppDelegate.swift
//  Gift
//
//  Created by qianfeng on 16/10/19.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit
import CoreData

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
        self.saveContext()
    }
    // MARK: - Core Data stack
    //拿到沙盒目录下Documents的文件路径，放到url中返回
    lazy var applicationDocumentsDirectory: NSURL = {
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
    }()
    
    //初始化NSManagedObjectModel，他是用来管理Entity的，代表模型文件
    lazy var managedObjectModel: NSManagedObjectModel = {
        let modelURL = NSBundle.mainBundle().URLForResource("CoreDataModel", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()
    
    //初始化persistentStoreCoordinator对象，用来添加持久化库（数据库SQLite）
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        //创建NSPersistentStoreCoordinator，把NSManagedObjectModel传递过去
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        //数据库所在路径，"SingleViewCoreData.sqlite"是数据库的名字
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("SingleViewCoreData.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            //在url对应的路径下，添加数据库
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
        } catch {
            // 如果创建失败在下面打印错误
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason
            
            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()
    
    //初始化NSManagedObjectContext对象，用来处理persistentStoreCoordinator和managedObjectModel之间的逻辑
    lazy var managedObjectContext: NSManagedObjectContext = {
        let coordinator = self.persistentStoreCoordinator
        //初始化对象
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        //关联上persistentStoreCoordinator
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
    //让managedObjectContext与数据库同步
    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                //让managedObjectContext与数据库同步
                try managedObjectContext.save()
            } catch {
                //同步失败的时候打印的错误
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }
    
    

}

