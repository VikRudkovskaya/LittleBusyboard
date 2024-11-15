//
//  BusyboardsGroupHeader.swift
//  LittleBusyboard
//
//  Created by Viktoria Rudkovskaya on 10/02/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

class BusyboardsGroupHeader: UIView {
    
    var groupDidChanged: ((BusyboardsGroup) -> ())?
    var boardsGroup: BusyboardsGroup?
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var backgorundImageView: UIImageView!
    @IBOutlet weak var disclosureIndicator: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        switch Utils.language() {
        case .EN:
            headerLabel.font = UIFont(name: "Elianto-Regular", size: 17)
            descriptionLabel.font = UIFont(name: "Menlo-Regular", size: 13)
            break
        case .RU:
            headerLabel.font = UIFont(name: "Menlo-Regular", size: 15)
            descriptionLabel.font = UIFont(name: "Menlo-Regular", size: 13)
        default:
            break
        }
    }
    
    func setup(with group: BusyboardsGroup) {
        boardsGroup = group
        headerLabel.text = group.headerName
        descriptionLabel.text = group.groupDescription
        disclosureIndicatorSetup(with: group)
        backgorundImageView.image = UIImage(named: group.headerBgName ?? "")
    }
    
    @IBAction func disclosureIndicatorTouchUpInside(sender: UIButton) {
        guard let group = boardsGroup else { return }
        group.isShown = !group.isShown
        groupDidChanged?(group)
        
        let trasf = group.isShown ? CGAffineTransform.identity : CGAffineTransform.init(rotationAngle: .pi)
        UIView.animate(withDuration: 0.3, animations: {
            sender.imageView?.transform = trasf
        }) { (complete) in
            self.disclosureIndicatorSetup(with: group)
        }
    }
    
    func disclosureIndicatorSetup(with group:BusyboardsGroup) {
        var tintColor = UIColor.darkGrayBlue
        var transf = CGAffineTransform.init(rotationAngle: .pi)
        if group.isShown {
            tintColor = UIColor.coolPurpleRed
            transf = CGAffineTransform.identity
        }
        disclosureIndicator.imageView?.tintColor = tintColor
        disclosureIndicator.imageView?.transform = transf
        
    }
    
    
}
