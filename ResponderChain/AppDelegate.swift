//
//  AppDelegate.swift
//  ResponderChain
//
//  Created by Sam Meadley on 03/01/2016.
//  Copyright © 2016 Sam Meadley. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateInitialViewController()
        
        self.window = Window()
        self.window?.rootViewController = viewController
        self.window?.makeKeyAndVisible()
        
        return true
    }

}

@objc(Application) class Application: UIApplication {
    
    override func sendAction(action: Selector, to target: AnyObject?, from sender: AnyObject?, forEvent event: UIEvent?) -> Bool {
        print("\nHold up, \(self.dynamicType) again! Attempting to send \(action) to \(target)")
        
        return super.sendAction(action, to: target, from: sender, forEvent: event)
    }
    
    override func sendEvent(event: UIEvent) {
        if let phase = event.allTouches()?.first?.phase {
            print("\nHello from \(self.dynamicType), the principal UIApplication class! Dispatched \"\(phase)\" event!")
        }
        
        super.sendEvent(event)
    }
    
    override func nextResponder() -> UIResponder? {
        let nextResponder = super.nextResponder()
        printNextResponder(nextResponder)
        
        return nextResponder
    }
    
}

class Window: UIWindow {
    
    override func sendEvent(event: UIEvent) {
        if let phase = event.allTouches()?.first?.phase {
            print("Greetings from \(self.dynamicType) (UIWindow keyWindow), received \"\(phase)\" event, delivering to view where touch occurred...")
        }
        
        super.sendEvent(event)
    }
    
    override func nextResponder() -> UIResponder? {
        let nextResponder = super.nextResponder()
        printNextResponder(nextResponder)
        
        return nextResponder
    }
    
}

extension UITouchPhase: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .Began:
            return "Touch Began"
            
        case .Cancelled:
            return "Touch Cancelled"
            
        case .Ended:
            return "Touch Ended"
            
        case .Moved:
            return "Touch Moved"
            
        case .Stationary:
            return "Touch Stationary"
            
        }
    }
    
}
