//
//  ViewController.swift
//  CC
//
//  Created by Glny Gl on 20.07.2018.
//  Copyright © 2018 Glny Gl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lbl: UILabel!
    
    var instantValue: Double = 0
    var previousValue: Double = 0
    var operation: Int = 0
    var result: Double = 0
    
    // Buttons from 0 to 9
    // 0 tagged 1, 1 tagged 2 ... etc
    @IBAction func numbers(_ sender: Any) {
        if(lbl.text == "0"){
            lbl.text = String ((sender as AnyObject).tag-1)
            instantValue = Double(lbl.text!)!
        }
        else if(lbl.text == "/" || lbl.text == "x" || lbl.text == "-" || lbl.text == "+"){
            lbl.text = String ((sender as AnyObject).tag-1)
            instantValue = Double(lbl.text!)!
        }
        else {
            lbl.text = lbl.text! + String ((sender as AnyObject).tag-1)
            instantValue = Double(lbl.text!)!
        }
    }
    
    // Button multiplied by 100
    @IBAction func btn00(_ sender: Any) {
        if(lbl.text == "0"){
            lbl.text = "100"
            instantValue = Double(lbl.text!)!
        }
        else if(lbl.text == "/" || lbl.text == "x" || lbl.text == "-" || lbl.text == "+"){
            lbl.text = "100"
            instantValue = Double(lbl.text!)!
        }
        else {
            lbl.text = lbl.text! + "00"
            instantValue = Double(lbl.text!)!
        }
    }
    
    // Button multiplied by 1000
    @IBAction func btn000(_ sender: Any) {
        if(lbl.text == "0"){
            lbl.text = "1000"
            instantValue = Double(lbl.text!)!
        }
        else if(lbl.text == "/" || lbl.text == "x" || lbl.text == "-" || lbl.text == "+"){
            lbl.text = "1000"
            instantValue = Double(lbl.text!)!
        }
        else {
            lbl.text = lbl.text! + "000"
            instantValue = Double(lbl.text!)!
        }
    }
    
    @IBAction func operators(_ sender: Any) {
        
        // Division button tagged 11
        if((sender as AnyObject).tag == 11){
            lbl.text = "/"
            if(previousValue == 0) {
                previousValue = instantValue
            }
            else {
                previousValue = previousValue / instantValue
            }
        }
            
        // Multiplication button tagged 12
        else if((sender as AnyObject).tag == 12){
            lbl.text = "x"
            if(previousValue == 0) {
                previousValue = instantValue
            }
            else {
                previousValue = previousValue * instantValue
            }
        }
            
        // Subtraction button tagged 13
        else if((sender as AnyObject).tag == 13){
            lbl.text = "-"
            if(previousValue == 0) {
                previousValue = instantValue
            }
            else {
                previousValue = previousValue - instantValue
            }
        }
            
        // Addition button tagged 14
        else if((sender as AnyObject).tag == 14){
            lbl.text = "+"
            if(previousValue == 0) {
                previousValue = instantValue
            }
            else {
                previousValue = previousValue + instantValue
            }
        }
        operation = (sender as AnyObject).tag
    }
    
    @IBAction func options(_ sender: Any) {
        
        // Clear button tagged 15
        if((sender as AnyObject).tag == 15){
           lbl.text = "0"
           previousValue = 0
           instantValue = 0
           result = 0
        }
            
        // Point button tagged 16
        else if((sender as AnyObject).tag == 16){
            lbl.text = "\(Int(instantValue))."
        }
            
        // Delete button tagged 17
        else if((sender as AnyObject).tag == 17){
          lbl.text?.removeLast()
            if(lbl.text?.isEmpty)!{
                lbl.text = "0"
            }
        }
        
        // Result button tagged 18
        else if((sender as AnyObject).tag == 18){
            if(operation == 14){
                result = previousValue + instantValue
                instantValue = result
                previousValue = 0
            }
            if(operation == 13){
                result = previousValue - instantValue
                instantValue = result
                previousValue = 0
            }
            if(operation == 12){
                result = previousValue * instantValue
                instantValue = result
                previousValue = 0
            }
            if(operation == 11){
                result = previousValue / instantValue
                instantValue = result
                previousValue = 0
            }
            lbl.text = "\(result)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

