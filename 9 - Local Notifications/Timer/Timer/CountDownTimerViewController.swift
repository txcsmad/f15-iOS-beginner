import UIKit


// Count down timer
class CountDownTimerViewController: UIViewController, CountDownTimerDelegate {

    var countDownTimer: CountDownTimer?
    var userEnteredTime: NSTimeInterval = 300
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeSet: UIStepper!
    @IBOutlet weak var startStop: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeSet.value = userEnteredTime
        timeLabel.text = userEnteredTime.description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func timePasssed() {
        timeLabel.text = countDownTimer!.timeRemaining.description
    }

    func countDownDidEnd() {
        // We're done with it so let's just nil it out
        countDownTimer = nil
        startStop.setTitle("Start", forState: .Normal)
        timeSet.hidden = false


        UIView.animateWithDuration(3.0, animations: { () -> Void in
            self.timeLabel.layer.backgroundColor = UIColor.redColor().CGColor
            }) { (_) -> Void in
                print("Animation finished")
                self.timeLabel.layer.backgroundColor = UIColor.clearColor().CGColor
        }
    }

    @IBAction func stepperPressed(sender: UIStepper){
        // If the user had a currently running timer, reset it
        if countDownTimer != nil {
            countDownTimer = nil
        }
        let senderInterval = NSTimeInterval(sender.value)
        userEnteredTime = senderInterval
        timeLabel.text = senderInterval.description
    }

    @IBAction func buttonPressed(sender: UIButton) {

        // If the timer exists and is running, stop it.
        if countDownTimer != nil && countDownTimer!.running {
            countDownTimer?.stop()

            //Configure the UI so that the user can start again
            sender.setTitle("Start", forState: .Normal)
            timeSet.hidden = false
        } else {
            // If there isn't a countdowntimer object, this is a new timer. Wire it up.
            if countDownTimer == nil {
                countDownTimer = CountDownTimer(duration: userEnteredTime)
                countDownTimer?.delegate = self
            }

            countDownTimer?.start()

            // Configure the UI so the user can stop again
            sender.setTitle("Stop", forState: .Normal)
            timeSet.hidden = true

            //TODO: Set up a notification!
            let notification = UILocalNotification()
            notification.fireDate = countDownTimer?.projectedEndDate
            notification.alertTitle = "Timer is done"
            notification.alertBody = "Jimmy dean breakfast bowl (tm) is warm"
            notification.soundName = UILocalNotificationDefaultSoundName

            UIApplication.sharedApplication().scheduleLocalNotification(notification)
            
        }

    }

}

