//
//  ButtonConfigurator.swift
//  LittleBusyboard
//
//  Created by Viktoria Rudkovskaya on 27/01/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit


class ButtonConfigurator: NSObject {
    
    var avaliableBackgrouns: [Background]? {
        get {
            guard let json = Utils.unarchiveJSON(from: "Backgrounds") else {
                fatalError()
            }
            
            let backgrounds = try? JSONDecoder().decode([Background].self, from: json)
            return backgrounds
        }
    }
    
    func randomSingleButton() -> UIButton {
        let button = UIButton()
        
        
        return button
    }
}
