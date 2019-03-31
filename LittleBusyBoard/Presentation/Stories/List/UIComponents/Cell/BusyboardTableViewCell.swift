//
//  BusyboardTableViewCell.swift
//  LittleBusyBoard
//
//  Created by Viktoria Rudkovskaya on 24/01/2019.
//  Copyright © 2019 Viktoria Rudkovskaya. All rights reserved.
//

import UIKit

class BusyboardTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var boardDescription: UILabel!
    @IBOutlet weak var boardMiniatureImageView: UIImageView!
    @IBOutlet weak var arrowImageView: UIImageView!
    
    static func reuseID() -> String {
        return "BusyboardTableViewCell_ID"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        arrowImageView.tintColor = UIColor.darkGrayBlue
        boardMiniatureImageView.layer.cornerRadius = 25
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
        boardMiniatureImageView.image = image
    }
    
}
