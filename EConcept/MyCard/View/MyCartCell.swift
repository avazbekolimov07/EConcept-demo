//
//  MyCartCell.swift
//  EConcept
//
//  Created by AvazbekOS on 19/12/22.
//

import UIKit

class MyCartCell: UICollectionViewCell, ClassIdentifiable {
    
    private var amount: Int = 0 {
        didSet {
            quantityLabel.text = "\(amount)"
        }
    }
    private lazy var imageView: UIImageView = {
        let im = UIImageView()
        im.contentMode = .scaleAspectFit
        im.image = UIImage(named: "sample")?.withRenderingMode(.alwaysOriginal)
        im.layer.masksToBounds = true
        im.clipsToBounds = true
        im.layer.cornerRadius = 15
        return im
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .markPro(size: 20)
        label.text = "Galaxy Note 20 Ultra"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = .zero
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .markPro(size: 20)
        label.text = "$3000.00"
        label.textColor = .orangeColor
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var stepperView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 12
        v.backgroundColor = UIColor(hex: "#282843")
        return v
    }()
    
    private lazy var plusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "plus")
        imageView.contentMode = .scaleAspectFit
        
        imageView.tag = 1
        imageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_: )))
        imageView.addGestureRecognizer(tapGesture)
        return imageView
    }()
    private lazy var quantityLabel: UILabel = {
        let label = UILabel()
        label.font = .markPro(size: 20)
        label.text = "0"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    private lazy var minusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "minus")
        imageView.contentMode = .scaleAspectFit
        
        imageView.tag = 2
        imageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_: )))
        imageView.addGestureRecognizer(tapGesture)
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [plusImageView, quantityLabel, minusImageView])
        stackView.axis = .vertical
        stackView.spacing = 6
        stackView.distribution = .fill
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var trashImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "trash")?.withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: BasketDM) {
        imageView.setImage(stringURL: data.images, loadingIndicator: .gray)
        titleLabel.text = data.title
        priceLabel.text = "$\(data.price)"
    }
    
    @objc private func handleTap(_ gesture: UITapGestureRecognizer) {
        if let tag = gesture.view?.tag {
            if tag == 1{
                self.amount += 1
            } else if tag == 2 {
                if amount != 0 {
                    self.amount -= 1
                }
            }
        }
    }
    
}

extension MyCartCell {
    private func setupSubviews() {
        addSubviews(imageView, titleLabel, priceLabel, stepperView, trashImageView)
        stepperView.addSubview(stackView)
        stackView.addSubviews(plusImageView, quantityLabel, minusImageView)
        configureConstraints()
    }
    
    private func configureConstraints() {
        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, width: 88)
        trashImageView.anchor(right: rightAnchor, width: 16, height: 16)
        trashImageView.centerY(inView: self)
        
        stepperView.anchor(right: trashImageView.leftAnchor, paddingRight: 17, width: 26, height: 68)
        stepperView.centerY(inView: self)
        stackView.anchor(top: stepperView.topAnchor, left: stepperView.leftAnchor, bottom: stepperView.bottomAnchor, right: stepperView.rightAnchor, paddingTop: 8, paddingBottom: 8)
        
        plusImageView.setDimensions(width: 9, height: 9)
        minusImageView.setDimensions(width: 9, height: 9)
        
        titleLabel.anchor(top: topAnchor, left: imageView.rightAnchor, right: stepperView.leftAnchor,
                          paddingLeft: 15, paddingRight: 15)

        priceLabel.anchor(top: titleLabel.bottomAnchor, left: imageView.rightAnchor, right: stepperView.leftAnchor,
                            paddingTop: 5, paddingLeft: 15, paddingRight: 15)
    }
}
