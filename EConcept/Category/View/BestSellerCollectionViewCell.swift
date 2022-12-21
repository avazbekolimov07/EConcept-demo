//
//  BestSellerCollectionViewCell.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import UIKit


class BestSellerCollectionViewCell: UICollectionViewCell, ClassIdentifiable {
    
    // MARK: - UI Elements
    
    private lazy var productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.contentMode = .scaleAspectFit
//        imageView.image = UIImage(named: "productImage")
        return imageView
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
//        label.text = "$1,047"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .darkBlueColor
        return label
    }()
    
    private lazy var oldPriceLabel: UILabel = {
        let label = UILabel()
//        label.text = "$1,047"
        label.font = .systemFont(ofSize: 10)
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var descripLabel: UILabel = {
        let label = UILabel()
//        label.text = "Samsung Galaxy s20 Ultra"
        label.font = .systemFont(ofSize: 10)
        label.textColor = .darkBlueColor
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .rgb(255, green: 255, blue: 255, alpha: 1)
        button.layer.cornerRadius = 25/2
//        button.setImage(UIImage(named: "heartImage")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowRadius = 10
        button.layer.shadowOffset = .zero
        return button
    }()
        
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .rgb(255, green: 255, blue: 255, alpha: 1)
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 12
    }

    // MARK: - UI Bindings
    
    func configure(data: BestSellerDM) {
        productImage.setImage(stringURL: data.picture, loadingIndicator: .gray)
        priceLabel.text = "\(data.discount_price )"
        
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "\(data.price_without_discount )")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSRange(location: 0, length: attributeString.length))
        
        oldPriceLabel.attributedText = attributeString
        descripLabel.text = data.title
        
        if data.is_favorites {
            likeButton.setImage(UIImage(named: "fullHeart")?.withRenderingMode(.alwaysOriginal), for: .normal)
        } else {
            likeButton.setImage(UIImage(named: "emptyHeart")?.withRenderingMode(.alwaysOriginal), for: .normal)
        }
    }
    
}

// MARK: - Layout

extension BestSellerCollectionViewCell {
    private func setupSubviews() {
        productImage.addSubviews(likeButton)
        addSubviews(productImage, descripLabel, priceLabel, oldPriceLabel, likeButton)
        configureConstraints()
    }
    
    private func configureConstraints() {
        productImage.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor,
                            height: 168)
        
        priceLabel.anchor(top: productImage.bottomAnchor, left: leftAnchor,
                            paddingTop: 2, paddingLeft: 21)
        oldPriceLabel.anchor(left: priceLabel.rightAnchor, bottom: priceLabel.bottomAnchor, paddingLeft: 7)
        
        descripLabel.anchor(top: priceLabel.bottomAnchor, left: leftAnchor, right: rightAnchor,
                            paddingTop: 5, paddingLeft: 21, paddingRight: 16)
        
        likeButton.anchor(top: productImage.topAnchor, right: productImage.rightAnchor,
                           paddingTop: 6, paddingRight: 15, width: 25, height: 25)
    }
}

