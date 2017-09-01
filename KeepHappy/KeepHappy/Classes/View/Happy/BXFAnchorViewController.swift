//
//  BXFAnchorViewController.swift
//  KeepHappy
//
//  Created by BXF on 2017/9/1.
//  Copyright © 2017年 BXF. All rights reserved.
//

import UIKit

//可重用cell id
fileprivate let happyCellId = "happyCellId"

class BXFAnchorViewController: BXFBaseViewController {
    
    // MARK:-对外属性
    var HappyType : BXFHappyType?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.randomColor()

    }
    
}

// MARK:-表格数据源方法
extension BXFAnchorViewController{
    
}
// MARK:-设置界面
extension BXFAnchorViewController {
    
    override func setupTableView() {
        super.setupTableView()
        
        
    }
}
