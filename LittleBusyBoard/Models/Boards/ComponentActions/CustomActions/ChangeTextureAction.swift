//
//  ChangeSelfTextureAction.swift
//  LittleBusyboard
//
//  Created by Viktoria Rudkovskaya on 14/04/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

class ChangeTextureAction: ComponentAction {
    
    weak var affectedBoardComponent: BoardComponent!
    var affectedBoardComponentID: Int?
    
    override func perform() {
        super.perform()
        
        let button = affectedBoardComponent.view() as? UIButton
        button?.alpha = 0.6
        if  button != nil {
            let buttonComponent = self.affectedBoardComponent as! ButtonComponent
            var index = buttonComponent.currentTextureIndex
            if index < (buttonComponent.textureNames?.count)! - 1 {
                index = index + 1
            } else {
                index = 0
            }
            buttonComponent.currentTextureIndex = index
            let newTextureName = buttonComponent.textureNames?[index]
            button?.setBackgroundImage(UIImage(named: newTextureName!), for: .normal)
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
            button?.alpha = 1
        }, completion: nil)
    }
    
    private enum CodingKeys: String, CodingKey {
        case affectedBoardComponentID
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.affectedBoardComponentID = try container.decode(Int.self, forKey: .affectedBoardComponentID)
        try super.init(from: decoder)
    }
}
