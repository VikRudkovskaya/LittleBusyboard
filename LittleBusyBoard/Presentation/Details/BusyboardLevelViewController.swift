//
//  BusyboardViewController.swift
//  LittleBusyBoard
//
//  Created by Viktoria Rudkovskaya on 24/01/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

import AVFoundation

class BusyboardLevelViewController: UIViewController {
    
    var board: Busyboard!
    
    @IBOutlet weak var background: UIImageView!
    
    convenience init(board: Busyboard) {
        
        self.init(nibName: nil, bundle: nil)
        self.board = board
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func buttonTouchUpInside(_ sender: UIButton) {
        AudioServicesPlaySystemSound(4095)
        AudioServicesPlaySystemSound(1320)
    }
    
}
