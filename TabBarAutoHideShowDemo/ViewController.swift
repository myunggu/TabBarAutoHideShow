//
//  ViewController.swift
//  TabBarTest
//
//  Created by Myunggu Kim on 24/01/2019.
//  Copyright © 2019 Shinvee Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var bodyScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func hideTabBar() {
        var frame = self.tabBarController?.tabBar.frame
        frame?.origin.y = UIScreen.main.bounds.size.height
        UIView.animate(withDuration: 0.5, animations: {
            self.tabBarController?.tabBar.frame = frame!
        })
    }
    
    
    func showTabBar() {
        var frame = self.tabBarController?.tabBar.frame
        let height = (frame?.size.height)!
        frame?.origin.y = UIScreen.main.bounds.size.height - height
        UIView.animate(withDuration: 0.5, animations: {
            self.tabBarController?.tabBar.frame = frame!
        })
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if scrollView == self.bodyScrollView {
            if velocity.y < 0 {
                showTabBar()
            } else if velocity.y > 0 {
                hideTabBar()
            }
        }
    }
}
