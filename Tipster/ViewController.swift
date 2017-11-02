//
//  ViewController.swift
//  Tipster
//
//  Created by Jason Lee on 11/1/17.
//  Copyright © 2017 Jason Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var LowPercent: UILabel!
    
    @IBOutlet weak var MediumPercent: UILabel!
    
    @IBOutlet weak var HighPercent: UILabel!
    
    @IBOutlet weak var LowPercentTip: UILabel!
    
    @IBOutlet weak var MediumPercentTip: UILabel!
    
    @IBOutlet weak var HighPercentTip: UILabel!
    
    @IBOutlet weak var LowPercentTotal: UILabel!
    
    @IBOutlet weak var MediumPercentTotal: UILabel!
    
    @IBOutlet weak var HighPercentTotal: UILabel!
    
    @IBOutlet weak var SubTotal: UILabel!
    
    @IBOutlet weak var GroupSize: UILabel!
    
    
    //define variables for later use
    var numberOnScreen: Double = 0
    
    var lowTipTotal: Double?
    
    var medTipTotal: Double?
    
    var highTipTotal: Double?
    
    
    
    
    
    
    
    //Calculate tips and update labels
    @IBAction func TipSlider(_ sender: UISlider) {
        //assign label for low tip percentage
        LowPercent.text = String(Int(sender.value)) + String("%")
        //assign label for medium tip percentage
        MediumPercent.text = String(Int(sender.value + 5)) + String("%")
        //assign label for high tip percentage
        HighPercent.text = String(Int(sender.value + 10)) + String("%")
        
        //calculate tip for low percentage and store value in a double and display
        LowPercentTip.text = String(numberOnScreen * (Double(sender.value)  / 100))
        lowTipTotal = Double(LowPercentTip.text!)!
        //calculate tip for medium percentage and store value in a double and display
        MediumPercentTip.text = String(numberOnScreen * (Double(sender.value + 5) / 100))
        medTipTotal = Double(MediumPercentTip.text!)!
        //calculate tip for high percentage and store value in a double and display
        HighPercentTip.text = String(numberOnScreen * (Double(sender.value + 10) / 100))
        highTipTotal = Double(HighPercentTip.text!)!
        //calculate total and display
        LowPercentTotal.text = String(numberOnScreen + lowTipTotal!)
        //calculate total and display
        MediumPercentTotal.text = String(numberOnScreen + medTipTotal!)
        //calculate total and display
        HighPercentTotal.text = String(numberOnScreen + highTipTotal!)
    }
    //display group number based on slider value
    @IBAction func GroupSlider(_ sender: UISlider) {
        GroupSize.text = String(Int(sender.value))
        LowPercentTotal.text = String(Int((numberOnScreen + lowTipTotal!) / Double(sender.value)))
        MediumPercentTotal.text = String(Int((numberOnScreen + medTipTotal!) / Double(sender.value)))
        HighPercentTotal.text = String(Int((numberOnScreen + highTipTotal!) / Double(sender.value)))
    
    }
    
    @IBAction func DecimalButton(_ sender: UIButton) {
        SubTotal.text = SubTotal.text! + "."
    }
    
    
    @IBAction func ClearButton(_ sender: UIButton) {
        SubTotal.text = String("")
        
    }
    //Display user inputs to screen and store valu in a double
    @IBAction func Numbers(_ sender: UIButton) {
        
        SubTotal.text = SubTotal.text! + String(sender.tag - 1)
        numberOnScreen = Double(SubTotal.text!)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

