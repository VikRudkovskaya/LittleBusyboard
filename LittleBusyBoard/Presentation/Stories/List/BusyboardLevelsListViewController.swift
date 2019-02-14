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
    
    var funImageView: UIImageView?
    
    var busyboardService: BusyboardService!
    
    convenience init(service: BusyboardService) {
        
        self.init(nibName: nil, bundle: nil)
        self.busyboardService = service

        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overCurrentContext
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFunImageView()
        
        registerCells()

        busyboardService.busyboards{ boardsGroups in
            self.tableView.reloadData()
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        funImageView?.center = CGPoint(x: self.view.center.x, y: 84)
    }
    
    private func setupFunImageView() {
        funImageView = UIImageView()
       
        funImageView?.frame.size = CGSize(width: 32, height: 32)
//        let img1 = UIImage(named: "invader")
//        let imag2 = UIImage(named: "round_robot")
//        funImageView?.animationImages = [img1, imag2] as? [UIImage]
//         funImageView?.startAnimating()
//        funImageView?.animationDuration = 0.1
//        funImageView?.animationRepeatCount = 20
        funImageView?.image = UIImage(named: "round_robot")
 
        funImageView?.isHidden = true
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
        view.setup(with: group)
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
       
        
        if scrollView.contentOffset.y < -32 {

            funImageView?.isHidden = false
    }
        
        if scrollView.contentOffset.y >= -32 {
            self.funImageView?.isHidden = true

        }
        
        
    }
    
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
//        self.funImageView?.removeFromSuperview()
    }
}
