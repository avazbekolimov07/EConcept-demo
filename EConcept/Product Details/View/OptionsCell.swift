//
//  OptionsCell.swift
//  EConcept
//
//  Created by AvazbekOS on 20/12/22.
//

import UIKit

class OptionsCell: UICollectionViewCell, ClassIdentifiable {
    
    
    lazy var lineView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 1.5
        v.backgroundColor = .orangeColor
        return v
    }()
    

    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = .markPro(size: 20)
        label.text = "Features"
        label.textAlignment = .center
        label.textColor = .darkBlueColor
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(text: String) {
        textLabel.text = text
    }
}

extension OptionsCell {
    private func setupSubviews() {
        addSubviews(textLabel, lineView)

        configureConstraints()
    }
    
    private func configureConstraints() {
        textLabel.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor)
        lineView.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 3)
    }
}
