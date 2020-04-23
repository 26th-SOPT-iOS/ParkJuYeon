//
//  LoginViewController.swift
//  iOS_Login
//
//  Created by 박주연 on 23/04/2020.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

//extension UINavigationController {
//
//func popViewController(animated: Bool = true, completion: @escaping () -> Void) {
//    CATransaction.begin()
//    CATransaction.setCompletionBlock(completion)
//    popViewController(animated: animated)
//    CATransaction.commit()
//    
//}

class LoginViewController: UIViewController {
    
    @IBOutlet weak var createID: UITextField!
    @IBOutlet weak var createPW: UITextField!
    @IBOutlet weak var createBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func signupButton(_ sender: Any) {
        let dvc = storyboard? .instantiateViewController(withIdentifier: "LogoutViewController") as! LogoutViewController
        
        dvc.idText = createID.text
        dvc.pwText = createPW.text
        
        dvc.modalPresentationStyle = .fullScreen
        
        self.present(dvc, animated: true, completion: {()-> Void in self.navigationController?.popToRootViewController(animated: true)})
        
    }
    
}
