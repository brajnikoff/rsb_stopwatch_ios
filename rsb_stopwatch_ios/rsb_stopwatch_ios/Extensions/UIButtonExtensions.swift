//
//  UIButtonExtensions.swift
//  rsb_stopwatch_ios
//
//  Created by Roman Brazhnikov on 03.01.2021.
//

import UIKit

extension UIButton {
    func applyStyleRed(with title: String) {
        backgroundColor = .stopColor
        tintColor = .whiteColor
        
        let attrs: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.whiteColor,
            NSAttributedString.Key.font: UIFont.buttonFont
        ]
        let attrText = NSAttributedString(string: title, attributes: attrs)
        setAttributedTitle(attrText, for: .normal)
    }
    
    func applyStyleGreen(with title: String) {
        backgroundColor = .startColor
        tintColor = .whiteColor
        
        let attrs: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.whiteColor,
            NSAttributedString.Key.font: UIFont.buttonFont
        ]
        let attrText = NSAttributedString(string: title, attributes: attrs)
        setAttributedTitle(attrText, for: .normal)
    }
    
    func applyStyleStart() {
        applyStyleGreen(with: "Start")
    }
 
    func applyStyleStop() {
        applyStyleRed(with: "Stop")
    }
}
