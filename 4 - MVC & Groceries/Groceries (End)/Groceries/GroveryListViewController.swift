
import UIKit

class GroceryListViewController: UITableViewController {

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
    
}
