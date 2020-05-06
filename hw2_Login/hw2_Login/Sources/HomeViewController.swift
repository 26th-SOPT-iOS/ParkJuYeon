//
//  HomeViewController.swift
//  hw2_Login
//
//  Created by 박주연 on 02/05/2020.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var ImgView: UIImageView!

    @IBOutlet weak var ImgViewHeightLayout: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var contentView: UIView!
    
//    var ImgViewHeightLayoutConstant: CGFloat!
    
    var headerImgHeight: CGFloat = 210
    var minHeaderImgHeight: CGFloat = 108
    
     override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.scrollView.delegate = self
//        self.ImgViewHeightLayoutConstant = self.ImgViewHeightLayout.constant

        scrollView.delegate = self
            scrollView.contentInsetAdjustmentBehavior = .never
        
    }
//  func preferredStatusBarStyle() -> UIStatusBarStyle {
//    return .lightContent
//     }
}
extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0.0 {
            // Scrolling down: Scale
            ImgViewHeightLayout.constant = headerImgHeight - scrollView.contentOffset.y
        } else {
            // Scrolling up: Parallax
            var height = headerImgHeight - scrollView.contentOffset.y
            height = height > minHeaderImgHeight ? height : minHeaderImgHeight
            ImgViewHeightLayout.constant = height
        }
   
}

}
























//   var imgViewConstraintConstant: CGFloat!
//
//        override func viewDidLoad() {
//            super.viewDidLoad()
//
//          scrollView.delegate = self
//            self.imgViewConstraintConstant = self.ImgViewHeightLayout.constant
            
        
        
//        func scrollViewDidScroll(_ scrollView: UIScrollView) {
//            let stretchedHeight = -scrollView.contentOffset.y
//
//            if stretchedHeight + self.imgViewConstraintConstant > 60 {
//                self.ImgViewHeightLayout.constant = self.imgViewConstraintConstant + stretchedHeight
//            }
//
//            else{
//                self.ImgViewHeightLayout.constant = 60
//            }
//
//            print(stretchedHeight)
//        }
//
//    }



//extension HomeViewController: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let stretchedHeight = -scrollView.contentOffset.y
//
//        if stretchedHeight + self.imgViewConstraintConstant > 88 {
//                self.ImgViewHeightLayout.constant = self.imgViewConstraintConstant + stretchedHeight
//
//        }
//        else {
//            self.ImgViewHeightLayout.constant = 88
//        }
//    }
//}


