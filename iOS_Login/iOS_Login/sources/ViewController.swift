//
//  ViewController.swift
//  iOS_Login
//
//  Created by 박주연 on 18/04/2020.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setCornerRadius(){
        self.layer.cornerRadius = 8
        
    }
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var signup: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        login.setCornerRadius()
        signup.setCornerRadius()
        
        
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        
        let dvc = storyboard?.instantiateViewController(identifier: "LogoutViewController") as! LogoutViewController
        
        dvc.idText = idTextField.text
        dvc.pwText = pwTextField.text
        
        
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: true)
    }
    
    
    @IBAction func signupBtn(_ sender: Any) {
        
        let dvc = storyboard? .instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        navigationController?.pushViewController(dvc, animated: true)
        
    }
}

