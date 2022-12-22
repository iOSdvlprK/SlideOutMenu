//
//  ChatroomMenuContainerController.swift
//  SlideOutMenu
//
//  Created by joe on 2022/12/22.
//

import UIKit

class ChatroomMenuContainerController: UIViewController {
    
    let chatroomsMenuController = ChatroomsMenuController()
    
    let searchContainer = UIView()
    let rocketImageView = UIImageView(image: #imageLiteral(resourceName: "rocket"))
    let searchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.2196078431, blue: 0.2862745098, alpha: 1)
        
        let chatroomsView = chatroomsMenuController.view!
        view.addSubview(chatroomsView)
        
        view.addSubview(searchContainer)
        searchContainer.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.1843137255, blue: 0.2470588235, alpha: 1)
        
        rocketImageView.contentMode = .scaleAspectFit
        rocketImageView.layer.cornerRadius = 3
        rocketImageView.clipsToBounds = true
        view.addSubview(rocketImageView)
        rocketImageView.anchor(top: nil, leading: view.leadingAnchor, bottom: searchContainer.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 8, bottom: 12, right: 0), size: .init(width: 40, height: 40))
        
        
        searchContainer.addSubview(searchBar)
        searchBar.searchBarStyle = .minimal
//        searchBar.placeholder = "Enter some filer"    // doesn't work
        searchBar.searchTextField.textColor = .white
        searchBar.searchTextField.leftView?.tintColor = .gray   // magnify color
//        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).textColor = .white
        searchBar.anchor(top: nil, leading: rocketImageView.trailingAnchor, bottom: searchContainer.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 4, right: 0))
        
        searchContainer.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        searchContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64).isActive = true
        
        chatroomsView.anchor(top: searchContainer.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Enter some filter", attributes: [.foregroundColor: UIColor.gray])
    }

}
