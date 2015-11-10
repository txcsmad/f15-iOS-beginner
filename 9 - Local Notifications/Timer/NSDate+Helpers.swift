import Foundation

func -(lhs: NSDate, rhs: NSDate) -> NSTimeInterval {
    return lhs.timeIntervalSinceDate(rhs)
}

func +(lhs: NSDate, rhs: NSTimeInterval) -> NSDate {
    return lhs.dateByAddingTimeInterval(rhs)
}

extension NSTimeInterval {
    var description: String {
        get{
            let seconds = Int(self) % 60
            let minutes = (Int(self) / 60) % 60
            let string = String(format: "%0.2d:%0.2d", minutes, seconds)
            return string
        }
    }
}