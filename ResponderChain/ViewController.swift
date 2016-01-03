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
        
        print(self.dynamicType, __FUNCTION__, "Row:", indexPath!.row)
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

class CollectionViewCell: UICollectionViewCell {
    
    class func defaultReuseIdentifier() -> String {
        return "CollectionViewCell"
    }
    
}

class Button: UIButton {

//    @IBAction func didSelectButton(sender: UIButton) {
//        print(self.dynamicType, __FUNCTION__)
//    }
    
}
