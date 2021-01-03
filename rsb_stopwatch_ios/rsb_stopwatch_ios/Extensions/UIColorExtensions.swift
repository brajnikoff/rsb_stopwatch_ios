//
//  UIColorExtensions.swift
//  rsb_stopwatch_ios
//
//  Created by Roman Brazhnikov on 03.01.2021.
//

import UIKit

extension UIColor {
    // MARK: - By color name
    static let redColor = UIColor.red
    static let greenColor = UIColor.green
    static let whiteColor = UIColor.white
    static let grayColor = UIColor.lightGray
    
    // MARK: - By intention
    static var startColor: UIColor {
        greenColor
    }
    
    static var stopColor: UIColor {
        redColor
    }
    
    static var resetColor: UIColor {
        grayColor
    }
}
