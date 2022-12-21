//
//  OptionsView.swift
//  EConcept
//
//  Created by AvazbekOS on 20/12/22.
//

import UIKit

class OptionsView: UIView {

    let sectors = ["Shop", "Details", "Features"]
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 35
        layout.minimumLineSpacing = 35
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        
        cv.dataSource = self
        cv.delegate = self
        cv.isScrollEnabled = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(cellType: OptionsCell.self)
        return cv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OptionsView {
    private func setupSubviews() {
        addSubviews(collectionView)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
                
        collectionView.fillSuperview()
    }
}

extension OptionsView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 4), height: collectionView.frame.height)
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withCellType: OptionsCell.self, for: indexPath)
        cell.configure(text: sectors[indexPath.row])
        
        cell.lineView.isHidden = true
        cell.textLabel.textColor = UIColor(hex: "#00000080", alpha: 0.5)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? OptionsCell {
            cell.lineView.isHidden = false
            cell.textLabel.textColor = .darkBlueColor
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? OptionsCell {
            cell.lineView.isHidden = true
            cell.textLabel.textColor = UIColor(hex: "#00000080", alpha: 0.5)
        }
    }
    
    
    
}
