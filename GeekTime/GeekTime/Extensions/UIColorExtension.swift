//
//  UIColorExtension.swift
//  GeekTime
//
//  Created by Yang Li on 2020/8/9.
//  Copyright © 2020 Yang Li. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static func hexColor(_ hexValue: Int, _ alphaValue: Float) -> UIColor {
        return UIColor(
            red: CGFloat((hexValue & 0xFF0000) >> 16) / 255,
            green: CGFloat((hexValue & 0x00FF00) >> 8) / 255,
            blue: CGFloat(hexValue & 0x0000FF) / 255,
            alpha: CGFloat(alphaValue)
        )
    }
    static func hexColor(_ hexValue: Int) -> UIColor {
        return hexColor(hexValue, 1.0)
    }
    
    convenience init(_ hexValue: Int, _ alphaValue: Float) {
        self.init(
            red: CGFloat((hexValue & 0xFF0000) >> 16) / 255,
            green: CGFloat((hexValue & 0x00FF00) >> 8) / 255,
            blue: CGFloat(hexValue & 0x0000FF) / 255,
            alpha: CGFloat(alphaValue)
        )
    }
    
    convenience init(_ hexValue: Int) {
        self.init(hexValue, 1.0)
    }
    
    func toImage() -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(self.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
