//
//  ProductBottomView.swift
//  EConcept
//
//  Created by AvazbekOS on 19/12/22.
//

import UIKit

class ProductBottomView: UIView {
    
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

    private lazy var likeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "like")?.withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .markPro(size: 24)
        label.text = "Galaxy Note 20 Ultra"
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .darkBlueColor
        return label
    }()

    
    //MARK: - SHOP DETAILS UI
    private lazy var cpuView: UIView = {
        let v = UIView()
        
        return v
    }()
    private lazy var cpuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cpu")?.withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private lazy var cpuLabel: UILabel = {
        let label = UILabel()
        label.font = .markPro(size: 11)
        label.text = "Exynos 990"
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = UIColor(hex: "#B7B7B7")
        return label
    }()
    
    private lazy var cameraView: UIView = {
        let v = UIView()
        
        return v
    }()
    private lazy var cameraImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "camera")?.withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private lazy var cameraLabel: UILabel = {
        let label = UILabel()
        label.font = .markPro(size: 11)
        label.text = "108 + 12 mp"
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = UIColor(hex: "#B7B7B7")
        return label
    }()
    
    private lazy var sdView: UIView = {
        let v = UIView()
       
        return v
    }()
    private lazy var sdImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sd")?.withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private lazy var sdLabel: UILabel = {
        let label = UILabel()
        label.font = .markPro(size: 11)
        label.text = "8 GB"
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = UIColor(hex: "#B7B7B7")
        return label
    }()
    
    private lazy var ssdView: UIView = {
        let v = UIView()

        return v
    }()
    private lazy var ssdImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ssd")?.withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private lazy var ssdLabel: UILabel = {
        let label = UILabel()
        label.font = .markPro(size: 11)
        label.text = "256 GB"
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = UIColor(hex: "#B7B7B7")
        return label
    }()
  
    private lazy var stackitemsHView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [cpuView, cameraView, sdView, ssdView])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
//        stackView.alignment = .center
        
        stackView.backgroundColor = .clear
        return stackView
    }()
    
    //MARK: - PRODUCT PREFERENCE UI
    private lazy var colorCapacityView = ColorCapacityView()
    private lazy var optionsView = OptionsView()
    private lazy var starsView = StarsView()
    
    
    private lazy var addToCartBtn: CustomButton = {
        let btn = CustomButton()
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
    
    func configure(data: ProductModel) {
        nameLabel.text = data.title
        cpuLabel.text = data.cpu
        cameraLabel.text = data.camera
        sdLabel.text = data.sd
        ssdLabel.text = data.ssd
        
        starsView.configure(number: Int(data.rating))
        colorCapacityView.configure(colors: data.color, capacity: data.capacity)
        addToCartBtn.setTitle("Add to Cart                 $\(data.price)", for: .normal)
    }
    
}

extension ProductBottomView {
    private func setupSubviews() {
        addSubviews(containerView)
        containerView.addSubviews(likeImageView, nameLabel, starsView, optionsView, stackitemsHView, colorCapacityView, addToCartBtn)
        
        cpuView.addSubviews(cpuImageView, cpuLabel)
        cameraView.addSubviews(cameraImageView, cameraLabel)
        sdView.addSubviews(sdImageView, sdLabel)
        ssdView.addSubviews(ssdImageView, ssdLabel)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
                
        containerView.fillSuperview()
        addToCartBtn.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor,
                           paddingLeft: 30, paddingBottom: 30, paddingRight: 30, height: 54)
        
        colorCapacityView.anchor(left: leftAnchor, bottom: addToCartBtn.topAnchor, right: rightAnchor,
                          paddingLeft: 30, paddingBottom: 15, paddingRight: 30, height: 75)
        
        stackitemsHView.anchor(left: leftAnchor, bottom: colorCapacityView.topAnchor, right: rightAnchor,
                          paddingLeft: 20, paddingBottom: 24, paddingRight: 20, height: 47)
        
        cpuImageView.anchor(top: cpuView.topAnchor)
        cpuImageView.centerX(inView: cpuView)
        cpuImageView.setDimensions(width: 28, height: 28)
        cpuLabel.anchor(left: cpuView.leftAnchor, bottom: cpuView.bottomAnchor, right: cpuView.rightAnchor)
        
        cameraImageView.anchor(top: cameraView.topAnchor)
        cameraImageView.centerX(inView: cameraView)
        cameraImageView.setDimensions(width: 28, height: 28)
        cameraLabel.anchor(left: cameraView.leftAnchor, bottom: cameraView.bottomAnchor, right: cameraView.rightAnchor)
        
        sdImageView.anchor(top: sdView.topAnchor)
        sdImageView.centerX(inView: sdView)
        sdImageView.setDimensions(width: 28, height: 21)
        sdLabel.anchor(left: sdView.leftAnchor, bottom: sdView.bottomAnchor, right: sdView.rightAnchor)
        
        ssdImageView.anchor(top: ssdView.topAnchor)
        ssdImageView.centerX(inView: ssdView)
        ssdImageView.setDimensions(width: 19, height: 22)
        ssdLabel.anchor(left: ssdView.leftAnchor, bottom: ssdView.bottomAnchor, right: ssdView.rightAnchor)
        
        optionsView.anchor(left: containerView.leftAnchor, bottom: stackitemsHView.topAnchor, right: containerView.rightAnchor, paddingLeft: 20, paddingBottom: 10, paddingRight: 20, height: 36)
        
        likeImageView.anchor(top: containerView.topAnchor, right: rightAnchor, paddingTop: 15, paddingRight: 38)
        likeImageView.setDimensions(width: 37, height: 33)
        nameLabel.anchor(top: containerView.topAnchor, left: leftAnchor, right: likeImageView.leftAnchor, paddingTop: 15, paddingLeft: 38, paddingRight: 10)
        starsView.anchor(top: nameLabel.bottomAnchor, left: nameLabel.leftAnchor, right: rightAnchor, paddingTop: 0, height: 15)

        
    }
}
