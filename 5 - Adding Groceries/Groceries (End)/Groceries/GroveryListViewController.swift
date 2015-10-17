
import UIKit

class GroceryListViewController: UITableViewController, CreateGroceryItemViewControllerDelegate {

    let groceryList = GroceryList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groceryList.addItem(GroceryListItem(name: "Milk", quantity: 2))
        groceryList.addItem(GroceryListItem(name: "Eggs", quantity: 12))
        groceryList.addItem(GroceryListItem(name: "Bread", quantity: 1))
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groceryList.numberOfItems()
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath)
        
        let item = groceryList.itemAtIndex(indexPath.row)
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "\(item.quantity)"
        
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // The destination is actually a navigation controller (see the storyboard).
        let navigationController = segue.destinationViewController as! UINavigationController
        // Inside the navigation controller, the first and only child will be our Create controller
        let destination = navigationController.childViewControllers[0] as! CreateGroceryItemViewController
        destination.delegate = self
    }
    func userEnteredANewItem(name: String) {
        let item = GroceryListItem(name: name, quantity:1)
        groceryList.addItem(item)
        tableView.reloadData()
    }
    
}
