//
//  LogoutViewController.swift
//  iOS_Login
//
//  Created by 박주연 on 23/04/2020.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class LogoutViewController: UIViewController {
    
    @IBOutlet weak var firstID: UITextField!
    @IBOutlet weak var firstPW: UITextField!
    @IBOutlet weak var logoutBtn: UIButton!
    
    var idText: String?
    var pwText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setText()
        
        
    }
    func setText(){
        
        guard let idText = self.idText else {
            return}
        guard let pwText = self.pwText else {
            return}
        
        firstID.text = idText
        firstPW.text = pwText
        
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        
        self.dismiss(animated: true,completion: nil)
         
    }
}
