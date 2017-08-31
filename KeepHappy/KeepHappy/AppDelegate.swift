//
//  AppDelegate.swift
//  KeepHappy
//
//  Created by BXF on 2017/8/30.
//  Copyright © 2017年 BXF. All rights reserved.
//

import UIKit
import SVProgressHUD
import AFNetworking
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        setupUM()
        
        //应用程序额外设置
        setupAdditions()
        
        window = UIWindow()
        window?.backgroundColor = UIColor.white
        
        window?.rootViewController = BXFMainViewController()
        window?.makeKeyAndVisible()
        
        loadAppInfo()
        
        return true
    }
    
    //设置系统回调
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        
        let result = UMSocialManager.default().handleOpen(url, sourceApplication: sourceApplication, annotation: annotation)
        if !result {
            //其他SDK回调
            
        }
        return result
    }

}

// MARK:- 设置应用程序额外信息
extension AppDelegate{
    
    fileprivate func setupAdditions(){
       
        //1.设置SVProguressHUD最小解除时间
        SVProgressHUD.setMinimumDismissTimeInterval(1)
        
        //2.设置网络加载指示器
        AFNetworkActivityIndicatorManager.shared().isEnabled = true
        
        //3设置用户授权显示通知
        if  #available(iOS 10.0, *){
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .carPlay, .sound], completionHandler: { (success, error) in
                print("授权 " + (success ? "成功" : "失败"))
            })
        }else{
            let  notifySettings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            UIApplication.shared.registerUserNotificationSettings(notifySettings)
        }
    }
    
    
}

// MARK:-从服务器加载应用程序信息
extension AppDelegate{
    
    fileprivate func loadAppInfo(){
        
        DispatchQueue.global().async {
            
            let url = Bundle.main.url(forResource: "main.json", withExtension: nil)
            let data = NSData(contentsOf: url!)
            let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            let jsonPath = (docDir as NSString).appendingPathComponent("main.json")
            
            //直接保存咋沙盒，等待下一次程序启动使用
            data?.write(toFile: jsonPath, atomically: true)
            
        }
    }
}

















