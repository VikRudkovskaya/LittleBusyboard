//
//  ButtonComponent.swift
//  LittleBusyboard
//
//  Created by Viktoria Rudkovskaya on 27/01/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

class ButtonComponent: BoardComponent {
    
    var textureNames: Array<String>?
    
    var currentTextureIndex: Int = 0
    
    private enum CodingKeys: String, CodingKey {
        case textureNames
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        textureNames = try container.decode(Array.self, forKey: .textureNames)
        try super.init(from: decoder)
    }
    
    private var _button: UIButton?
    override func view() -> UIView {
        guard let value = _button else {
            let size = CGSize(width: self.size?.width ?? 240, height: self.size?.height ?? 240)
            let button = self.button(size: size, textureName: textureNames?.first ?? "button_red", text: "")
            
            _button = button
            
            return button
        }
        return value

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
        button.frame.size = CGSize(width: self.size?.width ?? 240, height: self.size?.height ?? 240)
        let textureName = availableTextures[Utils.random(availableTextures.count)]
        
        let bgImage = UIImage(named: textureName)
        button.setBackgroundImage(bgImage, for: .normal)
        
        button.addTarget(self, action: #selector(buttonAction), for: .touchDown)
        
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
