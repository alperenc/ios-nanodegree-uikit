//
//  RandomColorTextFieldDelegate.swift
//  TextFields
//
//  Created by Alp Eren Can on 01/08/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import UIKit

class RandomColorTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    let colors = [UIColor.redColor(), UIColor.greenColor(), UIColor.blueColor(), UIColor.yellowColor(), UIColor.magentaColor(), UIColor.cyanColor(), UIColor.orangeColor(), UIColor.purpleColor(), UIColor.brownColor(), UIColor.grayColor()]
    
    func randomColor() -> UIColor {
        let randomIndex = Int(arc4random() % UInt32(colors.count))
        
        return colors[randomIndex]
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        textField.textColor = randomColor()
        
        return true
    }

}
