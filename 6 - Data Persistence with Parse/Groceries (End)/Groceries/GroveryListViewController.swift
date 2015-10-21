
import UIKit
import Parse

class GroceryListViewController: UITableViewController, CreateGroceryItemViewControllerDelegate {
    
    var items = [PFObject]()
    
    private func loadItems() {
        // TODO: Query for items
        let query = PFQuery(className: "Item")
        query.whereKey("quantity", greaterThan: 2)
        query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
            if let results = objects {
                self.items = results
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            let item = items[indexPath.row]
            item.deleteInBackgroundWithBlock({ (success: Bool, error: NSError?) -> Void in
                if success {
                    self.loadItems()
                }
            })
        }
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath)
    
        let item = items[indexPath.row]
        
        if let itemName = item["name"] as? String {
            cell.textLabel?.text = itemName
        }
        
        if let itemQuantity = item["quantity"] as? Int {
            cell.detailTextLabel?.text = "\(itemQuantity)"
        }
        
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
        let item = PFObject(className: "Item")
        item["name"] = name
        item["quantity"] = quantity
        item.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if success {
                self.loadItems()
            }
        }
    }
    
}
