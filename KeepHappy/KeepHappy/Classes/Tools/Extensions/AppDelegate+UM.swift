//
//  AppDelegate+UM.swift
//  KeepHappy
//
//  Created by BXF on 2017/8/31.
//  Copyright © 2017年 BXF. All rights reserved.
//

import UIKit


extension AppDelegate{
    
    //配置友盟登录
    func setupUMAuth(){
        //打开日志
        UMSocialManager.default().openLog(true)
        
        //设置友盟appkey
        UMSocialManager.default().umSocialAppkey = BXFUMAppKey
        
        //设置微信的appKey和appSecret
        UMSocialManager.default().setPlaform(UMSocialPlatformType.wechatSession, appKey: BXFWXAppKey, appSecret: BXFWXSecret, redirectURL: nil)
    }
    
    //配置友盟统计
    func setupUMMobClick(){
        
        if let umConfig =  UMAnalyticsConfig.sharedInstance() {
            umConfig.appKey = BXFUMAppKey
            MobClick.start(withConfigure: umConfig)
        }
        
    }
    
}
