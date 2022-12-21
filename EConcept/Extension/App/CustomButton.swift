//
//  CustomButton.swift
//  EConcept
//
//  Created by AvazbekOS on 19/12/22.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    convenience init(withTitle: String) {
        self.init(frame: .zero)
        self.setTitle(withTitle, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setup() {
        backgroundColor = .orangeColor
        clipsToBounds = true
        layer.cornerRadius = 10
        setTitleColor(.white, for: .normal)
        titleLabel?.font = .markPro(size: 20)
        titleLabel?.textColor = .white
    }

}
