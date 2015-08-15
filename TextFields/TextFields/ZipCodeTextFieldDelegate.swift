//
//  ZipCodeTextFieldDelegate.swift
//  TextFields
//
//  Created by Alp Eren Can on 01/08/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import UIKit

class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let textCharacterCount = textField.text?.characters.count
        
        // handle shake to undo crash
        if (range.location + range.length > textCharacterCount) {
            return false
        }
        
        // allow backspace
        if (range.length == 1 && string.characters.count == 0) {
            return true
        }
        
        // allow editing if the conditions are met
        return (Int(string) != nil) && textCharacterCount < 5


    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }

}
