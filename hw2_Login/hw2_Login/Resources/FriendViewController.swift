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
    @IBOutlet weak var settingImg: UIImageView!
    
    private var friendInformations: [FriendInformation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setfriendInformations()
        
        friendTableView.dataSource = self
        friendTableView.delegate = self
        
        self.friendTableView.separatorStyle = UITableViewCell.SeparatorStyle.none

       
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
    
        private func setfriendInformations(){
        let friend1 = FriendInformation(friend: .cat, name: "냥냥이", title: "애옹애오애옹애옹")
        let friend2 = FriendInformation(friend: .dog, name: "강아지", title: "왈왈!!멍멍ㅇ머머!왋멍!")
        let friend3 = FriendInformation(friend: .cat, name: "냥냥이", title: "애옹애오애옹애옹")
        let friend4 = FriendInformation(friend: .dog, name: "강아지", title: "왈왈!!멍멍ㅇ머머!왋멍!")
        let friend5 = FriendInformation(friend: .cat, name: "냥냥이", title: "애옹애오애옹애옹")
        let friend6 = FriendInformation(friend: .dog, name: "강아지", title: "왈왈!!멍멍ㅇ머머!왋멍!")
        let friend7 = FriendInformation(friend: .cat, name: "냥냥이", title: "애옹애오애옹애옹")
        let friend8 = FriendInformation(friend: .dog, name: "강아지", title: "왈왈!!멍멍ㅇ머머!왋멍!")
        let friend9 = FriendInformation(friend: .cat, name: "냥냥이", title: "애옹애오애옹애옹")
        let friend10 = FriendInformation(friend: .dog, name: "강아지", title: "왈왈!!멍멍ㅇ머머!왋멍!")
        let friend11 = FriendInformation(friend: .cat, name: "냥냥이", title: "애옹애오애옹애옹")
        let friend12 = FriendInformation(friend: .dog, name: "강아지", title: "왈왈!!멍멍ㅇ머머!왋멍!")
        let friend13 = FriendInformation(friend: .cat, name: "냥냥이", title: "애옹애오애옹애옹")
        let friend14 = FriendInformation(friend: .dog, name: "강아지", title: "왈왈!!멍멍ㅇ머머!왋멍!")
        let friend15 = FriendInformation(friend: .cat, name: "냥냥이", title: "애옹애오애옹애옹")
        let friend16 = FriendInformation(friend: .dog, name: "강아지", title: "왈왈!!멍멍ㅇ머머!왋멍!")
        let friend17 = FriendInformation(friend: .cat, name: "냥냥이", title: "애옹애오애옹애옹")
        let friend18 = FriendInformation(friend: .dog, name: "강아지", title: "왈왈!!멍멍ㅇ머머!왋멍!")
        let friend19 = FriendInformation(friend: .cat, name: "냥냥이", title: "애옹애오애옹애옹")
        let friend20 = FriendInformation(friend: .dog, name: "강아지", title: "왈왈!!멍멍ㅇ머머!왋멍!")
        
        friendInformations = [friend1, friend2, friend3, friend4, friend5, friend6, friend7, friend8, friend9, friend10, friend11, friend12, friend13, friend14, friend15, friend16, friend17, friend18, friend19, friend20]
        
    }
    
    
}
extension FriendViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendInformations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let FriendCell = tableView.dequeueReusableCell(withIdentifier: FriendCell.identifier, for:
            indexPath) as? FriendCell else { return UITableViewCell() }
        FriendCell.setFriendInformation(friendImgName:
            friendInformations[indexPath.row].friend.getImageName(),
                                        name: friendInformations[indexPath.row].name,
                                        title: friendInformations[indexPath.row].title)
        return FriendCell
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        
        if(editingStyle == .delete){
            friendInformations.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
            
        }
    }
    
    
}

extension FriendViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 62 }
}
