//
//  UIColor+Douyin.swift
//  DouyinDemo
//
//  Created by wang ya on 2021/9/8.
//

import UIKit

extension  UIColor  {
    //返回随机颜色
    class  var  randomColor:  UIColor  {
        get  {
            let  red =  CGFloat (arc4random()%256)/255.0
            let  green =  CGFloat (arc4random()%256)/255.0
            let  blue =  CGFloat (arc4random()%256)/255.0
            return  UIColor (red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
}
