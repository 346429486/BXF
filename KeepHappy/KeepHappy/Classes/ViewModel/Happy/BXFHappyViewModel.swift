//
//  BXFHappyViewModel.swift
//  KeepHappy
//
//  Created by 杨飞 on 2017/9/3.
//  Copyright © 2017年 BXF. All rights reserved.
//

import Foundation

class BXFHappyViewModel: CustomStringConvertible {
    
    var happyModel : BXFHappyModel
    // FIXME:处理模型数据
    init(model:BXFHappyModel) {
        self.happyModel = model
    }

    var description: String{
        return happyModel.description
    }
}
