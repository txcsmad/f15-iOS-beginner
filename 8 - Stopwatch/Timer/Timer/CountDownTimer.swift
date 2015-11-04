import Foundation

protocol CountDownTimerDelegate: class {
    func timePasssed()
}

@objc class CountDownTimer: NSObject {
    var delegate: CountDownTimerDelegate?
    private let minutes: Int
    private var timer: NSTimer?
    //TODO: Need to be able to create in the future

    private(set) var timeRemaining: Int
    private var started: NSDate?

    init(minutes: Int){
        self.minutes = minutes
        self.timeRemaining = 60 * minutes
    }

    func start(){
        started = NSDate()
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "tick:", userInfo: nil, repeats: true)
    }

    func stop(){
        timer?.invalidate()
        timer = nil
    }

    func tick(timer: NSTimer){
        --timeRemaining;
        delegate?.timePasssed()
        if (timeRemaining == 0){
            let stoppedAt = NSDate()
            stop()
            print("Timer ran for exactly \(stoppedAt - started!) seconds")
        }
    }
}