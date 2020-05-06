//
//  MainViewController.swift
//  hw2_Login
//
//  Created by 박주연 on 30/04/2020.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var imgViewConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var ImgView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var headerImgHeight : CGFloat = 210
    var minHeaderImgHeight: CGFloat = 108
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.contentInsetAdjustmentBehavior = .never
        
    }

}

extension MainViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0.0 {
            imgViewConstraint.constant = headerImgHeight - scrollView.contentOffset.y
        }
        else{
            var height = headerImgHeight - scrollView.contentOffset.y
            height = height > minHeaderImgHeight ? height : minHeaderImgHeight
            imgViewConstraint.constant = height
            
        }
    }
}
