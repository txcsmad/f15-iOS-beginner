//
//  SecondViewController.swift
//  Timer
//
//  Created by Jesse Tipton on 11/02/15.
//  Copyright © 2015 Jesse Tipton. All rights reserved.
//

import UIKit

class StopwatchViewController: UIViewController, StopwatchDelegate, UITableViewDataSource {

    var stopwatch = Stopwatch()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalTimePassedLabel: UILabel!
    @IBOutlet weak var timeSinceLastLapPassedLabel: UILabel!
    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    @IBAction func leftButtonPressed(sender: UIButton) {
        stopwatch.addLap()
        tableView.reloadData()
    }
    
    @IBAction func rightButtonPressed(sender: UIButton) {
        stopwatch.start()
    }
    
    func stringFromTimeInterval(interval: NSTimeInterval) -> String {
        let interval = NSInteger(interval)
        let seconds = interval % 60
        let minutes = (interval / 60) % 60
        return String(format: "%0.2d:%0.2d", minutes, seconds)
    }
    
    func timePassed() {
        if let start = stopwatch.originalStart {
            let totalPassed = NSDate() - start
            totalTimePassedLabel.text = stringFromTimeInterval(totalPassed)
            
            let lastLapPassed = NSDate() - start.dateByAddingTimeInterval(stopwatch.allLaps())
            timeSinceLastLapPassedLabel.text = stringFromTimeInterval(lastLapPassed)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopwatch.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stopwatch.laps.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LapCell", forIndexPath: indexPath)

        cell.textLabel?.text = "Lap \(indexPath.row + 1)"
        cell.detailTextLabel?.text = stringFromTimeInterval(stopwatch.laps[indexPath.row])
        
        return cell
    }


}















