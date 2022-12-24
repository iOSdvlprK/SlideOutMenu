//
//  HomeController.swift
//  SlideOutMenu
//
//  Created by joe on 2022/12/06.
//

import UIKit

class HomeController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate {
    
    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .green
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.frame
        tableView.backgroundColor = .red
        setupNavigationItems()
    }
    
    @objc func handleOpen() {
        (view.window?.rootViewController as? BaseSlidingController)?.openMenu()
    }
    
    @objc func handleHide() {
        (view.window?.rootViewController as? BaseSlidingController)?.closeMenu()
    }
    
    fileprivate func setupNavigationItems() {
        navigationItem.title = "Home"
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(handleOpen))
        setupCircularNavigationButton()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(handleHide))
    }
    
    fileprivate func setupCircularNavigationButton() {
        let image = #imageLiteral(resourceName: "girl_profile").withRenderingMode(.alwaysOriginal)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleOpen))  // 1) this doesn't work
        let customView = UIButton(type: .system)
//        customView.backgroundColor = .orange
        customView.addTarget(self, action: #selector(handleOpen), for: .touchUpInside)
//        customView.imageView?.image = image // 2) this doesn't work
        customView.setImage(image, for: .normal)
        customView.imageView?.contentMode = .scaleAspectFit
//        customView.frame = CGRect(x: 0, y: 0, width: 40, height: 40) // 3) ditto
//        customView.layer.cornerRadius = 20  // 4) It doesn’t work, either.
        
        // ✅ custom view uses auto layout to put itself in the nav bar
        customView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        customView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        customView.layer.cornerRadius = 20
        customView.clipsToBounds = true
        
        let barButtonItem = UIBarButtonItem(customView: customView)
        navigationItem.leftBarButtonItem = barButtonItem
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellId")
        cell.textLabel?.text = "Row: \(indexPath.row)"
        return cell
    }
}

