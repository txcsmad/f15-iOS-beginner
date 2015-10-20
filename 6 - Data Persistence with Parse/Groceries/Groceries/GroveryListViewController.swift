
import UIKit
import Parse

class GroceryListViewController: UITableViewController, CreateGroceryItemViewControllerDelegate {
    
    private func loadItems() {
        // TODO: Query for items
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: Make this an appropriate number
        return 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath)
        // TODO: Configure the cell
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // The destination is actually a navigation controller (see the storyboard).
        let navigationController = segue.destinationViewController as! UINavigationController
        // Inside the navigation controller, the first and only child will be our Create controller
        let destination = navigationController.childViewControllers[0] as! CreateGroceryItemViewController
        destination.delegate = self
    }
    
    // MARK: - CreateGroceryItemViewControllerDelegate
    
    func userEnteredNewItemWithName(name: String, quantity: Int) {
        // TODO: Create and save the item
    }
    
}
