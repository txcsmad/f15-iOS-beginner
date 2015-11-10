//
//  Stopwatch.swift
//  Timer
//
//  Created by Jesse Tipton on 11/3/15.
//  Copyright © 2015 Jesse Tipton. All rights reserved.
//

import Foundation

protocol StopwatchDelegate: class {
    
    func timePassed()
    
}

class Stopwatch: NSObject {
    
    var originalStart: NSDate?
    var laps = [NSTimeInterval]()
    
    weak var delegate: StopwatchDelegate?
    var timer: NSTimer?
    
    func start() {
        originalStart = NSDate()
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "tick:", userInfo: nil, repeats: true)
    }
    
    func allLaps() -> NSTimeInterval {
        return laps.reduce(0) { prev, lap in
            return prev + lap
        }
    }
    
    func tick(timer: NSTimer) {
        delegate?.timePassed()
    }
    
    func addLap() {
        if let start = originalStart {
            let newLap = NSDate() - start.dateByAddingTimeInterval(allLaps())
            laps.append(newLap)
        }
    }
    
}
