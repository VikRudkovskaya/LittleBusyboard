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
    
    @IBOutlet weak var infoTitle: UILabel!
    @IBOutlet weak var infoGroup1: UILabel!
    @IBOutlet weak var infoGroup2: UILabel!
    @IBOutlet weak var infoGroup3: UILabel!
    @IBOutlet weak var infoGroup4: UILabel!
    @IBOutlet weak var infoGroup5: UILabel!
    @IBOutlet weak var closeInfo: UILabel!
    
    @IBOutlet weak var backImageView: UIImageView!
    
    @IBOutlet weak var cloudImageView: UIImageView!
    @IBOutlet weak var cloud2ImageView: UIImageView!
    @IBOutlet weak var cloud3ImageView: UIImageView!
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
        
        modalTransitionStyle = .crossDissolve
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        containerView.layer.cornerRadius = 16
        
        backImageView.tintColor = UIColor.coolPurpleRed
        
        infoTitle.text = NSLocalizedString("Info title", comment: "")
        infoGroup1.text = NSLocalizedString("Testing", comment: "")
        infoGroup2.text = NSLocalizedString("Mom and dad attantion", comment: "")
        infoGroup3.text = NSLocalizedString("3D toys exchange", comment: "")
        infoGroup4.text = NSLocalizedString("Age", comment: "")
        infoGroup5.text = NSLocalizedString("Safe", comment: "")
        closeInfo.text = NSLocalizedString("Select board action", comment: "")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        cloudsAnimate()

    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func cloudsAnimate() {
        UIView.animate(withDuration: 10, animations: {
            self.cloudImageView.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width - self.cloudImageView.bounds.size.width, y: 0)
            self.cloud2ImageView.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width + self.cloud2ImageView.bounds.size.width, y: 0)
            self.cloud3ImageView.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width , y: 0)
        }) { (completion) in
            UIView.animate(withDuration: 10, animations: {
                self.cloudImageView.transform = CGAffineTransform.identity
                self.cloud2ImageView.transform = CGAffineTransform.identity
                self.cloud3ImageView.transform = CGAffineTransform.identity
            })
            
            
        }
    }

}

extension InfoPopUpViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < -200 {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
