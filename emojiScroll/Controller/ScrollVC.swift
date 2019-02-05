//
//  ScrollVC.swift
//  emojiScroll
//
//  Created by Ivan Ramirez on 2/5/19.
//  Copyright © 2019 ramcomw. All rights reserved.
//

import UIKit
import AVFoundation

class ScrollVC: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addImage()
        scrollView.delegate = self
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        //UI Ideas
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contecntX = scrollView.contentOffset.x
        
        if contecntX > 0 {
            if contecntX >=  scrollView.frame.size.width * 4 {
                
                self.scrollView.contentOffset = CGPoint(x: scrollView.frame.size.width , y: 0)
//                self.scrollView.backgroundColor = .black
            }
        }
        else if contecntX < 0
        {
            self.scrollView.contentOffset = CGPoint(x: scrollView.frame.size.width * 3 , y: 0)
//            self.scrollView.backgroundColor = .green
        }
    }
    
    
    func addImage() {
        var pictures:[UIImage] = [ ]
        
        pictures.append(UIImage(named: "tongue")!)
        pictures.append(UIImage(named: "cool")!)
        pictures.append(UIImage(named: "happy")!)
        pictures.append(UIImage(named: "smartphone")!)
        pictures.append(UIImage(named: "tongue")!)
        pictures.append(UIImage(named: "cool")!)
        
        self.scrollView.contentSize = CGSize(width: scrollView.frame.size.width * CGFloat(pictures.count), height: scrollView.frame.size.height)
        
        for imageIndex in 0..<pictures.count {
            
            var frame = CGRect()
            frame.origin.x = scrollView.frame.size.width * CGFloat(imageIndex)
            frame.origin.y = 0
            frame.size = scrollView.frame.size
            
            scrollView.showsHorizontalScrollIndicator = false
            let subView = UIImageView(frame: frame)
            subView.image = pictures[imageIndex]
            subView.contentMode = .scaleAspectFit
            self.scrollView.addSubview(subView)
        }
    }
}


