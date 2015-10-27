import Foundation

func -(lhs: NSDate, rhs: NSDate) -> NSTimeInterval {
    return lhs.timeIntervalSince1970
}