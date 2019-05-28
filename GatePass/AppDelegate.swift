//
//  AppDelegate.swift
//  GatePass
//
//  Created by A.S.D.Vinay on 12/04/17.
//  Copyright © 2017 A.S.D.Vinay. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    




    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let vc = ViewController()
//        vc.username = "15B00300"
        window?.rootViewController = vc
        
        let defaults = UserDefaults.standard
        let isPreloaded = defaults.bool(forKey: "isPreloaded")
        if !isPreloaded {
            preloadData()
            defaults.set(true, forKey: "isPreloaded")
        }
        
        DatabaseController.fetchUsers()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its  current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        DatabaseController.saveContext()
    }
    
    func preloadData(){
        
        
        let student1:Students = NSEntityDescription.insertNewObject(forEntityName: "Students", into: DatabaseController.persistentContainer.viewContext) as! Students
        student1.username = "15B00300"
        student1.password = "qwerty"
        student1.parentuser = "vinayparent"
        student1.id = 1
        DatabaseController.saveContext()
        
        let student2:Students = NSEntityDescription.insertNewObject(forEntityName: "Students", into: DatabaseController.persistentContainer.viewContext) as! Students
        student2.username = "15B00222"
        student2.password = "qwerty"
        student2.parentuser = "arunparent"
        student2.id = 2
        DatabaseController.saveContext()
        
        let parent1:Parents = NSEntityDescription.insertNewObject(forEntityName: "Parents", into: DatabaseController.persistentContainer.viewContext) as! Parents
        parent1.username = "vinayparent"
        parent1.password = "qwerty"
        parent1.studentuser = "15B00300"
        parent1.id = 1
        DatabaseController.saveContext()
        
        let parent2:Parents = NSEntityDescription.insertNewObject(forEntityName: "Parents", into: DatabaseController.persistentContainer.viewContext) as! Parents
        parent2.username = "arunparent"
        parent2.password = "qwerty"
        parent2.studentuser = "15B00222"
        parent2.id = 2
        DatabaseController.saveContext()
        
        let warden:Warden = NSEntityDescription.insertNewObject(forEntityName: "Warden", into: DatabaseController.persistentContainer.viewContext) as! Warden
        warden.username = "warden"
        warden.password = "qwerty"
        warden.id = 1
        DatabaseController.saveContext()
    }
    

    
}

