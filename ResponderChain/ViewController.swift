//
//  ViewController.swift
//  ResponderChain
//
//  Created by Sam Meadley on 03/01/2016.
//  Copyright © 2016 Sam Meadley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Nil-targeted actions are passed up the responder chain until they are handled.
    // The didSelectButton:sender implementation below shows a useful example, detecting the
    // collection view cell in which a button touch event occurred.
    @IBAction func didSelectButton(sender: UIButton) {
        
        let point = sender.convertPoint(CGPointZero, toView:self.collectionView)
        let indexPath = self.collectionView.indexPathForItemAtPoint(point)
        
        print("Event handled! I'm \(self.dynamicType) and I will handle the \(sender.dynamicType) touch event for item \(indexPath!.row) \n\n... Now where was I? Oh yeah...", terminator:"\n\n")
    }
    
    override func nextResponder() -> UIResponder? {
        let nextResponder = super.nextResponder()
        printNextResponder(nextResponder)
        
        return nextResponder
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCellWithReuseIdentifier(CollectionViewCell.defaultReuseIdentifier(), forIndexPath: indexPath)
    }
    
}

class View: UIView {
    
    override func nextResponder() -> UIResponder? {
        let nextResponder = super.nextResponder()
        printNextResponder(nextResponder)
        
        return nextResponder
    }
    
}

class CollectionView: UICollectionView {
    
    override func nextResponder() -> UIResponder? {
        let nextResponder = super.nextResponder()
        printNextResponder(nextResponder)
        
        return nextResponder
    }
    
}

class CollectionViewCell: UICollectionViewCell {
    
    class func defaultReuseIdentifier() -> String {
        return "CollectionViewCell"
    }
    
    override func nextResponder() -> UIResponder? {
        let nextResponder = super.nextResponder()
        printNextResponder(nextResponder)
        
        return nextResponder
    }
    
}

class Button: UIButton {

    override func nextResponder() -> UIResponder? {
        let nextResponder = super.nextResponder()
        printNextResponder(nextResponder)
        
        return nextResponder
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        printEvent(event)
        
        super.touchesBegan(touches, withEvent: event)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        printEvent(event)
        
        super.touchesEnded(touches, withEvent: event)
    }
    
    func printEvent(event: UIEvent?) {
        if let phase = event?.allTouches()?.first?.phase {
            print("\nHi, Button here. \"\(phase)\" received and understood. I'll let the Responder Chain know...")
        }
    }
    
}

extension NSObject {
    
    func printNextResponder(nextResponder: UIResponder?) {
        guard let responder = nextResponder else {
            return
        }
        
        print("-> \(self.dynamicType): Hey \(responder.dynamicType), something coming your way!")
    }

}
