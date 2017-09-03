//
//  BXFHappyListDAL.swift
//  KeepHappy
//
//  Created by 杨飞 on 2017/9/3.
//  Copyright © 2017年 BXF. All rights reserved.
//

import Foundation

class BXFHappyListDAL {
    /// 从本地数据库或者网络加载数据
    ///
    /// 提示：参数之所以参照网路接口，就是为了保证对原有代码的最小化调整！
    ///
    /// - parameter since_id:   下拉刷新 id
    /// - parameter max_id:     上拉刷新 id
    /// - parameter completion: 完成回调(微博的字典数组，是否成功)
    class func loadStatus(since_id: Int64 = 0, max_id: Int64 = 0, completion: @escaping (_ list: [[String: AnyObject]]?, _ isSuccess: Bool)->()) {
        
        // 0. 获取用户代号
        guard let userId = BXFNetworkManager.shared.userAccount.uid else {
            return
        }
        
        // 1. 检查本地数据，如果有，直接返回
        let array = BXFSQLiteManager.shared.loadStatus(userId: userId, since_id: since_id, max_id: max_id)
        
        // 判断数组的数量，没有数据返回的是没有数据的空数组 []
        if array.count > 0 {
            completion(array, true)
            
            return
        }
        
        // 2. 加载网路数据
        BXFNetworkManager.shared.statusList(since_id: since_id, max_id: max_id) { (list, isSuccess) in
            
            // 判断网络请求是否成功
            if !isSuccess {
                completion(nil, false)
                
                return
            }
            
            // 判断数据
            guard let list = list else {
                completion(nil, isSuccess)
                
                return
            }
            
            // 3. 加载完成之后，将网路数据[字典数组]，同步写入数据库
            BXFSQLiteManager.shared.updateStatus(userId: userId, array: list)
            
            // 4. 返回网络数据
            completion(list, isSuccess)
        }
    }

}
