# A-Timer
Simple timer app with UIKit + Storyboard

- App Imge
 <img width="230" alt="Screenshot 2023-09-30 at 5 56 12 PM" src="https://github.com/osrsla/A-Timer/assets/139095139/a62b53fd-dbe3-4544-8d1c-7982e7742697">

- Study : AVFoundation / Timer / selector / weak reference / UISlider
- Code

```swift
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
```
