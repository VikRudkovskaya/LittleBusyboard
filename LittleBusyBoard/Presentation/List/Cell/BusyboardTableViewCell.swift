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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(board: Busyboard) -> () {
        name.text = board.name
        boardDescription.text = board.boardDescription
    }
    
}
