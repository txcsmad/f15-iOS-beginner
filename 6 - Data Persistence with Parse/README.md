## 6 - Data Persistence with Parse

October 20th, GDC 1.304, 7:00PM - 8:30PM

### What We Did

This week, we used the Parse SDK to take our groceries to the cloud. Parse is a backend-as-a-service that allows us to send data to their servers and fetch it later.

#### Overview

1. [Create a Parse account](https://parse.com/signup)
2. Recreate the model with the Parse dashboard
3. Re-implement our `UITableViewDataSource` and `CreateGroceryItemViewControllerDelegate` to use the Parse SDK

#### Parse SDK

The core functionality of the Parse SDK can be achieved with two classes: `PFObject` and `PFQuery`. `PFObject` is the class we use to model our data (i.e. Our grocery list items). We create them, edit their values, and then save them to the cloud. `PFQuery` lets us get our `PFObjects` back from the Parse servers. All we have to do is tell `PFQuery` what class we want to fetch, then fetch it (Yes, it really is that simple!).

Parse is a fantastic tool for getting projects that require cloud storage off the ground quickly. It's great for personal projects and hackathon hacks. If you want to use Parse in another project, I recommend reading through the [Parse iOS documentation](https://www.parse.com/docs/ios/guide). It very clearly explains how to implement the core functionality of Parse SDK (Sending and receiving data), as well as all the perks and extra features it includes (Push notifications, crash reporting, etc.).

### Exit Survey

Your feedback is important! It's a way to let us know how we could better service your needs. [Link](https://docs.google.com/forms/d/1cw8iv1zTpWf9rrhRauTGYSG-iURAfVR4YZSqjVgPAgw/viewform).
