//
//  ViewController.swift
//  SwiftValidatorExample
//
//  Created by Jon on 03/06/2016.
//  Copyright © 2016 joncotton. All rights reserved.
//

import UIKit
import SwiftValidation

class ViewController: UIViewController {

    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdTextField: UITextField!
    @IBOutlet weak var fourthTextField: UITextField!
    @IBOutlet weak var fifthTextField: UITextField!
    @IBOutlet weak var sixthTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstTextField.addTarget(self, action: #selector(textFieldDidLoseFocus(_:)), forControlEvents: .EditingDidEnd)
        secondTextField.addTarget(self, action: #selector(textFieldDidLoseFocus(_:)), forControlEvents: .EditingDidEnd)
        thirdTextField.addTarget(self, action: #selector(textFieldDidLoseFocus(_:)), forControlEvents: .EditingDidEnd)
        fourthTextField.addTarget(self, action: #selector(textFieldDidLoseFocus(_:)), forControlEvents: .EditingDidEnd)
        fifthTextField.addTarget(self, action: #selector(textFieldDidLoseFocus(_:)), forControlEvents: .EditingDidEnd)
        sixthTextField.addTarget(self, action: #selector(textFieldDidLoseFocus(_:)), forControlEvents: .EditingDidEnd)
    }
    
    func textFieldDidLoseFocus(sender: UITextField) {
        do {
            try sender.validValue(validatorsForTextField(sender))
            sender.backgroundColor = UIColor.greenColor()
        } catch {
            sender.backgroundColor = UIColor.redColor()
        }
    }
    
    func validatorsForTextField(textField: UITextField) -> [StringValidator] {
        switch textField {
            case firstTextField: return [.nonEmpty, .minimumLength(10)]
            case secondTextField: return [.nonEmpty, .regex(StringValidationPattern.numericOnly)]
            case thirdTextField: return [.regex(StringValidationPattern.alphaOnly)]
            case fourthTextField: return [.match("Test")]
            case fifthTextField: return [.lengthWithinRange(3, 8)]
            case sixthTextField: return [.oneOf(["one", "two", "three"])]
            default: return []
        }
    }
}

