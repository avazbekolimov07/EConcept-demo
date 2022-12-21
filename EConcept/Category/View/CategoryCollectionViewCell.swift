//
//  CategoryCollectionViewCell.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell, ClassIdentifiable {

    // MARK: - UI Elements
    
     lazy var simpleView: UIView = {
        let view = UIView()
        view.backgroundColor = .orangeColor
        view.layer.shadowColor = UIColor(red: 0.656, green: 0.669, blue: 0.788, alpha: 0.15).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 20
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        return view
    }()

     lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
         imageView.tintColor = .white
        return imageView
    }()

     lazy var titleLabel: UILabel = {
        let label = UILabel()
//        label.text = "Phones"
        label.textColor = .orangeColor
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
    }
    override func prepareForReuse() {
        titleLabel.textColor = .orangeColor
        simpleView.backgroundColor = .orangeColor
        photoImageView.tintColor = .white
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        simpleView.layer.cornerRadius = 72 / 2
    }
    
    func configure(iconName: String, name: String) {
        photoImageView.image = UIImage(named: iconName)?.withRenderingMode(.alwaysTemplate)
        titleLabel.text = name
        
    }

}

// MARK: - Layout

extension CategoryCollectionViewCell {

    func setupSubviews() {
        simpleView.addSubviews(photoImageView)
        addSubviews(simpleView, titleLabel)
        configureConstraints()
    }

    func configureConstraints() {
        
        simpleView.anchor(top: topAnchor, width: 72, height: 72)
        simpleView.centerX(inView: self)
        
        titleLabel.anchor(top: simpleView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 7)
        
        photoImageView.center(inView: simpleView)
        photoImageView.setDimensions(width: 32, height: 32)
    }

}
