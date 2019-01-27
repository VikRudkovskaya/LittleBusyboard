//
//  BusyboardTableViewCell.swift
//  LittleBusyBoard
//
//  Created by Viktoria Rudkovskaya on 24/01/2019.
//  Copyright © 2019 Viktoria Rudkovskaya. All rights reserved.
//

import UIKit

class BusyboardTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var boardDescription: UILabel!
    @IBOutlet weak var boardImageView: UIImageView!
    @IBOutlet weak var arrowImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        arrowImageView.tintColor = UIColor.init(red:102 / 255.0, green:125  / 255.0, blue:145 / 255.0, alpha: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(board: Busyboard) -> () {
        name.text = board.name
        boardDescription.text = board.boardDescription
        guard let image = UIImage(named: board.miniatureName) else {
            return
        }
        boardImageView.image = image
    }
    
}
