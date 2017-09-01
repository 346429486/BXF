//
//  BXFHappyViewController.swift
//  KeepHappy
//
//  Created by BXF on 2017/9/1.
//  Copyright © 2017年 BXF. All rights reserved.
//

import UIKit

class BXFHappyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

}

// MARK:-设置UI界面内容
extension BXFHappyViewController{
    
    fileprivate func setupUI(){
        setupNavigationBar()
        setupContentView()
    }
     // FIXME:-导航栏设置
    private func setupNavigationBar(){
        
    }
    fileprivate func setupContentView(){
        
        //1获取数据
        let happyTypes = loadTypeData()
        
        //创建主题内容
         // FIXME:-设置滚动条标题
        let style = HYTitleStyle()
        style.isScrollEnable = false
        let pageFrame = CGRect(x: 0, y: kNavigationBarH + kStatusBarH, width: kScreenW, height: kScreenH - kNavigationBarH - kStatusBarH - 44)
        let titles = happyTypes.map({$0.title})
        var childVcs = [BXFAnchorViewController]()
        for type in happyTypes {
            let anchorVc = BXFAnchorViewController()
            anchorVc.HappyType = type
            childVcs.append(anchorVc)
        }
        let pageView = HYPageView(frame: pageFrame, titles: titles, style: style, childVcs: childVcs, parentVc: self)
        view.addSubview(pageView)
        
        
    }
    fileprivate func loadTypeData() ->[BXFHappyType] {
        let path = Bundle.main.path(forResource: "types.plist", ofType: nil)
        let dataArray = NSArray(contentsOfFile: path!) as! [[String : Any]]
        var tempArray = [BXFHappyType]()
        for dict in dataArray {
            let happyType = BXFHappyType()
            happyType.yy_modelSet(with: dict )
            tempArray.append(happyType)
        }
        return tempArray
        
    }
}
