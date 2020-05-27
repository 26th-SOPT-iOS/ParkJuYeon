//
//  ViewController.swift
//  hw2_Login
//
//  Created by 박주연 on 29/04/2020.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit
import Foundation

class LoginViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var pwLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addKeyboardObserver()
        emailTextField.delegate = self
        pwTextField.delegate = self
        
        self.emailLabel.layer.cornerRadius = 18
        self.pwLabel.layer.cornerRadius = 18
        
        // 라벨은 masksToBounds를 써줘야지만 round속성이 적용된다...?
        emailLabel.layer.masksToBounds = true
        pwLabel.layer.masksToBounds = true
        
        self.loginBtn.layer.cornerRadius = 18
        
        self.signupBtn.underline()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func doLogin(_ sender: Any) {
        
        guard self.emailTextField.text != nil else { return }
        guard self.pwTextField.text != nil else { return }
        
        
        let dvc = storyboard? .instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        
        
        dvc.modalPresentationStyle = .fullScreen
        
        self.present(dvc, animated: true, completion: {()-> Void in self.navigationController?.popToRootViewController(animated: true)})
        
        
        // 로그인 클릭시 서버 통신
        guard let inputID = emailTextField.text else { return }
        guard let inputPWD = pwTextField.text else { return }
        LoginService.shared.login(id: inputID, pwd: inputPWD) { networkResult in
            switch networkResult {
            case .success(let token):
                guard let token = token as? String else { return }
                UserDefaults.standard.set(token, forKey: "token")
                
                guard let tabbarController = self.storyboard?.instantiateViewController(identifier:
                    "customTabbarController") as? UITabBarController else { return }
                tabbarController.modalPresentationStyle = .fullScreen
                self.present(tabbarController, animated: true, completion: nil)
                
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "로그인 실패", message: message,preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
                
            case .pathErr: print("path")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail")
            }
        }
        
    }
    
    @IBAction func goSignupView(_ sender: Any) {
        
        let dvc = self.storyboard?.instantiateViewController(identifier: "SignupViewController") as! SignupViewController
        
        let navigationController = UINavigationController(rootViewController: dvc)
        
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }
    
    
}

//텍스트 필드에 대한 속성 생성하기
extension LoginViewController: UITextFieldDelegate{
    
}

// 텍스트 필드를 누르면 키보드가 올라가고, 화면의 빈 여백을 누르면 키보드가 내려간다.
extension LoginViewController {
    
    // 옵저버 패턴 활용 TextField 가리는 문제 해결
    private func addKeyboardObserver() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func closeKeyboardObserver(){
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: curve), animations: {
            self.backgroundView.transform = .init(translationX: 0, y: -80)
        })
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: curve), animations: {
            self.backgroundView.transform = .identity
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

// 버튼의 텍스트에 underline 생성
extension UIButton {
    func underline() {
        guard let text = self.titleLabel?.text else { return }
        let attributedString = NSMutableAttributedString(string: text)
        //NSAttributedStringKey.foregroundColor : UIColor.blue
        attributedString.addAttribute(NSAttributedString.Key.underlineColor, value: self.titleColor(for: .normal)!, range: NSRange(location: 0, length: text.count))
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: self.titleColor(for: .normal)!, range: NSRange(location: 0, length: text.count))
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
        self.setAttributedTitle(attributedString, for: .normal)
    }
}

// 라벨에 underline 생성
//extension UILabel {
//    func underline() {
//        if let textString = self.text {
//            let attributedString = NSMutableAttributedString(string: textString)
//            attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length - 1))
//            attributedText = attributedString
//        }
//    }
//}

