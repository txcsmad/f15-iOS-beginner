## 7 - Tab Bars and Time

October 27th, GDC 1.304, 7:00PM - 8:00PM

### What We Did

* We used our MVC skills to separate the concept of a count down timer into separate model, view and controller components
    
- The model keeps track of how long the timer should count down, and actually does the counting. It has a delegate that it calls every second to tell it that time has passed.

- The controller is our special CountDownTimerViewController, which has a reference to the model and to our view.

- Our view (in Main.storyboard) is just a UILabel to display the time and a UIButton to start the timer.

#### Counting Down

The CountDownTimer model is initialized with a number of minutes that it should count down. When we call `start` on it, we want it to continue running until it counts down to zero, then stop. As it's running, we'd like to be notified so we can update the view with the remaining seconds.

To do the actual counting, we used NSTimer, a slightly dated, somewhat convuluted class that Apple provides for scheduling recurring actions.

    NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "tick:", userInfo: nil, repeats: true)

We schedule a timer with a given interval (1.0 seconds) tell it to target our class (`self`) and more specifically, the `tick:` method of our class. The colon denotes that `tick` takes one parameter. The parameter is, by convention, the NSTimer that fired.

All our tick method does is decrement the seconds counter and notify the delegate that time passed! The delegate can then put the updated count on the display, or do whatever eles it wants to do.

#### Accurarcy Check!

How accurate is our simple count down timer? To keep track, we added a `started` field to our model. Whenever the controller starts the timer, this variable gets filled with the current date and time. That way, when the counter reaches zero, we can record the current time, and, by taking the difference, assess how much time the timer was actually on.

Date-times are kept in NSDates. To get the current datetime, just initialize a new NSDate with no parameters, like this:

    let currentDateTime = NSDate()

We saw that our timer was fairly accurate, producing a message like this after being told to run for 5 minutes:

    Timer ran for exactly 299.988653957844 seconds

But, .02 seconds is actually a pretty long time... Why is the timer not exactly correct? And can we do better?


#### Bonus: Operators

In the spirit of Halloween, let's look at one of the scariest Swift features out there: operator overloading.
    
    func -(lhs: NSDate, rhs: NSDate) -> NSTimeInterval {
        return lhs.timeIntervalSinceDate(rhs)
    }

This special function (declared in `NSDate+Helpers.swift`) is named minus, and takes a left hand side and a right hand side. It returns a time interval. All it does is use NSDate's `timeIntervalSinceDate` to return the expected result of `lhs - rhs`. This is a relatively harmless use of this language feature, but notice that I could've defined the operator in any way that I pleased. I could make it return something completely unexpected, like only the difference between the seconds of the two parameters, or just the integer number of days between them. Without looking at the way the operator is implemented, you wouldn't know which one to expect. Why even make it an operator? Why not use a more descriptive name instead?


### Exit Survey

Your feedback is important! It's a way to let us know how we could better service your needs. [Link](http://goo.gl/forms/isVyOdZwya).
