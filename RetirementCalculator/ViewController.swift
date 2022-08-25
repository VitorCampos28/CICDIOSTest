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
    @IBOutlet weak var resultLabel: UILabel!
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
        guard let monthlyInvestmint: Int = Int(firstField.text!) else { return }
        guard let currentAge = Int(secondField.text!) else { return }
        guard let planned_retirement_age = Int(thirdField.text!) else { return }
        guard let average_interest_rate = Int(fourthField.text!)  else { return }
        guard let currentSavings = Int(fifthField.text!) else { return }
        
        let retirement_amount = 100
        
        resultLabel.text = "If you save $\(monthlyInvestmint) every month for \(planned_retirement_age - currentAge) years, and invest that money plus your current investment of \(currentSavings) at a \(average_interest_rate)% anual interest rate, you will have \(retirement_amount) by th time you are \(planned_retirement_age)"
        
        let properties = ["current_age" : String(currentAge), "planned_retirement_age" : String(planned_retirement_age)]
        
        Analytics.trackEvent("Calculate_retirement_amount", withProperties: properties)
    }
    
}

