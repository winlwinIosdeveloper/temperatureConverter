//
//  conversionViewController.swift
//  WorldTrotter
//
//  Created by abe on 12/2/22.
//  Copyright © 2022 abe. All rights reserved.
//

import UIKit

class ConversionViewController : UIViewController, UITextFieldDelegate {
    
    var fahrenheit : Double? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celsius : Double? {
        if let value = fahrenheit {
            return (value - 32) * (5/9)
        } else {
            return nil
        }
    }
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        textField.resignFirstResponder()
        }
    

    @IBOutlet weak var celsiusLabel : UILabel!
    
    @IBAction func fahrenheitTextFieldEdigingChanged(textField : UITextField) {
        if let text = textField.text , let value = Double(text) {
            fahrenheit = value
        } else {
            fahrenheit = nil
        }
    }
    
    func updateCelsiusLabel() {
        if let value = celsius {
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: value))
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    var numberFormatter : NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("Current text : \(String(describing: textField.text))")
        print("Replace text : \(string)")
        
        let existingTextHasDecimalSeperator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeperator = string.range(of: ".")
        print("\(String(describing: existingTextHasDecimalSeperator))")
        print("\(String(describing: replacementTextHasDecimalSeperator))")
        
        if existingTextHasDecimalSeperator != nil && replacementTextHasDecimalSeperator != nil {
            return false
        }
        return true
    }
    
}

