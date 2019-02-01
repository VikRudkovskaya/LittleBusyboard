//
//  BusyBoardsListViewController.swift
//  LittleBusyBoard
//
//  Created by Viktoria Rudkovskaya on 24/01/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit

class BusyboardLevelsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var busyboardService: BusyboardService!
    
    convenience init(service: BusyboardService) {
        
        self.init(nibName: nil, bundle: nil)
        self.busyboardService = service

        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overCurrentContext
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "BusyboardTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: BusyboardTableViewCell.reuseID())
        
        busyboardService.busyboards{ boards in
            self.tableView.reloadData()
        }
    }

}

extension BusyboardLevelsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return busyboardService.busyboards?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BusyboardTableViewCell.reuseID(), for: indexPath) as! BusyboardTableViewCell

        let board = busyboardService.busyboards![indexPath.row]
        cell.setup(board: board)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}

extension BusyboardLevelsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let boards = busyboardService.busyboards else {
            return
        }
        let board = boards[indexPath.row]
        let vc = BusyboardLevelViewController(board: board)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


