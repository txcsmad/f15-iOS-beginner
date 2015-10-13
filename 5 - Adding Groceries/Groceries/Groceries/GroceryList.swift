
class GroceryList {
    
    private var items = [GroceryListItem]()
    
    func numberOfItems() -> Int {
        return items.count
    }
    
    func addItem(item: GroceryListItem) {
        items.append(item)
    }
    
    func removeItemAtIndex(index: Int) {
        items.removeAtIndex(index)
    }
    
    func itemAtIndex(index: Int) -> GroceryListItem {
        return items[index]
    }
    
}
