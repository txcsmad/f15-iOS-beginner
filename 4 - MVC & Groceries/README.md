## 4 - MVC & Groceries

October 6th, GDC 1.304, 7:00-8:30PM

### What We Did

#### Model-View-Controller

Model-View-Controller (MVC) is the design pattern to use when building iOS apps. 

The **model** is how we represent data in our program (And nothing more!). A well-written model is simple, and agnostic of the rest of the program.

The **view** is the part of our app that the user sees and interacts with. So far, we have talked about the view layer in terms of Storyboards**. With storyboards, we can set up our view layer so that all the view elements we  In iOS, view elements are subclasses of `UIView`.

The **controller** is the meat and potatoes of our app. It interprets changes in the **view** and the **model**, and interacts with them appropriately.

#### Groceries

To flex our newfound MVC muscles, we got started on our grocery list app. We started by setting up the model component:

* `GroceryList.swift`
* `GroceryListItem.swift`

We gave our `GroceryList` the power to manage an array of `GroceryListItem`s by letting it add, remove, and access them. We made our `GroceryListItem`s more useful by giving them `name`s and `quantity`s.

Next we fleshed out or **view** component:

Inside our Storyboard, we setup a `UITableView` with 1 prototype `UITableViewCell`. We customized that cell using the Attributes Inspector and gave it two labels to display our two `GroceryListItem` properties. Then, we gave that prototype cell an identifier (“ItemCell”) so we could pull it into our view controller.

Last, we implemented our **controller** component:

* `GroceryListViewController.swift`

We used our controller to give its `UITableView` data with two methods provided by the `UITableViewDataSource` protocol:

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groceryList.numberOfItems()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath)
        
        let item = groceryList.getItemAtIndex(indexPath.row)
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "\(item.quantity)"
        
        return cell
    }
    
Implementing this method told our `UITableView` exactly what to show when it loaded.

### Exit Survey

Your feedback is important! It's a way to let us know how we could better service your needs. [Link](https://docs.google.com/forms/d/1_F_Eu6ztr2bvdt5aHdIXw1OtNw_i-nbz856-9G7KJkY/viewform?usp=send_form).
