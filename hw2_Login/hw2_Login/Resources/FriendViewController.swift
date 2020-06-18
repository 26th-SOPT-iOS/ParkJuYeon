//
//  FriendViewController.swift
//  hw2_Login
//
//  Created by 박주연 on 2020/05/13.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class FriendViewController: UIViewController {
    
    @IBOutlet weak var friendTableView: UITableView!
    
    private var pickerController = UIImagePickerController()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        friendTableView.dataSource = self
        friendTableView.delegate = self
        
        self.friendTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        pickerController.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
    
        //친구 뷰가 화면에 보이기 직전에 profile data 받아오는 작업
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        lookupProfile()
        
    }
    
    private func lookupProfile() {
        guard let token = UserDefaults.standard.object(forKey: "token") as? String else { return }
        LookupService.shared.lookup(token) { networkResult in
            switch networkResult {
                
            case .success(let profileData):
                guard let profileData = profileData as? UserDetailProfile else { return }
                
                print(profileData.image)
                
                let image = UIImageView()
                
                image.setImage(from: profileData.image) { image in
                    guard let profileCell = self.friendTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? MyProfileCell else { return }
                    DispatchQueue.main.async { profileCell.profileImage = image }
                }
            case .requestErr(let message): print(message)
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("ServerErr")
            case .networkFail:
                print("networkReult")
            }
        }
    }
    
    func showAlert(style: UIAlertController.Style){
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: style)
        
        let deleteAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        let friendAction = UIAlertAction(title: "친구 관리", style: .default, handler: {(alert: UIAlertAction!) -> Void in})
        
        let settingAction = UIAlertAction(title: "전체 설정", style: .default, handler: {(alert: UIAlertAction!) -> Void in})
        
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(friendAction)
        optionMenu.addAction(settingAction)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    @IBAction func settingBtn(_ sender: Any) {
        
        showAlert(style: .actionSheet)
        
    }
  
}

extension FriendViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
           return 2
       }
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       if section == 0 { return 1 }
       else { return 10 }
   }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
        guard let myProfileCell = tableView.dequeueReusableCell(withIdentifier: MyProfileCell.identifier, for:
            indexPath) as? MyProfileCell else { return UITableViewCell() }
            
            myProfileCell.indexPath = indexPath
            myProfileCell.delegate = self
            myProfileCell.selectionStyle = .none
            myProfileCell.name = "연블루"
        return myProfileCell
        }
            else {
                guard let friendCell = tableView.dequeueReusableCell(withIdentifier: FriendCell.identifier) as? FriendCell else { return UITableViewCell() }
                friendCell.selectionStyle = .none
                friendCell.name = "노홍철"
                friendCell.message = "왈왈멍멍ㅁ!!ㅁ얾왊어엉머어"
                return friendCell
            }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        
        if(editingStyle == .delete){
           // friendInformations.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
            
        }
    }

}


extension FriendViewController: ButtonDelegate {
    func onClickCellButton(in index: Int) {
        let alertController = UIAlertController(title: "사진 선택", message: "사진을 선택하세요", preferredStyle: .actionSheet)
        let galleryAction = UIAlertAction(title: "사진앨범", style: .default) { action in
            self.openLibrary()
        }
        let photoAcgtion = UIAlertAction(title: "카메라", style: .default) { action in
            self.openCamera()
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alertController.addAction(galleryAction)
        alertController.addAction(photoAcgtion)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

// Gallery,Camera 접근 코드
extension FriendViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    func openLibrary(){
        pickerController.sourceType = .photoLibrary
        self.present(pickerController, animated: true, completion: nil)
    }
    
    func openCamera(){
        pickerController.sourceType = .camera
        self.present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage, let url = info[UIImagePickerController.InfoKey.imageURL] as? URL {
            guard let token = UserDefaults.standard.object(forKey: "token") as? String else { return }
            UploadService.shared.uploadImage(token, image, url.lastPathComponent) { networkResult in
                switch networkResult {
                    
                case .success(let profileData):
                    guard let profileData = profileData as? [UserProfile] else { return }
                    print(profileData[0].profile)
                case .requestErr(let failMessage):
                    guard let message = failMessage as? String else { return }
                        print(message)
                case .pathErr:
                        print("pathErr")
                case .serverErr:
                        print("serverErr")
                case .networkFail:
                        print("networkFail")
                }
            }
    guard let profileCell = friendTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? MyProfileCell else { return }
    profileCell.profileImage = image }
    dismiss(animated: true, completion: nil) }
}
