//
//  StarsView.swift
//  EConcept
//
//  Created by AvazbekOS on 20/12/22.
//

import UIKit

class StarsView: UIView {

    private var number = 0 {
        didSet {
            collectionView.reloadData()
        }
    }
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 9
        layout.minimumLineSpacing = 9
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        
        cv.dataSource = self
        cv.delegate = self
        cv.isScrollEnabled = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(cellType: StarCell.self)
        return cv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(number: Int) {
        self.number = number
    }

}

extension StarsView {
    private func setupSubviews() {
        addSubviews(collectionView)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
                
        collectionView.fillSuperview()
    }
}

extension StarsView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return number
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 15, height: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withCellType: StarCell.self, for: indexPath)
        return cell
    }
}
