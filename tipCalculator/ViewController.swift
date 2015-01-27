//
//  ViewController.swift
//  tipCalculator
//
//  Created by Tom King on 1/22/15.
//  Copyright (c) 2015 Mobilemind. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var percentSementControl: UISegmentedControl!
    
    let tipPercentageArray = [ 0.18, 0.2, 0.25 ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalAmountLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        showUpdatedValues()
    }
    
    @IBAction func onEditingDidEnd(sender: AnyObject) {
        formatBillAmount()
    }
    
    @IBAction func onTap(sender: AnyObject) {
        // handle View Controller Tap *OR* Segmented Control Change
        showUpdatedValues()
        view.endEditing(true)
    }

    func showUpdatedValues() {
        var billAmount = NSString(string: billAmountField.text).doubleValue
        var tipPercentage = tipPercentageArray [ percentSementControl.selectedSegmentIndex]
        var tipAmount = billAmount * tipPercentage
        var totalAmount = billAmount + tipAmount
        tipLabel.text = String(format: "$%.2f",  tipAmount)
        totalAmountLabel.text = String(format: "$%.2f",  totalAmount)
    }
    
    func formatBillAmount () {
        if 0 == NSString(string: billAmountField.text).doubleValue {
            billAmountField.text = "";
        }
        else {
            billAmountField.text = String(format: "%.2f",  NSString(string: billAmountField.text).doubleValue)
        }
    }
    
}

