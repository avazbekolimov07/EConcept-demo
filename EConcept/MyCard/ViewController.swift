//
//  ViewController.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import UIKit

class ViewController: BaseViewController {

    var dataModel: MyCartModel?
    private lazy var bottomView = MyCartBottomView()
    
    private lazy var myCartLabel: UILabel = {
        let label = UILabel()
        label.font = .markPro(size: 35)
        label.text = "My Cart"
        label.textColor = .darkBlueColor
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    //MARK: - Top Custom Navigation UI
    lazy var backView: UIView = {
        let v = UIView()
        v.backgroundColor = .darkBlueColor
        v.layer.cornerRadius = 10
        return v
    }()
    private lazy var backImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "back")?.withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.font = .markPro(size: 15)
        label.text = "Add address"
        label.textColor = .darkBlueColor
        label.textAlignment = .right
        label.numberOfLines = 1
        return label
    }()
    lazy var addressView: UIView = {
        let v = UIView()
        v.backgroundColor = .orangeColor
        v.layer.cornerRadius = 10
        return v
    }()
    private lazy var addressImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "address")?.withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        fetchResopnseData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.backgroundColor = .darkBlueColor
    }

    func fetchResopnseData() {
        API.getMyCart { [weak self] data in
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

}

extension ViewController {
    private func setupSubviews() {
        view.addSubviews(backView, addressLabel, addressView, myCartLabel, bottomView)
        backView.addSubview(backImageView)
        addressView.addSubview(addressImageView)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
                
        backView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 5, paddingLeft: 42, width: 37, height: 37)
        backImageView.center(inView: backView)
        backImageView.setDimensions(width: 14, height: 18)
        
        addressView.anchor(top: view.safeAreaLayoutGuide.topAnchor, right: view.rightAnchor, paddingTop: 5, paddingRight: 42, width: 37, height: 37)
        addressImageView.center(inView: addressView)
        addressImageView.setDimensions(width: 14, height: 18)
        
        addressLabel.anchor(left: backView.rightAnchor, right: addressView.leftAnchor, paddingLeft: 10, paddingRight: 10)
        addressLabel.centerY(inView: addressView)
        myCartLabel.anchor(top: backView.bottomAnchor, left: view.leftAnchor, paddingTop: 50, paddingLeft: 42)
        bottomView.anchor(top: myCartLabel.bottomAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 50)
        
    }
}



