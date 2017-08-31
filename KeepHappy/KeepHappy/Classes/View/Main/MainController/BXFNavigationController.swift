//
//  BXFNavigationController.swift
//  KeepHappy
//
//  Created by BXF on 2017/8/30.
//  Copyright © 2017年 BXF. All rights reserved.
//

import UIKit

class BXFNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if childViewControllers.count > 0 {
            
            viewController.hidesBottomBarWhenPushed = true
            
        }
        super.pushViewController(viewController, animated: true)
    }

}
