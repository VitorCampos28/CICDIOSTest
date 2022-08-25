//
//  ViewController.swift
//  RetirementCalculator
//
//  Created by Vitor Campos on 23/08/22.
//

import UIKit
import AppCenterCrashes
import AppCenterAnalytics

class ViewController: UIViewController {
    @IBOutlet weak var firstField: UITextField!
    @IBOutlet weak var secondField: UITextField!
    @IBOutlet weak var thirdField: UITextField!
    @IBOutlet weak var fourthField: UITextField!
    @IBOutlet weak var fifthField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Crashes.hasCrashedInLastSession {
            let alert = UIAlertController(title: "Oops", message: "Sorry about that, an error occured", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "It's cool", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        Analytics.trackEvent("navigated_to_calculator")
    }

    @IBAction func click(_ sender: Any) {
        guard let currentAge = secondField.text else { return }
        guard let planned_retirement_age = thirdField.text else { return }
        
        let properties = ["current_age" : currentAge, "planned_retirement_age" : planned_retirement_age]
        
        Analytics.trackEvent("Calculate_retirement_amount", withProperties: properties)
    }
    
}

