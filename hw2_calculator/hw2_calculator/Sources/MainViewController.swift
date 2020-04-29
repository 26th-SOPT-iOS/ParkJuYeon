//
//  ViewController.swift
//  hw2_calculator
//
//  Created by 박주연 on 28/04/2020.
//  Copyright © 2020 박주연. All rights reserved.

//userIsInTheMiddleOfTyping을 사용하지 않고 구현해보기
//var userIsInTheMiddleOfTyping : Bool = false


import UIKit


class MainViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    @IBOutlet var Button: [UIButton]!
    
    var displayText: String? = nil
    
    var Operator: String? = nil
    
    var beforeNum = Double()
    var nextNum = Double()
    
    
    func RoundBtn(){
        
        for btn in Button{
            
            btn.layer.cornerRadius = 39
            btn.layer.masksToBounds = true
        }
   
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        display.text = "0"
        RoundBtn()
        
    }
    
    @IBAction func clickBtn(clickBtn: UIButton) {
        
        if displayText == nil {
            displayText = (clickBtn.titleLabel?.text)!
            
        }else {
            displayText? += (clickBtn.titleLabel?.text)!
        }
        
        display.text = displayText
    }
    
    
    @IBAction func clear(clearBtn: UIButton) {
        
        display.text = "0"
        displayText = nil
        beforeNum = 0
        nextNum = 0
        Operator = nil
        
    }
    
    
    @IBAction func operation(operationBtn: UIButton) {
        
        if displayText != nil {
            Operation()
            Operator = operationBtn.titleLabel!.text!
            displayText = nil
            
            if operationBtn.titleLabel!.text! == "=" {
                display.text = String(beforeNum)
            }
        }else {
            Operator = operationBtn.titleLabel!.text!
        }
    }
    
    
    private func Operation() {
        if Operator == nil {
            
            beforeNum = Double(displayText!)!
            //print("연산자 첫 번째 클릭")
        }
        else {
            
            nextNum = Double(displayText!)!
            
            if Operator == "+" {
                beforeNum += nextNum
            }else if Operator == "-" {
                beforeNum -= nextNum
            }else if Operator == "x" {
                beforeNum *= nextNum
                //print("곱하기 나오니?")
            }else if Operator == "÷" {
                beforeNum /= nextNum
            }
            display.text = String(beforeNum)
        }
    }
    
    }

