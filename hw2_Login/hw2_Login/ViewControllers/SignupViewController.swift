//
//  SignupViewController.swift
//  hw2_Login
//
//  Created by 박주연 on 30/04/2020.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit


class SignupViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var pwLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var completeBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addKeyboardObserver()
        
        idTextField.delegate = self
        pwTextField.delegate = self
        nameTextField.delegate = self
        emailTextField.delegate = self
        phoneTextField.delegate = self
        
        self.idLabel.layer.cornerRadius = 20
        self.pwLabel.layer.cornerRadius = 20
        self.nameLabel.layer.cornerRadius = 20
        self.emailLabel.layer.cornerRadius = 20
        self.phoneLabel.layer.cornerRadius = 20
        
        idLabel.layer.masksToBounds = true
        pwLabel.layer.masksToBounds = true
        nameLabel.layer.masksToBounds = true
        emailLabel.layer.masksToBounds = true
        phoneLabel.layer.masksToBounds = true
        
        self.completeBtn.layer.cornerRadius = 20
        
        // 네비게이션을 투명하게 하는 방법
        let naviBar = navigationController?.navigationBar
        let naviBarAppearence = UINavigationBarAppearance()
        naviBarAppearence.shadowColor = .none
        naviBar?.scrollEdgeAppearance = naviBarAppearence
       

        self.navigationItem.setHidesBackButton(true, animated:true);
        
        //back 버튼 방법 여러가지!
        //1. 이미지 (이미지가 깨짐...)
        //2. string 타입으로 넣기 (크기가 작음.. 크기 키우는 법을 까먹음 -_-)
        //3. UIButtonItem에서 systemItem 사용하기 (close, pause 등등 있는 back을 못찾겠음)
        
        
        // let button1 = UIBarButtonItem(image: UIImage(named: "BackBtn"), style: .plain, target: self, action: #selector(goBack))
        
        let button1 = UIBarButtonItem(title: "<", style: .plain, target: self, action: #selector(goBack))
        button1.tintColor = UIColor.blue
        
        self.navigationItem.leftBarButtonItem  = button1
    }
    
    @objc func goBack(){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func completedButton(_ sender: Any) {
        
//        guard self.nameTextField.text != nil else {return}
//        guard self.emailTextField.text != nil else { return }
//        guard self.pwTextField.text != nil else { return }
               
        
        let dvc = storyboard? .instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        
        dvc.modalPresentationStyle = .fullScreen
        
        self.present(dvc, animated: true, completion: {()-> Void in self.navigationController?.popToRootViewController(animated: true)})
    }
    
    //네비게이션 라인
       private var shadowImageView: UIImageView?
       override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           
           if shadowImageView == nil {
               shadowImageView = findShadowImage(under: navigationController!.navigationBar)
           }
           shadowImageView?.isHidden = true
       }
       
       override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           
           shadowImageView?.isHidden = false
       }
       
       override func viewDidDisappear(_ animated: Bool) {
           super.viewDidDisappear(animated)
           
       }
       
       private func findShadowImage(under view: UIView) -> UIImageView? {
           if view is UIImageView && view.bounds.size.height <= 1 {
               return (view as! UIImageView)
           }
           
           for subview in view.subviews {
               if let imageView = findShadowImage(under: subview) {
                   return imageView
               }
           }
           return nil
       }
    
    
}

extension SignupViewController: UITextFieldDelegate{
    
}

extension SignupViewController {
    
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
            self.backgroundView.transform = .init(translationX: 0, y: -175)
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





