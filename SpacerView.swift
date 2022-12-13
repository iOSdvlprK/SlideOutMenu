//
//  SpacerView.swift
//  SlideOutMenu
//
//  Created by joe on 2022/12/13.
//

import UIKit

class SpacerView: UIView {
    
    let space: CGFloat

    override var intrinsicContentSize: CGSize {
        return .init(width: space, height: space)
    }

    init(space: CGFloat) {
        self.space = space
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
