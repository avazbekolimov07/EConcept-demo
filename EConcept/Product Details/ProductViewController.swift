//
//  ProductViewController.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import UIKit

class ProductViewController: BaseViewController {
    
    
    var dataModel: ProductModel? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    private lazy var bottomView = ProductBottomView()
    
    //MARK: - Top Custom Navigation UI
    lazy var backView: UIView = {
        let v = UIView()
        v.backgroundColor = .darkBlueColor
        v.layer.cornerRadius = 10
        
        v.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDismiss(recognizer: )))
        v.addGestureRecognizer(tapGesture)
        return v
    }()
    private lazy var backImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "back")?.withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var productLabel: UILabel = {
        let label = UILabel()
        label.font = .markPro(size: 15)
        label.text = "Product Details"
        label.textColor = .darkBlueColor
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    lazy var bucketView: UIView = {
        let v = UIView()
        v.backgroundColor = .orangeColor
        v.layer.cornerRadius = 10
        return v
    }()
    private lazy var bucketImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bucket")?.withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UPCarouselFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 250, height: 345)
        layout.sideItemAlpha = 1
        layout.sideItemScale = 0.8
        layout.spacingMode = UPCarouselFlowLayoutSpacingMode.overlap(visibleOffset: 0)
        let collection = UICollectionView(frame: .zero , collectionViewLayout: layout)
        collection.register(cellType: CarouselCell.self)
        collection.backgroundColor = .clear
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.decelerationRate = .normal
        collection.delegate = self
        collection.dataSource = self
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
        fetchResopnseData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.backgroundColor = .clear
    }
    
    func fetchResopnseData() {
        API.getProduct { [weak self] data in
            guard let self = self else { return }
            self.dataModel = data
            self.updateData()
        }
    }
    
    func updateData() {
        if let dataModel {
            bottomView.configure(data: dataModel)
        }
    }
    
    @objc func handleDismiss(recognizer: UITapGestureRecognizer) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension ProductViewController {
    private func setupSubviews() {
        view.addSubviews(backView, productLabel, bucketView, collectionView, bottomView)
        backView.addSubview(backImageView)
        bucketView.addSubview(bucketImageView)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
                
        backView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 5, paddingLeft: 42, width: 37, height: 37)
        backImageView.center(inView: backView)
        backImageView.setDimensions(width: 14, height: 18)
        
        bucketView.anchor(top: view.safeAreaLayoutGuide.topAnchor, right: view.rightAnchor, paddingTop: 5, paddingRight: 42, width: 37, height: 37)
        bucketImageView.center(inView: bucketView)
        bucketImageView.setDimensions(width: 14, height: 18)
        
        productLabel.anchor(left: backView.rightAnchor, right: bucketView.leftAnchor, paddingLeft: 10, paddingRight: 10)
        productLabel.centerY(inView: bucketView)
        
        collectionView.anchor(top: backView.bottomAnchor, left: view.leftAnchor,right: view.rightAnchor, paddingTop: 30, height: 350)
        bottomView.anchor(top: collectionView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 7)
        
    }
}

extension ProductViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataModel?.images.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withCellType: CarouselCell.self, for: indexPath)
        // Configure the cell
        if let imageUrl = dataModel?.images[indexPath.row] {
            cell.configure(imageUrl: imageUrl)
        }
        return cell
    }
    
    
}
