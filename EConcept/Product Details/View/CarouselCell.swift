//
//  CarouselCell.swift
//  EConcept
//
//  Created by AvazbekOS on 20/12/22.
//

import UIKit

class CarouselCell: UICollectionViewCell, ClassIdentifiable {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white

        view.clipsToBounds = false
        view.layer.cornerRadius = 15
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.15
        view.layer.shadowRadius = 15
        view.layer.shadowOffset = .zero

        
        return view
    }()
    
    
    private lazy var imageView: UIImageView = {
        let im = UIImageView()
        im.contentMode = .scaleAspectFit
        im.image = UIImage(named: "sample")?.withRenderingMode(.alwaysOriginal)
        
        return im
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(imageUrl: String) {
        imageView.setImage(stringURL: imageUrl, loadingIndicator: .gray)
    }
}

extension CarouselCell {
    private func setupSubviews() {
        addSubviews(containerView)
        containerView.addSubview(imageView)
        configureConstraints()
    }
    
    private func configureConstraints() {
        containerView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 25, paddingLeft: 10, paddingBottom: 10, paddingRight: 10)
        imageView.fillSuperview()
    }
}
