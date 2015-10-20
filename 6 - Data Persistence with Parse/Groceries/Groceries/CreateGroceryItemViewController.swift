import Foundation
import UIKit

protocol CreateGroceryItemViewControllerDelegate: class {
    
    func userEnteredNewItemWithName(name: String, quantity: Int)
    
}

class CreateGroceryItemViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var quantityStepper: UIStepper!
    
    weak var delegate: CreateGroceryItemViewControllerDelegate?
    
    @IBAction func saveItem(sender: UIBarButtonItem) {
        if let name = inputField.text {
            delegate?.userEnteredNewItemWithName(name, quantity: Int(quantityStepper.value))
        }
        
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelItem(sender: UIBarButtonItem) {
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func quantityChanged(sender: UIStepper) {
        quantityLabel.text = "Quantity: \(Int(quantityStepper.value))"
    }
    
}
