//
//  SearchBarCollectionViewCell.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import UIKit

class SearchBarCollectionViewCell: UICollectionViewCell, ClassIdentifiable {
    
    private lazy var searchBar: UISearchTextField = {
        let searchBar = UISearchTextField()
        searchBar.placeholder = "Search"
        
        searchBar.layer.shadowColor = UIColor.black.cgColor
        searchBar.layer.shadowOpacity = 0.15
        searchBar.layer.shadowRadius = 10
        searchBar.layer.shadowOffset = .zero
        return searchBar
    }()
    
    private lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "filter")
        imageView.contentMode = .scaleAspectFit
        imageView.setDimensions(width: 15, height: 15)
        return imageView
    }()
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .orangeColor
        view.setDimensions(width: 34, height: 34)
        view.layer.cornerRadius = 34/2
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SearchBarCollectionViewCell {
    private func setupSubviews() {
        addSubviews(searchBar, backView)
        backView.addSubview(iconImage)
        configureConstraints()
    }
    
    private func configureConstraints() {
        
        backView.anchor(right: rightAnchor,
                         paddingRight: 32)
        
        searchBar.anchor(left: leftAnchor, right: backView.leftAnchor,
                          paddingLeft: 32, paddingRight: 11)
        
        
        backView.centerY(inView: self)
        searchBar.centerY(inView: self)
        
        iconImage.center(inView: backView)
    }
}


