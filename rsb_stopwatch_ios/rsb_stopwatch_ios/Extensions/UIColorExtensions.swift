//
//  UIColorExtensions.swift
//  rsb_stopwatch_ios
//
//  Created by Roman Brazhnikov on 03.01.2021.
//

import UIKit

extension UIColor {
    convenience init(rgb: UInt) {
       self.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
                 green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
                 blue: CGFloat(rgb & 0x0000FF) / 255.0, alpha: CGFloat(1.0))
    }

    
    // MARK: - By color name
    static let redColor = UIColor(rgb: 0xD93202)
    static let whiteColor = UIColor.white
    static let grayColor = UIColor.lightGray
    static let darkGrayColor = UIColor.darkGray
    
    static var deepDarkGreenColor = UIColor(rgb: 0x01260A)
    static var darkGreenColor = UIColor(rgb: 0x07591C)
    static var greenColor = UIColor(rgb: 0x0F8C22)
    static var lightGreenColor = UIColor(rgb: 0x11BF3D)
    static var blackColor = UIColor(rgb: 0x0D0D0D)
    
    // MARK: - By intention
    static var startColor: UIColor {
        greenColor
    }
    
    static var stopColor: UIColor {
        redColor
    }
    
    static var resetColor: UIColor {
        darkGreenColor
    }
    
    static var inactiveResetColor: UIColor {
        deepDarkGreenColor
    }
    
    static var backGroundColor: UIColor {
        blackColor
    }
    
    static var displayColor: UIColor {
        lightGreenColor
    }
}
