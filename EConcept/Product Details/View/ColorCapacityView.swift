//
//  ColorCapacityView.swift
//  EConcept
//
//  Created by AvazbekOS on 20/12/22.
//

import UIKit

class ColorCapacityView: UIView {

    private lazy var color_capacity_Label: UILabel = {
        let label = UILabel()
        label.font = .markPro(size: 16)
        label.text = "Select color and capacity"
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .darkBlueColor
        return label
    }()
    
    private lazy var color1View: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.tag = 1
        view.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleColorTap(_: )))
        view.addGestureRecognizer(tapGesture)
        return view
    }()
    
    private lazy var color2View: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.tag = 2
        view.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleColorTap(_: )))
        view.addGestureRecognizer(tapGesture)
        return view
    }()
    private lazy var selectedImageView: [UIImageView] = {
        let ims = [UIImageView(), UIImageView()]
        for im in ims {
            im.contentMode = .scaleAspectFit
            im.image = UIImage(named: "checkMark")?.withRenderingMode(.alwaysOriginal)
            im.isHidden = true
        }
        return ims
    }()
   
    
    private lazy var capacity1Label: UILabel = {
        let label = UILabel()
        label.font = .markPro(size: 13)
        label.text = "128 GB"
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = UIColor(hex: "#FFFFFF")
        
        label.backgroundColor = .orangeColor
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        label.tag = 1
        label.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleCapacityTap(_: )))
        label.addGestureRecognizer(tapGesture)
        return label
    }()
    
    private lazy var capacity2Label: UILabel = {
        let label = UILabel()
        label.font = .markPro(size: 13)
        label.text = "256 GB"
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = UIColor(hex: "#8D8D8D")
        
        label.backgroundColor = .white
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        label.tag = 2
        label.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleCapacityTap(_: )))
        label.addGestureRecognizer(tapGesture)
        return label
    }()
    
    private lazy var stackitemsHView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [capacity1Label, capacity2Label])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
//        stackView.alignment = .center
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(colors: [String?], capacity: [String?]) {
        self.color1View.backgroundColor = UIColor(hex: colors[0] ?? "#000000")
        self.color2View.backgroundColor = UIColor(hex: colors[1] ?? "#000000")
        
        self.capacity1Label.text = "\(capacity[0] ?? "") GB"
        self.capacity2Label.text = "\(capacity[1] ?? "") GB"
    }
    
    @objc private func handleColorTap(_ gesture: UITapGestureRecognizer) {
        if let tag = gesture.view?.tag {
            if tag == 1{
                selectedImageView[1].isHidden = true
                selectedImageView[0].isHidden = false
            } else if tag == 2 {
                selectedImageView[0].isHidden = true
                selectedImageView[1].isHidden = false
            }
        }
    }
    
    @objc private func handleCapacityTap(_ gesture: UITapGestureRecognizer) {
        if let tag = gesture.view?.tag {
            if tag == 1{
                capacity2Label.textColor = UIColor(hex: "#8D8D8D")
                capacity2Label.backgroundColor = .white
                
                capacity1Label.textColor = UIColor(hex: "#FFFFFF")
                capacity1Label.backgroundColor = .orangeColor
            } else if tag == 2 {
                capacity1Label.textColor = UIColor(hex: "#8D8D8D")
                capacity1Label.backgroundColor = .white
                
                capacity2Label.textColor = UIColor(hex: "#FFFFFF")
                capacity2Label.backgroundColor = .orangeColor
            }
        }
    }

}

extension ColorCapacityView {
    private func setupSubviews() {
        addSubviews(color_capacity_Label, color1View, color2View, stackitemsHView, selectedImageView[0], selectedImageView[1])
        
        configureConstraints()
    }
    
    private func configureConstraints() {
                
        color_capacity_Label.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor)
        color1View.anchor(top: color_capacity_Label.bottomAnchor, left: leftAnchor, paddingTop: 14,
        width: 40, height: 40)
        
        color2View.anchor(top: color_capacity_Label.bottomAnchor, left: color1View.rightAnchor, paddingTop: 14, paddingLeft: 18,
        width: 40, height: 40)

        stackitemsHView.anchor(top: color_capacity_Label.bottomAnchor, left: color2View.rightAnchor, right: rightAnchor, paddingTop: 14, paddingLeft: 50, height: 30)
        
        selectedImageView[0].center(inView: color1View)
        selectedImageView[0].setDimensions(width: 17, height: 13)
        selectedImageView[1].center(inView: color2View)
        selectedImageView[1].setDimensions(width: 17, height: 13)
    }
}
