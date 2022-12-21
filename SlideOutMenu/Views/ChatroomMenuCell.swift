//
//  ChatroomMenuCell.swift
//  SlideOutMenu
//
//  Created by joe on 2022/12/21.
//

import UIKit

class ChatroomMenuCell: UITableViewCell {
    
    let bgView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(red: 48/255, green: 164/255, blue: 182/255, alpha: 1)   // teal color
        v.layer.cornerRadius = 5
        return v
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        addSubview(bgView)
        // 4 constraints
        bgView.fillSuperview(padding: .init(top: 0, left: 4, bottom: 0, right: 4))
        sendSubviewToBack(bgView)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

//        contentView.backgroundColor = selected ? .orange : .clear
        bgView.isHidden = !selected
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
