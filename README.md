## Target-Action and the Responder Chain on iOS

Presented at NSManchester, February 1, 2016. Slides available from [Speaker Deck.](https://speakerdeck.com/sammeadley/target-action-and-the-responder-chain-on-ios)

Example Swift project illustrating the path taken by an event object when UIKit recognises a button tap within a collection view cell.

```
Event A <--- Principal UIApplication class pops top event from queue and dispatches for handling via sendEvent:
Event B     	|
Event C 	Sends event to UIApplication's keyWindow sendEvent: method
Event D 		|
			UIWindow object delivers the event to the view where the touch occurred
				|
			If the View is a UIControl subclass, UIKit checks the target and action properties
				|
			The action message is dispatched using UIApplication's sendAction:to:from:forEvent
			The message is forwarded to the class specified in the target property. If nil, it is forwarded
			to the First Responder, and passed down the Responder Chain until handled.
```

## Discussion

Actions are added to a UIControl subclass using `addTarget(_:action:forControlEvents:)` or via Interface Builder.

When providing an explicit target, UIKit forwards the event to the specified class. If the selector is not implemented on the target class, an NSInvalidArgumentException "unrecognized selector sent to instance" is thrown.

Alternatively, passing a nil target hands off the event to the Responder Chain. Starting at the First Responder (the UIControl itself) the chain is traversed (recursively calling `nextResponder`) until the specified action message is encountered. If the action message reaches the end of the chain without being encountered the event is safely ignored and no exception is raised.

Action methods are recognised based on their signature, conventionally these take the basic form;

```Swift
@IBAction func doSomething(sender: AnyObject)
```

The more specific type used for the sender parameter, the better Interface Builder will be at filtering possible actions.