//
//  CashTextFieldDelegate.swift
//  TextFields
//
//  Created by Alp Eren Can on 01/08/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import UIKit

class CashTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    lazy var formatter: NSNumberFormatter = {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        return formatter
    }()
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let textCharacterCount = textField.text?.characters.count
        
        // handle shake to undo crash
        if (range.location + range.length > textCharacterCount) {
            return false
        }
        
        let newText = (textField.text! as NSString).stringByReplacingCharactersInRange(range, withString: string)
        
        // Digits only in input (or deletions)
        let digits = NSCharacterSet.decimalDigitCharacterSet()
        for character in string.unicodeScalars {
            if !digits.longCharacterIsMember(character.value) {
                return false
            }
        }
        
        // Gather all digits
        var newTextDigits = ""
        for character in newText.unicodeScalars {
            if digits.longCharacterIsMember(character.value) {
                newTextDigits.append(character)
            }
        }
        
        // Format all digits into a currency string
        let cents = NSDecimalNumber(string: newTextDigits)
        if cents == NSDecimalNumber.notANumber() {
            textField.text = formatter.stringFromNumber(NSNumber(integer: 0))
        } else {
            let dollars = cents.decimalNumberByDividingBy(100)
            let proposedText = formatter.stringFromNumber(dollars)
            if let proposedText = proposedText {
                if proposedText.characters.count > 15 {
                    return false
                }
            }
            textField.text = proposedText
        }
        
        return false
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField.text!.isEmpty {
            textField.text = formatter.stringFromNumber(NSNumber(integer: 0))
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
    }

}
