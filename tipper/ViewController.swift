//
//  ViewController.swift
//  tipper
//
//  Created by Mohit Singh on 11/21/16.
//  Copyright © 2016 Mohit Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    let tipArray = ["5", "10", "15", "20", "25", "30", "35", "40", "45", "50"]
    let memberArray = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    @IBOutlet weak var tipPicker: UIPickerView!
    @IBOutlet weak var billText: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var memberSlider: UISlider!
    @IBOutlet weak var memberCountLabel: UILabel!
    @IBOutlet weak var cppLabel: UILabel!
    
    var selectedTipPerc = 5.0
    var bill = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipPicker.delegate = self
        tipPicker.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tipArray[row]+"%"
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tipArray.count
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tipCalculate(pickerView)
    }

    @IBAction func tipCalculate(_ sender: Any) {
        selectedTipPerc = (Double(tipArray[tipPicker.selectedRow(inComponent: 0)])!)/100
        bill = Double(billText.text!) ?? 0
        let tip = (bill*selectedTipPerc)
        tipLabel.text = String(format: "$%.2f", tip)
        
        var total = bill+tip
        
        var currentValue = Int(memberSlider.value)
        memberCountLabel.text = "\(currentValue)"
        
        cppLabel.text = String(format: "$%.2f", total/Double(currentValue))
    }
    @IBAction func memberCountChanged(_ sender: Any) {
        tipCalculate(sender)
        
    }
}

