//
//  RotateAction.swift
//  LittleBusyboard
//
//  Created by Viktoria Rudkovskaya on 01/04/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

class RotateAction: ComponentAction {
    
    weak var affectedBoardComponent: BoardComponent!
    var affectedBoardComponentID: Int?
    
    var duration: TimeInterval?
    
    override func perform() {
        super.perform()
        
        UIView.animate(withDuration: duration ?? 0.3, delay: 0, options: [], animations: {
            
            if self.affectedBoardComponent.view().transform == CGAffineTransform.identity {
                self.affectedBoardComponent.view().transform = CGAffineTransform.init(rotationAngle: .pi)
            } else {
                self.affectedBoardComponent.view().transform = CGAffineTransform.identity
            }
            
        }, completion: nil)
    }
    
    private enum CodingKeys: String, CodingKey {
        case affectedBoardComponentID
        case duration
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.affectedBoardComponentID = try container.decode(Int.self, forKey: .affectedBoardComponentID)
        self.duration = try container.decode(TimeInterval.self, forKey: .duration)
        try super.init(from: decoder)
    }
    
}

