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
    
    var uiComponents: [UIView] = []
    
    convenience init(board: Busyboard) {
        
        self.init(nibName: nil, bundle: nil)
        self.board = board
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let bgFileName = board.background.fileName {
            background.image = UIImage(named: bgFileName)
        }
        
        guard let components = board.boardComponents else {
            return
        }
        for component in components {
            let view = component.view()
            self.view.addSubview(view)
            uiComponents.append(view)
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        for uiComponent in uiComponents {
            uiComponent.center = self.view.center
        }
    }
    
    @IBAction func backTpuchUpInside(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    

        
}
