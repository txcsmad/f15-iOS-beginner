

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var coolLabel: UILabel!

    @IBAction func makeLabelRed(sender: UIButton) {
        coolLabel.textColor = UIColor.redColor()
    }
    @IBAction func makeLabelGreen (sender: UIButton) {
        coolLabel.textColor = UIColor.greenColor()
    }

    @IBAction func makeLabelPurple(sender: AnyObject) {
        coolLabel.textColor = UIColor.purpleColor()
    }
}


