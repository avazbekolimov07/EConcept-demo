//
//  MainReusableHeaderView.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import UIKit

class MainReusableHeaderView: UICollectionReusableView, ClassIdentifiable {
    
    private(set) lazy var label: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 25)
        label.textColor = .rgb(1, green: 0, blue: 53, alpha: 1)
        return label
    }()
    
    private lazy var seeMoreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("see more", for: .normal)
        button.setTitleColor(.rgb(255, green: 110, blue: 78, alpha: 1), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.addTarget(self, action: #selector(handleLearnMore), for: .touchUpInside)
        return button
    }()
    
    var seeMoreTapped: (() -> Void)?
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(title: String, withButton: Bool) {
        label.text = title
        seeMoreButton.isHidden = !withButton
    }
    
    @objc func handleLearnMore() {
        seeMoreTapped?()
    }
}

// MARK: - Layout

extension MainReusableHeaderView {
    private func setupSubviews() {
        addSubviews(label, seeMoreButton)
        configureConstraints()
    }
    
    private func configureConstraints() {
        label.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor,
                    paddingLeft: 15)
        seeMoreButton.anchor(top: topAnchor, bottom: bottomAnchor, right: rightAnchor,
                               paddingRight: 15)
    }
}
