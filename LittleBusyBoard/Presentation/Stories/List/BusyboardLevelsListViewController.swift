//
//  BusyBoardsListViewController.swift
//  LittleBusyBoard
//
//  Created by Viktoria Rudkovskaya on 24/01/2019.
//  Copyright © 2019 VR/RN. All rights reserved.
//

import UIKit
import AVFoundation

class BusyboardLevelsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var separatorView: UIView!
    
    var funImageView: UIImageView?
    
    var busyboardService: BusyboardService!
    
    var isSoundPlaying: Bool = false
    
    convenience init(service: BusyboardService) {
        
        self.init(nibName: nil, bundle: nil)
        self.busyboardService = service

        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overCurrentContext
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCells()

        busyboardService.busyboards{ boardsGroups in
            self.tableView.reloadData()
            self.setupFunImageView()
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        funImageView?.center = CGPoint(x: self.view.center.x, y: 90)
    }
    
    private func setupFunImageView() {
        guard let groups = busyboardService.busyboardsGroups else {
            return
        }
        let group = groups[Utils.random(groups.count)]
        funImageView = UIImageView()
        funImageView?.frame.size = CGSize(width: 32, height: 32)
        funImageView?.image = UIImage(named: group.footerImageName)
        funImageView?.alpha = 0
        funImageView?.isHidden = true
        funImageView?.contentMode = .scaleAspectFit
        self.view.addSubview(funImageView!)
    }
    
    private func registerCells() {
        
        let nib = UINib(nibName: "BusyboardTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: BusyboardTableViewCell.reuseID())
    }
    
    // MARK: Actions
    @IBAction func infoTouchUpInside(sender: UIButton) {
        let infoPopUp = InfoPopUpViewController()
        self.present(infoPopUp, animated: true, completion: nil)
    }
    
    @IBAction func settingsTouchUpInside(sender: UIButton) {
    
    }

}

extension BusyboardLevelsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let group = busyboardService.busyboardsGroups?[section]
        if let shown = group?.isShown, shown == false {
            return 0
        }
        return busyboardService.busyboardsGroups?[section].boards?.count ?? 0
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return busyboardService.busyboardsGroups?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BusyboardTableViewCell.reuseID(), for: indexPath) as! BusyboardTableViewCell

        let board = busyboardService.busyboardsGroups![indexPath.section].boards![indexPath.row]
        cell.setup(board: board)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return busyboardService.busyboardsGroups![section].headerHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view: BusyboardsGroupHeader = .fromNib()
        let group = busyboardService.busyboardsGroups![section]
        
        view.groupDidChanged = { group in
            guard let boards = group.boards else {
                return
            }
            let indecies = (0...boards.count - 1).map({ (index) -> IndexPath in
                return IndexPath(row: index, section: section)
            })
            if group.isShown {
                tableView.insertRows(at: indecies, with: .fade)
            } else {
                tableView.deleteRows(at: indecies, with: .fade)
            }
        }
            
        view.setup(with: group)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let groups = busyboardService.busyboardsGroups else {
            return nil
        }
        let group = groups[section]
        let view: BusyboardsGroupFooter = .fromNib()
        view.centralImageView.image = UIImage(named: group.footerImageName)
        return view
    }
    
}

extension BusyboardLevelsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let groups = busyboardService.busyboardsGroups, let board = groups[indexPath.section].boards?[indexPath.row] else {
            return
        }
        let vc = BusyboardLevelViewController(board: board)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension BusyboardLevelsListViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        if offsetY < 0 {
            separatorView.isHidden = false
        } else {
            separatorView.isHidden = true
        }
        
        guard let funImageHeight = funImageView?.frame.size.height else {
            return
        }
        let height = -1 * funImageHeight - 16
        if offsetY < height && self.funImageView?.isHidden == true {
            funImageView?.isHidden = false
            UIView.animate(withDuration: 1) {
                self.funImageView?.alpha = 0.85
            }
        }
        
        if offsetY >= height && self.funImageView?.isHidden == false  {
            
            UIView.animate(withDuration: 1, animations: {
                self.funImageView?.alpha = 0
            }, completion: { (value: Bool) in
                self.funImageView?.isHidden = true
            })
        }
        
        if offsetY < -150 && isSoundPlaying == false {
            AudioServicesPlaySystemSound(1330)
            isSoundPlaying = true
        }
    }
}
