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
        guard let components = board.boardComponents else {
            return
        }
        
        for component in components {
            var view: UIView?
            switch component {
            case is ButtonComponent:
                let buttonComponent = component as! ButtonComponent
                let button = UIButton()
                
                button.frame.size = CGSize(width: 200, height: 200)
                let bgImage = UIImage(named: buttonComponent.textureName)
                button.setBackgroundImage(bgImage, for: .normal)
                view = button
                
                guard let actions = component.actions else {
                    continue
                }
                for action in actions {
                    switch action {
                    case is PlaySoundAction:
                        button.addTarget(self, action: Selector("playSound:"), for: UIControl.Event.touchUpInside)
                    case is BackgroundChangeAction:
                        self.view.backgroundColor = UIColor.white
                    default:
                        continue
                    }
                }
            default:
                continue
            }
            guard let v = view else {
                return
            }
            self.view.addSubview(v)
            uiComponents.append(v)
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        for uiComponent in uiComponents {
            uiComponent.center = self.view.center
        }
    }
    
    func playSound(soundID: Int) {
        AudioServicesPlaySystemSound(SystemSoundID(soundID))
    }
        
}
