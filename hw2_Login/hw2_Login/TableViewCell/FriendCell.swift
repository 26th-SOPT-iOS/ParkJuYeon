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

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendLabel: UILabel!
    
    var imageName: String? {
        didSet {
            if let imageName = imageName {
                guard let image = UIImage(named: imageName) else { return }
                profileImageView.image = image
            }
        }
    }
    
    var name: String? {
        didSet {
            if let name = name {
                friendName.text = name
            }
        }
    }
    
    var message: String? {
        didSet {
            if let message = message {
                friendLabel.text = message
            }
        }
    }
    
    override func awakeFromNib() {
    super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
