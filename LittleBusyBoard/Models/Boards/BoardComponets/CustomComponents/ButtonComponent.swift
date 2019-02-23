//
//  ButtonComponent.swift
//  LittleBusyboard
//
//  Created by Viktoria Rudkovskaya on 27/01/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

class ButtonComponent: BoardComponent {
    
    var textureName: String = "button_red"
    
    private enum CodingKeys: String, CodingKey {
        case textureName
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        textureName = try container.decode(String.self, forKey: .textureName)
        try super.init(from: decoder)
    }
    
    override func view() -> UIView {
        
        let size = CGSize(width: 200, height: 200)
        let button = self.button(size: size, textureName: textureName, text: "")
        
        return button
    }
        
    var availableTextures: [String] {
        get {
            guard let json = Utils.unarchiveJSON(from: "ButtonTextures") else {
                fatalError()
            }
            guard let bgTextures = try? JSONDecoder().decode([String].self, from: json) else {
                return ["button_red"]
            }
            return bgTextures
        }
    }
    
    func randomSingleButton() -> UIButton {
        let button = UIButton()
        button.frame.size = CGSize(width: 200, height: 200)
        let textureName = availableTextures[Utils.random(availableTextures.count)]
        
        let bgImage = UIImage(named: textureName)
        button.setBackgroundImage(bgImage, for: .normal)
        
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        return button
    }
    
    func button(size: CGSize, textureName: String, text: String) -> UIButton {
        let button = UIButton()
        button.frame.size = size
        let bgImage = UIImage(named: textureName)
        button.setBackgroundImage(bgImage, for: .normal)
        button.setTitle(text, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }
    
    @objc func buttonAction() -> Void {
        
        actions?.forEach({ (action) in
            action.perform()
        })
    }
    
}