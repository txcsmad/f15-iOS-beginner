import AVFoundation

import UIKit

class ViewController: UIViewController {
    let synthesizer = AVSpeechSynthesizer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: Make textfield in the storyboard so that we can get input.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func didReceivePirateSpeak(pirateSpeak: String){
        //TODO: Speak like a pirate.
    }

    //TODO: Get user inputted text
}

