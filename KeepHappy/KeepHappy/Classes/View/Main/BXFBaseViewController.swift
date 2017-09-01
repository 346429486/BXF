//
//  BXFBaseViewController.swift
//  KeepHappy
//
//  Created by BXF on 2017/9/1.
//  Copyright © 2017年 BXF. All rights reserved.
//

import UIKit

class BXFBaseViewController: UIViewController {
    
    //表格视图
    var tableView:UITableView?
    //刷新控件
    var refreshControl: UIRefreshControl?
    //上拉刷新标记
    var isPullup = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    //加载数据
    func loadData() {
        //如果子类不实现任何方法，默认关闭刷新控件
        refreshControl?.endRefreshing()
    }

}

// MARK:-设置界面
extension BXFBaseViewController{
    
    fileprivate func setupUI(){
        view.backgroundColor = UIColor.white
        
        automaticallyAdjustsScrollViewInsets = false
        
        
        
    }
    
    //设置表格视图
    func setupTableView(){
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.addSubview(tableView!)
        tableView?.delegate = self
        tableView?.dataSource = self
        
        //设置内容缩进
        tableView?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: tabBarController?.tabBar.bounds.height ?? 49, right: 0)
        
        //修改指示器的缩进
        tableView?.scrollIndicatorInsets = tableView!.contentInset
        
        //设置刷新控件
        refreshControl = UIRefreshControl()
        tableView?.addSubview(refreshControl!)
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
    }
}

// MARK:-UITableViewDataSource, UITableViewDelegate
extension BXFBaseViewController: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
}

















