# firstResponderCrash
Demonstration application showing a strange crash on iOS 11

Start the application on a 9.x or 10.x simulator.  Notice that the app will show three screens sequentially
* TitleViewController
* SignUpViewController
* SignInViewController

NOTE: All screen transitions are done with timers, so no action is required.

Run the applicatino again using an iOS 11.x simulator.  Notice that the transition to the SignInVIewController will cause a crash.

It appears to be having trouble determining the 'firstResponder' and thus laying out the view.  
Strangely, the view is composed of the exact same view hierarchy as the SignUpViewController which has no trouble
using the custom transition or doing the layout.
