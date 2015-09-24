import AVFoundation

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    let synthesizer = AVSpeechSynthesizer()
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func didReceivePirateSpeak(pirateSpeak: String){
        let utterance = AVSpeechUtterance(string: pirateSpeak)
        utterance.rate = 0.5
        synthesizer.speakUtterance(utterance)
    }

    //TODO: Get user inputted text?
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if let text = textField.text {
            translateToPirateSpeak(text, callback: didReceivePirateSpeak)

        }
        return true
    }

}

