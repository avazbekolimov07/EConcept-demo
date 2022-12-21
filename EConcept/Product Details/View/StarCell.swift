//
//  StarCell.swift
//  EConcept
//
//  Created by AvazbekOS on 20/12/22.
//

import UIKit

class StarCell: UICollectionViewCell, ClassIdentifiable {
    
    
    private lazy var imageView: UIImageView = {
        let im = UIImageView()
        im.contentMode = .scaleAspectFit
        im.image = UIImage(named: "star")?.withRenderingMode(.alwaysOriginal)
        
        return im
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension StarCell {
    private func setupSubviews() {
        addSubview(imageView)
        configureConstraints()
    }
    
    private func configureConstraints() {
     
        imageView.fillSuperview()
    }
}
