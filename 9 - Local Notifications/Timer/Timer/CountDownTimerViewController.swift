import UIKit


// Count down timer
class CountDownTimerViewController: UIViewController, CountDownTimerDelegate {

    var countDownTimer: CountDownTimer?
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func timePasssed() {
        timeLabel.text = "\(countDownTimer!.timeRemaining)"
    }

    @IBAction func buttonPressed(sender: UIButton) {
        countDownTimer = CountDownTimer(minutes: 5)
        countDownTimer?.delegate = self
        countDownTimer?.start()
    }

}

