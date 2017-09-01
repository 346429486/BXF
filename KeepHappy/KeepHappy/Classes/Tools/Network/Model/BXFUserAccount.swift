//
//  BXFUserAccount.swift
//  KeepHappy
//
//  Created by BXF on 2017/8/31.
//  Copyright © 2017年 BXF. All rights reserved.
//

import UIKit
import YYModel

private let accountFile: NSString = "useraccount.json"
class BXFUserAccount: NSObject {
    
    //访问令牌
    var access_token: String?
    //用户唯一标识
    var uid: String?
    //用户昵称
    var name: String?
    //用户性别
    var gender: String?
    //用户头像
    var iconurl : String?
    
    override var description: String{
        return yy_modelDescription()
    }
    
    override init() {
        super.init()
        
        //从磁盘加载保存的文件 ->字典
        guard let path = accountFile.cz_appendDocumentDir(),
        let data = NSData(contentsOfFile: path),
        let dict = try? JSONSerialization.jsonObject(with: data as Data, options: []) as? [String: AnyObject]
        else {
            return
        }
        yy_modelSet(withJSON: dict ?? [:])
        
         // FIXME:-判断token是否过期
        
    }
    
    func saveAccount(){
        
        //模型转字典
        let dict = (self.yy_modelToJSONObject() as? [String: AnyObject]) ?? [:]
        
        guard let data = try? JSONSerialization.data(withJSONObject: dict, options: []),
            let filePath = accountFile.cz_appendDocumentDir()
            else {
            return
        }
        (data as NSData).write(toFile: filePath, atomically: true)
        
    }
}














