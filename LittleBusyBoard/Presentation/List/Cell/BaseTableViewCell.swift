//
//  BaseTableViewCell.swift
//  LittleBusyboard
//
//  Created by Viktoria Rudkovskaya on 26/01/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    static func reuseID() -> String {
        var className = String(describing: BaseTableViewCell.self)
        className.append("_reuse_id")
        return className
    }

}
