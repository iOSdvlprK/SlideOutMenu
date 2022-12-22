//
//  ChatroomMenuContainerController.swift
//  SlideOutMenu
//
//  Created by joe on 2022/12/22.
//

import UIKit

class ChatroomMenuContainerController: UIViewController {
    
    let chatroomsMenuController = ChatroomsMenuController()
    let searchContainer = SearchContainerView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.2196078431, blue: 0.2862745098, alpha: 1)
        
        let chatroomsView = chatroomsMenuController.view!
        view.addSubview(chatroomsView)
        
        view.addSubview(searchContainer)
        searchContainer.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.1843137255, blue: 0.2470588235, alpha: 1)
        
        searchContainer.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        searchContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64).isActive = true
        
        chatroomsView.anchor(top: searchContainer.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    

}

class SearchContainerView: UIView {
    let searchBar: UISearchBar = {
       let sb = UISearchBar()
        sb.searchBarStyle = .minimal
        sb.searchTextField.textColor = .white
        sb.searchTextField.leftView?.tintColor = .gray   // magnify color
        sb.searchTextField.attributedPlaceholder = NSAttributedString(string: "Enter some filter", attributes: [.foregroundColor: UIColor.gray])
        return sb
    }()
    
    let rocketImageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "rocket"))
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = 3
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(searchBar)
        addSubview(rocketImageView)
        
        rocketImageView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: 8, bottom: 12, right: 0), size: .init(width: 40, height: 40))
        searchBar.anchor(top: nil, leading: rocketImageView.trailingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 4, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
