//
//  ViewController.swift
//  iOS_Seminar1_hw1
//
//  Created by 박주연 on 18/04/2020.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func purpleBtn(_ sender: Any) {
        
        guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "purpleViewController") as? purpleViewController else {return}
    }
    
    @IBAction func redBtn(_ sender: Any) {
        
        guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "redViewController") as? redViewController else {return}
    }
    
}

