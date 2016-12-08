//
//  DataBase.swift
//  Gift
//
//  Created by qianfeng on 16/11/26.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

import UIKit
import CoreData

class DataBase {
    static let shareDataBase = DataBase()
    private init() {}
    var delegate:AppDelegate {
         return UIApplication.sharedApplication().delegate as! AppDelegate
    }
    
    func insertWithModel(model:DataModel) {
        let entity = NSEntityDescription.insertNewObjectForEntityForName("DataEntity", inManagedObjectContext: delegate.managedObjectContext) as! DataEntity
        entity.title = model.title
        delegate.saveContext()
    }
    
    //判断数据库中是否有此条数据(提取)
    func selectEntity(title:String) -> DataEntity? {
        let request = NSFetchRequest()
        request.entity = NSEntityDescription.entityForName("DataEntity", inManagedObjectContext: delegate.managedObjectContext)
        request.fetchLimit = 1
        request.predicate = NSPredicate(format: "title==%@",title)
        do {
            let objects = try delegate.managedObjectContext.executeFetchRequest(request)
            if objects.count > 0 {
                return (objects[0] as? DataEntity)!
            }
        }catch{
            let nserror = error as NSError
            NSLog("查询错误：\(nserror), \(nserror.userInfo)")
        }
        return nil
    }
    //查找指定个数的entity
    func selectNum(num:Int) -> [DataModel]? {
        let request = NSFetchRequest()
        request.entity = NSEntityDescription.entityForName("DataEntity", inManagedObjectContext: delegate.managedObjectContext)
        request.fetchLimit = num
        do{
            let objects = try delegate.managedObjectContext.executeFetchRequest(request) as! [DataEntity]
            var array:[DataModel] = []
    
            for data in objects {
                let model = DataModel()
                model.title = data.title
                array.append(model)
            }
            return array
        }catch {
            let nserror = error as NSError
            NSLog("查询错误：\(nserror), \(nserror.userInfo)")
        }
        return nil
    }
    //拿到entity,修改，然后让context与数据库同步
//    func updateData(Model model:DataModel) {
//        let entity = DataBase.shareDataBase.selectEntity(model.title)
//        if entity != nil {
//            entity?.title = model.title
//        }
//        delegate.saveContext()
//    }
    
    func deleteWith(Title title:String) {
        let entity = self.selectEntity(title)
        delegate.managedObjectContext.deleteObject(entity!)
        delegate.saveContext()
    }
    
}
















