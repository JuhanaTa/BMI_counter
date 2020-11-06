//
//  ViewController.swift
//  BMI_calculator
//
//  Created by iosdev on 3.11.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import UIKit
import os.log

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate, UITextFieldDelegate {
    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var historyButton: UIBarButtonItem!
    @IBOutlet weak var bmiCategoryLabel: UILabel!
    
    
    
    var person1 = Person(name: "default", age: 1, height: 100, weight: 30, profession: ["tester"])
    var bmi: Double = 0
    var weight: Double = 0
    var height: Double = 0
    var personsHistory = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        //txt field user input through delegate
        text.delegate = self
        
        changeCalculateState()
        
        //text.inputView = pickerView
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 120
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(component == 0){
            return "\(row+100)"
        } else {
            return "\(row+30)"
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow: Int, inComponent: Int) {
        if(inComponent == 0){
            print("height is \(didSelectRow + 100)")
            height = Double(didSelectRow + 100)
            person1?.changeHeight(newHeight: Double(didSelectRow + 100))
        }
        if (inComponent == 1) {
            print("weight is \(didSelectRow + 30)")
            weight = Double(didSelectRow+30)
            person1?.changeWeight(newWeight: Double(didSelectRow + 30))
            
        }

    }
    @IBAction func calculateAction(_ sender: Any) {
        //calculates bmi and shows it
        bmi = person1?.calculateOnlyBmi() ?? 0
        print("\(bmi)")
        bmiLabel.text = "BMI is: \((bmi * 10).rounded()/10)"
        

        if (bmi >= 25 && bmi < 30) {
         self.view.backgroundColor = UIColor.red
            bmiCategoryLabel.text = "Overweight"
        }
        else if (bmi < 18.5) {
         self.view.backgroundColor = UIColor.red
            bmiCategoryLabel.text = "Underweight"
        }
        else if (bmi >= 30) {
         self.view.backgroundColor = UIColor.red
            bmiCategoryLabel.text = "Obesity"
        }
        else {
        self.view.backgroundColor = UIColor.green
            bmiCategoryLabel.text = "normal weight"
        }

        //new person to history array. Array passed with prepare segue function to tableview
        let newPerson = Person(name: text.text ?? "default", age: 0, height: height, weight: weight, profession: ["tester"])
        personsHistory.append(newPerson!)
    }
    
    var person: Person?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.destination is OnePersonTableViewController
        {
            let vc = segue.destination as? OnePersonTableViewController
            
            vc?.history = personsHistory
        }
        
        guard let button = sender as? UIBarButtonItem, button === historyButton else {
            os_log("history button was not pressed", log: OSLog.default, type: .debug )
            return
        }
        
        //let bmi = person1?.calculateOnlyBmi() ?? 0
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacters = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM"
        let allowedCharset = CharacterSet(charactersIn: allowedCharacters)
        let typedCharacterSet = CharacterSet(charactersIn: string)
        return allowedCharset.isSuperset(of: typedCharacterSet)
           
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = text.text, text.isEmpty {
            let alertController = UIAlertController(title: "Alert", message: "Name must be at least 1 character long", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction) in
                print("You've pressed cancel");
            })
            self.present(alertController, animated: true)
            print("empty textfield")
        } else {
            text.resignFirstResponder()
            return true
        }
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        changeCalculateState()
    }
    
    private func changeCalculateState() {
        let name = text.text ?? ""
        calculateButton.isEnabled = !name.isEmpty
    }
    
}




