import Foundation

protocol CountDownTimerDelegate: class {
    func timePasssed()
    func countDownDidEnd()
}

@objc class CountDownTimer: NSObject {
    var delegate: CountDownTimerDelegate?
    private var timer: NSTimer?
    //TODO: Need to be able to create in the future

    private(set) var timeRemaining: NSTimeInterval
    private var started: NSDate?

    var projectedEndDate: NSDate? {
        get{
            if timer == nil {
                return nil
            } else {
                // If the timer isn't nil, we must've started the timer
                assert(started != nil)
                return started! + timeRemaining
            }
        }
    }

    var running: Bool {
        get{
            return timer != nil
        }
    }

    init(duration: NSTimeInterval){
        self.timeRemaining = duration
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
            delegate?.countDownDidEnd()
        }
    }
}