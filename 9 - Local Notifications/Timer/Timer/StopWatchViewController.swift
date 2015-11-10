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
    
    
    
    func timePassed() {
        if let start = stopwatch.originalStart {
            let totalPassed = NSDate() - start
            totalTimePassedLabel.text = totalPassed.description
            
            let lastLapPassed = NSDate() - start.dateByAddingTimeInterval(stopwatch.allLaps())
            timeSinceLastLapPassedLabel.text = lastLapPassed.description
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
        cell.detailTextLabel?.text = stopwatch.laps[indexPath.row].description
        
        return cell
    }


}















