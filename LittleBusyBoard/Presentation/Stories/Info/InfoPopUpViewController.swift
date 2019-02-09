//
//  InfoPopUpViewController.swift
//  LittleBusyboard
//
//  Created by Viktoria Rudkovskaya on 27/01/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

class InfoPopUpViewController: UIViewController {
    
    /**
     * Использование такого типа верстки оправдано только в pet-projects
     */
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
        
        modalTransitionStyle = .crossDissolve
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        containerView.layer.cornerRadius = 7
    }
    
    @IBAction func closeTouchUpInside(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}

extension InfoPopUpViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < -200 {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
