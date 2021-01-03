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
    private var isTimerOn = false
    
    // MARK: - Outlets
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = .zero
        
        print(UIFont.fontNames(forFamilyName: "Arial"))
        
        displayLabel.font = UIFont(name: "Courier", size: 70)
        
        setupUI()
    }
    
    private func setupUI() {
        setupRightButton()
        setupLeftButton()
    }
    
    private func setupRightButton() {
        rightButton.applyStyleStart()
    }
    
    private func setupLeftButton() {
        leftButton.applyStyleReset()
    }
    
    // MARK: - Actions
    @IBAction func leftButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func rightButtonTapped(_ sender: UIButton) {
        if isTimerOn {
            stopTimer()
            rightButton.applyStyleStart()
        } else {
            startTimer()
            rightButton.applyStyleStop()
        }
    }
    
    // MARK: - Logic Private
    @objc private func timerAction() {
        let currentTime = Date().timeIntervalSince1970
        
        if startTime == .zero {
            startTime = currentTime - 3595
        }
        
        currentValue = currentTime - startTime
    }
    
    private func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        isTimerOn = true
    }
    
    private func stopTimer() {
        timer?.invalidate()
        isTimerOn = false
    }
}
