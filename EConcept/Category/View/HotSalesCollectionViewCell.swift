//
//  HotSalesCollectionViewCell.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import UIKit

class HotSalesCollectionViewCell: UICollectionViewCell, ClassIdentifiable {

    // MARK: - UI Elements

    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
//        imageView.image = UIImage(named: "hotSalesImage")
        return imageView
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .orangeColor
        view.clipsToBounds = false
        view.layer.cornerRadius = 27 / 2
        return view
    }()
    
    private lazy var newLabel: UILabel = {
        let label = UILabel()
        label.font = .markPro(size: 10)
        label.text = "New"
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = .white
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .markPro(size: 25)
//        label.text = "Galaxy Note 20 Ultra"
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .white
        return label
    }()
    
    private lazy var descLabel: UILabel = {
        let label = UILabel()
        label.font = .markPro(size: 11)
//        label.text = "Galaxy Note 20 Ultra"
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .white
        return label
    }()
    
    private lazy var addToCartBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .white
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 5
        btn.setTitleColor(UIColor.darkBlueColor, for: .normal)
        btn.titleLabel?.font = .markPro(size: 11)
        btn.titleLabel?.textColor = UIColor.darkBlueColor
        btn.setTitle("Buy now!", for: .normal)
//        btn.addTarget(self, action: #selector(), for: .touchUpInside)
        return btn
    }()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: HomeStoreDM) {
        photoImageView.setImage(stringURL: data.picture, loadingIndicator: .gray)
        nameLabel.text = data.title
        descLabel.text = data.subtitle
    }

}

// MARK: - Layout

extension HotSalesCollectionViewCell {

    func setupSubviews() {
        addSubviews(photoImageView, containerView, nameLabel, descLabel, addToCartBtn)
        containerView.addSubview(newLabel)
        configureConstraints()
    }

    func configureConstraints() {
        photoImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
        containerView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 10, paddingLeft: 15, width: 27 ,height: 27)
        newLabel.fillSuperview()
        
        nameLabel.anchor(top: containerView.bottomAnchor, left: containerView.leftAnchor, paddingTop: 15)
        descLabel.anchor(top: nameLabel.bottomAnchor, left: nameLabel.leftAnchor, paddingTop: 5)
        addToCartBtn.anchor(top: descLabel.bottomAnchor, left: descLabel.leftAnchor, paddingTop: 25, width: 98, height: 23)
    }

}
