import Foundation
import UIKit

protocol CreateGroceryItemViewControllerDelegate: class {
    func userEnteredANewItem(name: String)
}

class CreateGroceryItemViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var inputField: UITextField!
    weak var delegate: CreateGroceryItemViewControllerDelegate?

    override func viewDidLoad() {
        inputField.delegate = self
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let providedName = textField.text
        if let actualText = providedName {
            delegate?.userEnteredANewItem(actualText)
        }
        dismissViewControllerAnimated(true, completion: nil)
        return true
    }
}