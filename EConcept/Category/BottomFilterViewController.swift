//
//  BottomFilterViewController.swift
//  EConcept
//
//  Created by AvazbekOS on 21/12/22.
//

import UIKit

struct FilterModel {
    var mainText: String
    var text: String
}

class BottomFilterViewController: UIViewController {

    let model = [
        FilterModel(mainText: "Brand", text: "Samsung"),
        FilterModel(mainText: "Price", text: "$300 - $500"),
        FilterModel(mainText: "Size", text: "4.5 to 5.5 inches"),
    ]
    
    private lazy var secondaryView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        view.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDismiss(recognizer: )))
        view.addGestureRecognizer(tapGesture)
        return view
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = false
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.layer.cornerRadius = 30
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 35
        view.layer.shadowOffset = .zero
        
        return view
    }()
    
    private lazy var doneView: UIView = {
        let v = UIView()
        v.clipsToBounds = false
        v.layer.cornerRadius = 10
        v.backgroundColor = .orangeColor
        v.setDimensions(width: 86, height: 37)
        
        v.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDismiss(recognizer: )))
        v.addGestureRecognizer(tapGesture)
        return v
    }()
    private lazy var doneLabel: UILabel = {
        let label = UILabel()
        label.font = .markPro(size: 18)
        label.text = "Done"
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = .white
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .markPro(size: 18)
        label.text = "Filter options"
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = .darkBlueColor
        return label
    }()
    
    private lazy var cancelView: UIView = {
        let v = UIView()
        v.clipsToBounds = false
        v.layer.cornerRadius = 10
        v.backgroundColor = .darkBlueColor
        v.setDimensions(width: 37, height: 37)
        
        v.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDismiss(recognizer: )))
        v.addGestureRecognizer(tapGesture)
        return v
    }()
    private lazy var cancelImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cancel")?.withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        imageView.setDimensions(width: 11, height: 10)
        return imageView
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsVerticalScrollIndicator = false
        cv.bounces = true
        cv.alwaysBounceVertical = true
        cv.dataSource = self
        cv.delegate = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(cellType: FilterCell.self)
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        // Do any additional setup after loading the view.
    }
    
    
    @objc func handleDismiss(recognizer: UITapGestureRecognizer) {
        presentingViewController?.dismiss(animated: true)
    }

   

}

extension BottomFilterViewController {
    private func setupSubviews() {
        view.addSubviews(secondaryView, containerView)
        containerView.addSubviews(doneView, doneLabel, titleLabel, cancelView, cancelImageView, collectionView)
        
        doneView.addSubview(doneLabel)
        cancelView.addSubviews(cancelImageView)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
                
        containerView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, height: 380)
        secondaryView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: containerView.topAnchor, right: view.rightAnchor)
        
        cancelView.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, paddingTop: 24, paddingLeft: 44)
        cancelImageView.center(inView: cancelView)
        
        doneView.anchor(top: containerView.topAnchor, right: containerView.rightAnchor, paddingTop: 24, paddingRight: 20)
        doneLabel.fillSuperview()
        titleLabel.centerY(inView: cancelView)
        titleLabel.anchor(left: cancelView.rightAnchor, right: doneView.leftAnchor, paddingLeft: 15, paddingRight: 15)
        
        collectionView.anchor(top: titleLabel.bottomAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, paddingTop: 30, paddingLeft: 46, paddingBottom: 20, paddingRight: 31)
    }
}

extension BottomFilterViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 65)
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withCellType: FilterCell.self, for: indexPath)
        cell.configure(model: model[indexPath.row])
        return cell
    }
    
    
    
}
