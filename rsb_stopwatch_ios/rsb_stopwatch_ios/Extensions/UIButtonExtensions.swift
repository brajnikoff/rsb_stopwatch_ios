//
//  UIButtonExtensions.swift
//  rsb_stopwatch_ios
//
//  Created by Roman Brazhnikov on 03.01.2021.
//

import UIKit

extension UIButton {
    // MARK: Common
    func applyTimerButtonTextStyle(title: String) {
        let attrs: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.whiteColor,
            NSAttributedString.Key.font: UIFont.buttonFont
        ]
        let attrText = NSAttributedString(string: title, attributes: attrs)
        setAttributedTitle(attrText, for: .normal)
    }
    
    // MARK: By design
    func applyStyleRed(with title: String) {
        backgroundColor = .stopColor
        tintColor = .whiteColor
        
        applyTimerButtonTextStyle(title: title)
    }
    
    func applyStyleGreen(with title: String) {
        backgroundColor = .startColor
        tintColor = .whiteColor
        
        applyTimerButtonTextStyle(title: title)
    }
    
    func applyStyleGray(with title: String) {
        backgroundColor = .resetColor
        tintColor = .whiteColor
        
        applyTimerButtonTextStyle(title: title)
    }
    
    func applyStyleDarkGray(with title: String) {
        backgroundColor = .inactiveResetColor
        tintColor = .whiteColor
        
        applyTimerButtonTextStyle(title: title)
    }
    
    // MARK: - By intention
    func applyStyleStart() {
        applyStyleGreen(with: "Start")
    }
 
    func applyStyleStop() {
        applyStyleRed(with: "Stop")
    }
    
    func applyStyleReset() {
        applyStyleGray(with: "Reset")
    }
    
    func applyStyleResetInactive() {
        applyStyleDarkGray(with: "Reset")
    }
}
