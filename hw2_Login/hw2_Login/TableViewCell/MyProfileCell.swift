//
//  MyProfileCell.swift
//  hw2_Login
//
//  Created by 박주연 on 2020/06/15.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

protocol ButtonDelegate {
    func onClickCellButton(in index: Int)
}

class MyProfileCell: UITableViewCell {
    
    static let identifier = "MyProfileCell"
    
    @IBOutlet weak var myProfileBtn: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    var delegate: ButtonDelegate?
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func setProfile(_ sender: Any) {
        delegate?.onClickCellButton(in: indexPath!.row)
    }
    
}
