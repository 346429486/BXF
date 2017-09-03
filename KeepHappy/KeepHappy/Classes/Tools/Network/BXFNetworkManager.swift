//
//  BXFNetworkManager.swift
//  KeepHappy
//
//  Created by BXF on 2017/8/31.
//  Copyright © 2017年 BXF. All rights reserved.
//

import UIKit
import AFNetworking

enum BXFHTTPMethod {
    case GET
    case POST
}

//网络管理工具
class BXFNetworkManager: AFHTTPSessionManager {

    static let shared : BXFNetworkManager = {
        
        let instance = BXFNetworkManager()
        instance.responseSerializer.acceptableContentTypes?.insert("text/plain")
        
        return instance
    }()
    
    //用户账户的懒加载属性
    lazy var userAccount = BXFUserAccount()
    
    //用户登录标记
    var userLogon : Bool {
        return (userAccount.access_token != nil)
    }
    
    /// 封装 AFN 的 GET / POST 请求
    ///
    /// - parameter method:     GET / POST
    /// - parameter URLString:  URLString
    /// - parameter parameters: 参数字典
    /// - parameter completion: 完成回调[json(字典／数组), 是否成功]
    func request(method : BXFHTTPMethod = .GET, URLString : String, parameters: [String : AnyObject]?, completion: @escaping(_ json : AnyObject?, _ isSuccess : Bool) ->()){
        
        //成功回调
        let success = {(task :URLSessionDataTask, json: Any?) ->()in
            completion(json as AnyObject?, true)
        }
        
        //失败回调
        let failure = {(task :URLSessionDataTask?, error: Error)->() in
            completion(nil,false)
        }
        
        if method == .GET {
            get(URLString, parameters: parameters, progress: nil, success: success, failure: failure)
            
        }else{
            post(URLString, parameters: parameters, progress: nil, success: success, failure: failure)
        }
        
    }
}
