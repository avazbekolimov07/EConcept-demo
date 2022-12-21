//
//  FilterCell.swift
//  EConcept
//
//  Created by AvazbekOS on 21/12/22.
//

import UIKit

class FilterCell: UICollectionViewCell, ClassIdentifiable {
    
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.font = .markPro(size: 18)
        label.text = "Brand"
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .darkBlueColor
        return label
    }()
    
    private lazy var backView: UIView = {
        let v = UIView()
        v.clipsToBounds = false
        v.layer.cornerRadius = 5
        v.backgroundColor = .white
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor(hex: "#DCDCDC").cgColor
        return v
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = .markPro(size: 18)
        label.text = "Samsung"
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .darkBlueColor
        return label
    }()
    
    private lazy var underImageView: UIImageView = {
        let im = UIImageView()
        im.contentMode = .scaleAspectFit
        im.image = UIImage(named: "under")?.withRenderingMode(.alwaysOriginal)
        return im
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: FilterModel) {
        mainLabel.text = model.mainText
        textLabel.text = model.text
    }
    
}

extension FilterCell {
    private func setupSubviews() {
        addSubviews(mainLabel, backView)
        backView.addSubviews(textLabel, underImageView)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
                
        mainLabel.anchor(top: topAnchor, left: leftAnchor)
        backView.anchor(top: mainLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10)
        
        textLabel.centerY(inView: backView)
        underImageView.centerY(inView: backView)
        
        textLabel.anchor(left: backView.leftAnchor, paddingLeft: 14)
        underImageView.anchor(right: backView.rightAnchor, paddingRight: 12)
        underImageView.setDimensions(width: 16, height: 8)
        // 37 + 10 + 18 = 65
    }
}
