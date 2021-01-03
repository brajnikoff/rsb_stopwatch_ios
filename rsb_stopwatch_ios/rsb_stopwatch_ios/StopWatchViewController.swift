//
//  StopWatchViewController.swift
//  rsb_stopwatch_ios
//
//  Created by Roman Brazhnikov on 02.01.2021.
//

import UIKit

class StopWatchViewController: UIViewController {
    
    // MARK: - Constants
    private static let utcTimeZone = TimeZone(abbreviation: "UTC")
    private let secondsInHour: Double = 60 * 60
    private let shortFormatter: DateFormatter = {
        let df = DateFormatter()
        df.timeZone = utcTimeZone
        df.dateFormat = "mm:ss.SS"
        return df
    }()
    
    private let longFormatter: DateFormatter = {
        let df = DateFormatter()
        df.timeZone = utcTimeZone
        df.dateFormat = "HH:mm:ss.SS"
        return df
    }()
    
    private let testFormatter: DateFormatter = {
        let df = DateFormatter()
        df.timeZone = utcTimeZone
        df.dateStyle = .long
        df.timeStyle = .long
        return df
    }()
    
    // MARK: - Private properties
    private var startTime: Double = .zero
    private var currentValue: Double = .zero {
        didSet {
            var df: DateFormatter
            if currentValue < secondsInHour {
                df = shortFormatter
            } else {
                df = longFormatter
            }
            displayLabel.text = df.string(from: Date(timeIntervalSince1970: currentValue))
        }
    }
    
    private var timer: Timer?
    
    // MARK: - Outlets
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = .zero
        rightButton.backgroundColor = .green
        rightButton.tintColor = .white
        
        print(UIFont.fontNames(forFamilyName: "Arial"))
        
        displayLabel.font = UIFont(name: "Courier", size: 70)
        
        let rightAttrs: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "Arial-BoldMT", size: 32)!
        ]
        let rightAttrText = NSAttributedString(string: "Start", attributes: rightAttrs)

        rightButton.setAttributedTitle(rightAttrText, for: .normal)
    }
    
    // MARK: - Actions
    @IBAction func leftButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func rightButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    // MARK: - Logic Private
    @objc private func timerAction() {
        let currentTime = Date().timeIntervalSince1970
        
        if startTime == .zero {
            startTime = currentTime - 3595
        }
        
        currentValue = currentTime - startTime
    }
}
