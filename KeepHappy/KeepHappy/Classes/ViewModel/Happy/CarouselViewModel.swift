//
//  CarouselViewModel.swift
//  XMGTV
//
//  Created by apple on 16/11/28.
//  Copyright © 2016年 coderwhy. All rights reserved.
//

import UIKit

class CarouselViewModel {
    
    lazy var carousels : [CarouselModel] = [CarouselModel]()
    
    func loadCarouselData(_ complection : @escaping () -> ()) {
        
        complection()
    }
}
