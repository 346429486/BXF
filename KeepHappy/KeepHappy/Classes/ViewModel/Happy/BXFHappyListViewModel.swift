//
//  BXFHappyListViewModel.swift
//  KeepHappy
//
//  Created by 杨飞 on 2017/9/3.
//  Copyright © 2017年 BXF. All rights reserved.
//

import UIKit

class BXFHappyListViewModel{
    lazy var happyViewModel = [BXFHappyViewModel]()
    
    func loadHomeData (comletion:@escaping(_ isSuccess: Bool, _ shounldRefresh: Bool)->()){
        
        // FIXME:进行网络数据加载，从数据库或者网络
        comletion(false, false)
    }
}
