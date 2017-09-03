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
    
    //列表视图模型
    fileprivate lazy var listViewModel = BXFHappyListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.randomColor()

    }
    
    //注销通知
    deinit {
        
    }
    override func loadData() {
        tableView?.mj_header.beginRefreshing()
        // FIXME:加载VM数据
        //加载数据
        listViewModel.loadHomeData { (isSuccess, shouldRefresh) in
            
            self.tableView?.mj_header.endRefreshing()
            self.tableView?.mj_footer.endRefreshing()
            
            self.isPullup = false
            
            if shouldRefresh {
                self.tableView?.reloadData()
            }
        }
        
    }
    
}

// MARK:-表格数据源方法
extension BXFAnchorViewController{
    
}
// MARK:-设置界面
extension BXFAnchorViewController {
    
    override func setupTableView() {
        super.setupTableView()
        // FIXME:添加导航栏和tableViewModel设置
        
    }
}
