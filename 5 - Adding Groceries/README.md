## 5 - Adding Groceries

October 13th, GDC 1.304, 7:00-8:30PM

### What We Did

Last week, we made a simple app that displayed a list of groceries. We carefully architected the code to be reusable and easy to understand.

This week, we put that design to the test. We added a place in our app where we can _add_ grocery list items. We created a new controller and a new view to accomplish this.

* We embedded our tableview controller in a _navigation controller_ by selecting the grocery list tableview controller in the storyboard and clicking `Editor > Embed in > Navigation Controller`. This gave our app a navigation bar.

* We added a bar button item to the upper right of the navigation bar by dragging it from the object library to the bar.

* Added a new, plain view controller by dragging it out from the object library, then we option dragged from the button to the new view controller and made a `present modally` connection. Now the second view controller appears when you tap the button.

* We made the new view controller be of our special type, `CreateGroceryItemViewController`, then we added a textfield to it and made a corresponding connection to the field's IBOutlet in the Swift class.

* In order to get text input from the view, we implemented the `UITextFieldDelegate` in our `CreateGroceryItemViewController`. Essentially, this is a way for us to tell the textfield to "come talk to us" whenever it has an important decision to make or the user has executed some action. We implemented the `textFieldShouldReturn` function of the delegate. The text field will call this function when the user presses the return key. In this function, we get the text from the textfield then dismiss the view controller.

* We tell the text field that we're its delegate in `viewDidLoad`.

* In order to get the text information from `CreateGroceryItemViewController` all the way back to `GroceryListViewController`, we created our own custom delegate by writing a _protocol_. A protocol is simply a way to specify what a delegate should do. It's a bunch of function names. Many different classes can elect to implement the protocol and then are eligible to be used as delegates. We gave this protocol one function: `func userEnteredANewItem(name: String)`

* We made a variable in `CreateGroceryItemViewController` named `delegate` and instead of giving it a concrete class type, we made it be the type of our protocol!

	weak var delegate: CreateGroceryItemViewControllerDelegate?

* Then we added a call to `userEnteredANewItem` in `textFieldShouldReturn`.

* In order to actually receive the information in the `GroceryListViewController`, we needed to implement the new protocol we created and tell the `CreateGroceryItemViewController` to "come talk to us" whenever the user enters text by making ourselves its delegate.

* We implemented the protocol by modifying our class declaration...

	class GroceryListViewController: UITableViewController, CreateGroceryItemViewControllerDelegate

And then writing a `userEnteredANewItem`. We made this function simply create a new grocery item and reload the view.


### Exit Survey

Your feedback is important! It's a way to let us know how we could better service your needs. [Link](http://goo.gl/forms/7cKlyQTuCF).
