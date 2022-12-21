//
//  MyCartBottomView.swift
//  EConcept
//
//  Created by AvazbekOS on 19/12/22.
//

import UIKit

class MyCartBottomView: UIView {
    
    var dataCell: [BasketDM] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkBlueColor
        view.clipsToBounds = true
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.layer.cornerRadius = 30
        view.layer.shadowColor = UIColor(red: 0.777, green: 0.831, blue: 0.879, alpha: 0.08).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 5
        view.layer.shadowOffset = CGSize(width: 4, height: 11)
        
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 30
        layout.minimumLineSpacing = 30
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsVerticalScrollIndicator = false
        cv.bounces = true
        cv.alwaysBounceVertical = true
        cv.dataSource = self
        cv.delegate = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(cellType: MyCartCell.self)
        return cv
    }()
    
    lazy var separator1View: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(hex: "#FFFFFF", alpha: 0.25)
        return v
    }()
    
    lazy var separator2View: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(hex: "#FFFFFF", alpha: 0.25)
        return v
    }()
    
    private lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.font = .markPro(size: 15)
        label.text = "Total"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .markPro(size: 15)
        label.text = "$6,000 us"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    private lazy var stack1View: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [totalLabel, priceLabel])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    
    private lazy var deliveryLabel: UILabel = {
        let label = UILabel()
        label.font = .markPro(size: 15)
        label.text = "Delivery"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.font = .markPro(size: 15)
        label.text = "Free"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    private lazy var stack2View: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [deliveryLabel, typeLabel])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        return stackView
    }()
    
    private lazy var stackVerticalView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [stack1View, stack2View])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
//        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var checkoutBtn: CustomButton = {
        let btn = CustomButton(withTitle: "Checkout")
//        btn.addTarget(self, action: #selector(), for: .touchUpInside)
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: MyCartModel) {
        priceLabel.text = "$\(data.total)us"
        typeLabel.text = data.delivery
        
        self.dataCell = data.basket
    }

}


extension MyCartBottomView {
    private func setupSubviews() {
        addSubviews(containerView)
        containerView.addSubviews(collectionView, separator1View, stackVerticalView, separator2View, checkoutBtn)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
                
        containerView.fillSuperview()
        checkoutBtn.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor,
                           paddingLeft: 44, paddingBottom: 44, paddingRight: 44, height: 54)
        separator2View.anchor(left: leftAnchor, bottom: checkoutBtn.topAnchor, right: rightAnchor,
                          paddingLeft: 4, paddingBottom: 27, paddingRight: 4, height: 2)
        separator1View.anchor(left: leftAnchor, bottom: separator2View.topAnchor, right: rightAnchor,
                          paddingLeft: 4, paddingBottom: 90, paddingRight: 4, height: 2)
        stackVerticalView.anchor(top: separator1View.bottomAnchor, left: leftAnchor, bottom: separator2View.topAnchor,
                                 right: rightAnchor, paddingTop: 15, paddingLeft: 55, paddingBottom: 15, paddingRight: 35)
        
        collectionView.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: separator1View.topAnchor, right: containerView.rightAnchor, paddingTop: 80, paddingLeft: 33, paddingBottom: 15, paddingRight: 33)
    }
}

extension MyCartBottomView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataCell.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 88)
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withCellType: MyCartCell.self, for: indexPath)
        cell.configure(data: dataCell[indexPath.row])
        return cell
    }
    
    
    
}
