//
//  Step5ViewController.swift
//  swift-earlgrey-bootcamp
//
//  Created by Pivotal on 2017-05-09.
//
//

import UIKit

class Step5ViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties
    @IBOutlet weak var step5Label: UILabel!
    @IBOutlet weak var step5TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tie in text field to delegate
        step5TextField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // hide keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    
    // MARK: Actions
    @IBAction func step5Button(_ sender: UIButton) {
        step5Label.text = "Button pressed"
    }

}
