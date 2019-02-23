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
    }
    
    func setup(with group: BusyboardsGroup) {
        boardsGroup = group
        headerLabel.text = group.headerName
        descriptionLabel.text = group.groupDescription
        disclosureIndicatorSetup(with: group)
    }
    
    @IBAction func disclosureIndicatorTouchUpInside(sender: UIButton) {
        guard let group = boardsGroup else { return }
        group.isShown = !group.isShown
        groupDidChanged?(group)
        

//        let transl = CGAffineTransform(translationX: sender.center.x, y: sender.center.y);
        let trasf = group.isShown ? CGAffineTransform.identity : CGAffineTransform.init(rotationAngle: .pi / 2)
        UIView.animate(withDuration: 0.3, animations: {
            sender.transform = trasf
        }) { (complete) in
            self.disclosureIndicatorSetup(with: group)
        }
    }
    
    func disclosureIndicatorSetup(with group:BusyboardsGroup) {
//        var imageName = "triangle_arrow_down"
        var tintColor = UIColor.darkGrayBlue
        if group.isShown == true {
//            imageName = "triangle_arrow_up"
            tintColor = UIColor.coolPurpleRed
        }
//        disclosureIndicator.setImage(UIImage(named: imageName), for: .normal)
        disclosureIndicator.imageView?.tintColor = tintColor
        
    }
    
    
}
