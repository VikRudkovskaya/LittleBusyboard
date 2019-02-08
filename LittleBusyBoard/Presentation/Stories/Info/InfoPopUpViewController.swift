//
//  InfoPopUpViewController.swift
//  LittleBusyboard
//
//  Created by Viktoria Rudkovskaya on 27/01/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

class InfoPopUpViewController: UIViewController {
    @IBOutlet var scrollView: UIScrollView!
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
        
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overCurrentContext
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.delegate = self

    }
    
    @IBAction func closeTouchUpInside(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}

extension InfoPopUpViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < -150 {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
