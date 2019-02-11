//
//  BusyboardsGroupHeader.swift
//  LittleBusyboard
//
//  Created by Viktoria Rudkovskaya on 10/02/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

class BusyboardsGroupHeader: UIView {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var backgorundImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(with group: BusyboardsGroup) {
        headerLabel.text = group.headerName
        descriptionLabel.text = group.groupDescription
    }
    
    
}
