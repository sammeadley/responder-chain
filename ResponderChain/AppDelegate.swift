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
        print(self.dynamicType, __FUNCTION__)
        
        return super.sendAction(action, to: target, from: sender, forEvent: event)
    }
    
    override func sendEvent(event: UIEvent) {
        print(self.dynamicType, __FUNCTION__, event.allTouches()!.first!.phase)
        
        super.sendEvent(event)
    }
    
    @IBAction func didSelectButton(sender: UIButton) {
        print(self.dynamicType, __FUNCTION__)
    }
    
}

class Window: UIWindow {
    
    override func sendEvent(event: UIEvent) {
        print(self.dynamicType, __FUNCTION__, event.allTouches()!.first!.phase)
        
        super.sendEvent(event)
    }
    
    @IBAction func didSelectButton(sender: UIButton) {
        print(self.dynamicType, __FUNCTION__)
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
