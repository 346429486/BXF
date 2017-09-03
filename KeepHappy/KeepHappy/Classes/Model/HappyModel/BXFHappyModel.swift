//
//  BXFHappyModel.swift
//  KeepHappy
//
//  Created by 杨飞 on 2017/9/3.
//  Copyright © 2017年 BXF. All rights reserved.
//

import UIKit

class BXFHappyModel: NSObject {
    
    override var description: String{
        return yy_modelDescription()
    }
    
    //告诉第三方框架遇到数组类型的属性，数组中存放的对象是什么类型
    class func modelContainerPropertyGenericClass() -> [String : Any] {
        return ["属性名": "数组里类型"]
    }
}
