//
//  UIImage+Extensions.swift
//  传智微博
//
//  Created by 刘凡 on 2016/7/5.
//  Copyright © 2016年 itcast. All rights reserved.
//

import UIKit

extension UIImage {
    
    /// 创建头像图像
    ///
    /// - parameter size:      尺寸
    /// - parameter backColor: 背景颜色
    ///
    /// - returns: 裁切后的图像
    func cz_avatarImage(size: CGSize?, backColor: UIColor = UIColor.white, lineColor: UIColor = UIColor.lightGray) -> UIImage? {
        
        var size = size
        if size == nil {
            size = self.size
        }
        let rect = CGRect(origin: CGPoint(), size: size!)
        
        UIGraphicsBeginImageContextWithOptions(rect.size, true, 0)
        
        backColor.setFill()
        UIRectFill(rect)
        //实例化一个圆形路径
        let path = UIBezierPath(ovalIn: rect)
        //进行路径裁切 - 后续的绘图，都会出现在圆形路径内部，外部的全部干掉
        path.addClip()
        
        draw(in: rect)
        
        //绘制内切的圆形
        let ovalPath = UIBezierPath(ovalIn: rect)
        ovalPath.lineWidth = 2
        lineColor.setStroke()
        ovalPath.stroke()
        
        let result = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return result
    }
    
    /// 生成指定大小的不透明图象
    ///
    /// - parameter size:      尺寸
    /// - parameter backColor: 背景颜色
    ///
    /// - returns: 图像
    
    func cz_image(size: CGSize? = nil, backColor: UIColor = UIColor.white) -> UIImage? {
        
        var size = size
        if size == nil {
            size = self.size
        }
        let rect = CGRect(origin: CGPoint(), size: size!)
        //1图像上下文：内存中开辟一个地址，跟屏幕无关
        /**
         参数
         1）size：绘图尺寸
         2）不透明 ： false(透明)/true（不透明）
         3）scale：屏幕分辨率，默认生成的图像默认使用1.0分辨率，图像质量不好，可以制定0，会选择当前设备的屏幕分辨率
         */
        UIGraphicsBeginImageContextWithOptions(rect.size, true, 0)
        //0背景填充
        backColor.setFill()
        UIRectFill(rect)
        
        //2绘图drawInRect就在指定区域拉伸屏幕
        draw(in: rect)
        
        //3取得结果
        let result = UIGraphicsGetImageFromCurrentImageContext()
        
        //4关闭上下文
        UIGraphicsEndImageContext()
        
        //5返回结果
        return result
    }
}
