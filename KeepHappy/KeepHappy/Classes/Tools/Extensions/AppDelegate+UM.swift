//
//  AppDelegate+UM.swift
//  KeepHappy
//
//  Created by BXF on 2017/8/31.
//  Copyright © 2017年 BXF. All rights reserved.
//

import UIKit


extension AppDelegate{
    
    func setupUM(){
        //打开日志
        UMSocialManager.default().openLog(true)
        
        //设置友盟appkey
        UMSocialManager.default().umSocialAppkey = BXFUMAppKey
        
        //设置微信的appKey和appSecret
        UMSocialManager.default().setPlaform(UMSocialPlatformType.wechatSession, appKey: BXFWXAppKey, appSecret: BXFWXSecret, redirectURL: nil)
    }
}
