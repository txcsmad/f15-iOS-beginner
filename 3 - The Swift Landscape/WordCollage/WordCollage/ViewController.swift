

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var coolLabel: UILabel!

    @IBAction func makeLabelRed(sender: UIButton) {
        let subviews = view.subviews
        subviews[0].removeFromSuperview()
        for view in subviews {
            let labelView = view as? UILabel
            labelView?.textColor = UIColor.redColor()
            // The above line is really just a more succint way of saying the below!

            //if labelView != nil {
            //   labelView!.textColor = UIColor.redColor()
            //}
        }
    }
    @IBAction func didTouchDownGreenButton(sender: UIButton) {
        //Let's do something nasty and remove the view out
        //from underneathth the user's finger
        sender.removeFromSuperview()
    }

    @IBAction func makeLabelGreen (sender: UIButton) {
        coolLabel.textColor = UIColor.greenColor()
    }

    @IBAction func makeLabelPurple(sender: AnyObject) {
        //Make the view.
        let newView = UIView(frame: CGRect(x: 400, y: 10, width: 100, height: 100))
        newView.backgroundColor = UIColor.purpleColor()
        view.addSubview(newView)
        //We've added a view!
    }
}


