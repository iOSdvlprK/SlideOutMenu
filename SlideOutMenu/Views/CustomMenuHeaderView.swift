//
//  CustomMenuHeaderView.swift
//  SlideOutMenu
//
//  Created by joe on 2022/12/12.
//

import UIKit

class CustomMenuHeaderView: UIView {
    
    let nameLabel = UILabel()
    let usernameLabel = UILabel()
    let statsLabel = UILabel()
    let profileImageView = ProfileImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupComponentProps()
        setupStackView()
    }
    
    fileprivate func setupComponentProps() {
        // custom coponents for header
        nameLabel.text = "Joe K."
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        usernameLabel.text = "@iOSdvlprK"
        statsLabel.text = "42 following 7091 Followers"
        profileImageView.image = UIImage(named: "dvlprK")
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.layer.cornerRadius = 50 / 2
        profileImageView.clipsToBounds = true
        profileImageView.backgroundColor = .red
        
        setupStatsAttributedText()
    }
    
    fileprivate func setupStatsAttributedText() {
        statsLabel.font = UIFont.systemFont(ofSize: 14)
        let attributedText = NSMutableAttributedString(string: "42 ", attributes: [.font: UIFont.systemFont(ofSize: 18, weight: .medium)])
        attributedText.append(NSAttributedString(string: "Following ", attributes: [.foregroundColor: UIColor.black]))
        attributedText.append(NSAttributedString(string: "7091 ", attributes: [.font: UIFont.systemFont(ofSize: 18, weight: .medium)]))
        attributedText.append(NSAttributedString(string: "Followers", attributes: [.foregroundColor: UIColor.black]))
        statsLabel.attributedText = attributedText
    }
    
    fileprivate func setupStackView() {
        // a spacing hack with UIView
        let rightSpacerView = UIView()
        let arrangedSubviews = [
//            UIView(),
            UIStackView(arrangedSubviews: [profileImageView, rightSpacerView]),
            nameLabel,
            usernameLabel,
            SpacerView(space: 16),
            statsLabel
        ]
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis = .vertical
        stackView.spacing = 4
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
