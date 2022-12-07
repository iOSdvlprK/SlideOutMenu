//
//  HomeController.swift
//  SlideOutMenu
//
//  Created by joe on 2022/12/06.
//

import UIKit

class HomeController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .red
        setupNavigationItems()
    }
    
    let menuController = MenuController()
    
    fileprivate let menuWidth: CGFloat = 300
    
    @objc func handleOpen() {
        // initial position of the animation
        menuController.view.frame = CGRect(x: -menuWidth, y: 0, width: menuWidth, height: self.view.frame.height)
        let mainWindow = view.window?.windowScene?.keyWindow
        mainWindow?.addSubview(menuController.view)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1) {
            // final position to animate
            self.menuController.view.transform = CGAffineTransform(translationX: self.menuWidth, y: 0)
        }
        
        addChild(menuController)
    }
    
    @objc func handleHide() {
        print("Hiding memnu...")
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1) {
            // final position to animate
            self.menuController.view.transform = .identity
        }
        
//        menuController.view.removeFromSuperview()
//        menuController.removeFromParent()
    }
    
    fileprivate func setupNavigationItems() {
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(handleOpen))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(handleHide))
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellId")
        cell.textLabel?.text = "Row: \(indexPath.row)"
        return cell
    }
}

