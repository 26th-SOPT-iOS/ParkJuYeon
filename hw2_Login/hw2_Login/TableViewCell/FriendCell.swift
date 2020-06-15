//
//  FriendCell.swift
//  hw2_Login
//
//  Created by 박주연 on 2020/05/13.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {
    static let identifier: String = "FriendCell"



    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendLabel: UILabel!
    
    override func awakeFromNib() {
    super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setFriendInformation(imageBtn: String, name: String, title: String){
         
        friendName.text = name
        friendLabel.text = title
    }
    
    @IBAction func imageButton(_ sender: Any) {
    }
    
}
