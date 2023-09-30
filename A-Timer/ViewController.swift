//
//  ViewController.swift
//  A-Timer
//
//  Created by SR on 2023/09/29.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var slider: UISlider!
    
    weak var timer: Timer?
    
    let mainLabelDefaultText = "초를 선택하세요"
    
    var number: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        mainLabel.text = mainLabelDefaultText
        slider.value = 0.5
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        number = Int(sender.value * 60)
        mainLabel.text = "\(number) 초"
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
            if number > 0 {
                number -= 1
                slider.value = Float(number) / Float(60)
                mainLabel.text = "\(number) 초"
                print("slider.value: \(slider.value), mainLabel: \(mainLabel.text!), number: \(number), \(number / 60)")

            } else {
                number = 0
                mainLabel.text = mainLabelDefaultText
                slider.value = 0.5
                AudioServicesPlaySystemSound(SystemSoundID(1323))
                timer?.invalidate()
            }
        }
    }

    @IBAction func resetButtonTapped(_ sender: UIButton) {
        mainLabel.text = mainLabelDefaultText
        slider.setValue(0.5, animated: true)
        number = 0
        timer?.invalidate()
    }
}
