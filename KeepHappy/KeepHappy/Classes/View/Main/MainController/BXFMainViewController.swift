//
//  BXFMainViewController.swift
//  KeepHappy
//
//  Created by BXF on 2017/8/30.
//  Copyright © 2017年 BXF. All rights reserved.
//

import UIKit

class BXFMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupChildControllers()
        
        //设置代理
        delegate = self
        
        //使用代码控制设备方向
        var supportedInterfaceOrientations : UIInterfaceOrientationMask{
            return .portrait
        }
        
    }

}

// MARK:-新特性视图处理
extension BXFMainViewController{
    
    fileprivate func setupNewfeatureView() {
        
        //判断是否登录
        if !BXFNetworkManager.share.userLogon {
            return
        }
         // FIXME:-添加新特性
        //1如果更新，显示新特性，否则显示欢迎
        
        
    }
    
    fileprivate var isNewVersion: Bool{
        
        // 1. 取当前的版本号 1.0.2
        // print(Bundle.main().infoDictionary)
       let currentVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        
        // 2. 取保存在 `Document(iTunes备份)[最理想保存在用户偏好]` 目录中的之前的版本号 "1.0.2"
        let path: String = ("version" as NSString).cz_appendDocumentDir()
        let sandboxVersion = (try? String(contentsOfFile: path)) ?? ""
        
        
        // 3. 将当前版本号保存在沙盒 1.0.2
        _ = try? currentVersion.write(toFile: path, atomically: true, encoding: .utf8)
        
        // 4. 返回两个版本号`是否一致` not new
        return currentVersion != sandboxVersion
        
    }
}

// MARK:-UITabBarControllerDelegate
extension BXFMainViewController : UITabBarControllerDelegate{
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        //1获取控制器在数组中的索引
        let idx = (childViewControllers as NSArray).index(of: viewController)
        
        //判断当前索引是首页，同时idx也是首页，重复点击首页的按钮
        if selectedIndex == 0 && idx == selectedIndex {
            // FIXME:-点击首页刷新借口
        }
        
        return true
    }
    
}

// MARK:-设置界面
extension BXFMainViewController {
    
    //设置所有子控制器
    fileprivate func setupChildControllers(){
        
        //获取沙盒路径
        let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let jsonPath = (docDir as NSString).appendingPathComponent("main.json")
        
        // 加载 data
        var data = NSData(contentsOfFile: jsonPath)
        
        // 判断 data 是否有内容，如果没有，说明本地沙盒没有文件
        if data == nil {
            // 从 Bundle 加载 data
            let path = Bundle.main.path(forResource: "main.json", ofType: nil)
            
            data = NSData(contentsOfFile: path!)
        }
        guard let array = try? JSONSerialization.jsonObject(with: data! as Data, options: []) as? [[String : AnyObject]]
            else {
            return
        }
        var arrayM = [UIViewController]()
        for dict in array! {
            
          arrayM.append(controller(dict: dict))
            
        }
        viewControllers = arrayM
    }
    
    //使用一个字典创建一个子控制器
    fileprivate func controller(dict : [String : AnyObject]) -> UIViewController{
        
        // 1. 取得字典内容
        guard let clsName = dict["clsName"] as? String,
        let title = dict["title"] as? String,
        let imageName = dict["imageName"] as? String,
        let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? UIViewController.Type
        else {
            return UIViewController()
        }
        
        // 2. 创建视图控制器
//        let vc = cls.init()
        let vc = BXFViewController()
        vc.title = title
//        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
//        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
//        
        //设置 tabbar 的标题字体（大小）
        vc.tabBarItem.setTitleTextAttributes(
            [NSForegroundColorAttributeName: UIColor.orange],
            for: .highlighted)
        // 系统默认是 12 号字，修改字体大小，要设置 Normal 的字体大小
        vc.tabBarItem.setTitleTextAttributes(
            [NSFontAttributeName: UIFont.systemFont(ofSize: 12)],
            for: UIControlState(rawValue: 0))
        
        // 实例化导航控制器的时候，会调用 push 方法将 rootVC 压栈
        let nav = BXFNavigationController(rootViewController: vc)
        // 1. 取得字典内容
        return nav

    }
}









