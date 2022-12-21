//
//  MainViewController.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import UIKit

class MainViewController: BaseViewController {
    
    var dataModel: CategoryDM? {
        didSet {
            collectionView.reloadData()
        }
    }
    private let categories = ["phone", "computer", "heart", "book"]
    private let names = ["Phones", "Computer", "Health", "Books"]
    
    private lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private lazy var topLocImageView: UIImageView = {
        let im = UIImageView()
        im.contentMode = .scaleAspectFit
        im.image = UIImage(named: "address")?.withRenderingMode(.alwaysTemplate)
        im.tintColor = .orangeColor
        
        return im
    }()
    
    private lazy var topTextLabel: UILabel = {
        let label = UILabel()
        label.font = .markPro(size: 20)
        label.text = "Zihuatanejo, Gro"
        label.textAlignment = .left
        label.textColor = .darkBlueColor
        return label
    }()
    
    private lazy var topUnImageView: UIImageView = {
        let im = UIImageView()
        im.contentMode = .scaleAspectFit
        im.image = UIImage(named: "under")?.withRenderingMode(.alwaysOriginal)
        
        return im
    }()
    
    private lazy var topFilterImageView: UIImageView = {
        let im = UIImageView()
        im.contentMode = .scaleAspectFit
        im.image = UIImage(named: "topFilter")?.withRenderingMode(.alwaysOriginal)
        
        im.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleFilterView))
        im.addGestureRecognizer(tapGesture)
        return im
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.backgroundColor = .clear//.rgb(245, green: 245, blue: 248, alpha: 1)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(cellType: CategoryCollectionViewCell.self)
        collectionView.register(cellType: SearchBarCollectionViewCell.self)
        collectionView.register(cellType: HotSalesCollectionViewCell.self)
        collectionView.register(cellType: BestSellerCollectionViewCell.self)
        
        collectionView.registerView(ofKind: .header, viewType: MainReusableHeaderView.self)
        collectionView.registerView(ofKind: .footer, viewType: MainReusableHeaderView.self)
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .rgb(245, green: 245, blue: 248, alpha: 1)
        setupSubviews()
        fetchResopnseData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.backgroundColor = .clear
    }
    
    
    func fetchResopnseData() {
        API.getCategory { [weak self] data in
            guard let self = self else { return }
            self.dataModel = data
        }
    }
    
    @objc func handleFilterView() {
        print("Hello")
        let vc = BottomFilterViewController()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false, completion: nil)
    }

}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 4
        case 1:
            return 1
        case 2:
            return dataModel?.home_store.count ?? 0
        default:
            return dataModel?.best_seller.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let viewKind = UICollectionView.SupplymentaryViewKind(identifier: kind)
        
        if viewKind == .header {
            switch indexPath.section {
            case 0:
                let header = collectionView.dequeueReusableView(ofKind: .header, withViewType: MainReusableHeaderView.self, for:indexPath)
                header.label.text = "Select Category"
                header.seeMoreTapped = { [weak self] in
                    print("select category tapped")
                }
                return header
            case 2:
                let header = collectionView.dequeueReusableView(ofKind: .header, withViewType: MainReusableHeaderView.self, for:indexPath)
                header.label.text = "Hot sales"
                header.seeMoreTapped = { [weak self] in
                    print("hot sale tapped")
                }
                return header
            default:
                let header = collectionView.dequeueReusableView(ofKind: .header, withViewType: MainReusableHeaderView.self, for: indexPath)
                header.label.text = "Best Seller"
                header.seeMoreTapped = { [weak self] in
                    print("Best Seller tapped")
                }
                return header
            }
        } else {
            let footer = collectionView.dequeueReusableView(ofKind: .footer, withViewType: MainReusableHeaderView.self, for: indexPath)
            return footer
        }
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withCellType: CategoryCollectionViewCell.self, for: indexPath)
            cell.configure(iconName: categories[indexPath.item], name: names[indexPath.item])
            
            if indexPath.item != 0 {
                cell.simpleView.backgroundColor = .white
                cell.titleLabel.textColor = .darkBlueColor
                cell.photoImageView.tintColor = UIColor(hex: "#B3B3C3")
            }
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withCellType: SearchBarCollectionViewCell.self, for: indexPath)
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withCellType: HotSalesCollectionViewCell.self, for: indexPath)
            if let dataHot = dataModel?.home_store[indexPath.item] {
                cell.configure(data: dataHot)
            }
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withCellType: BestSellerCollectionViewCell.self, for: indexPath)
            if let dataBest = dataModel?.best_seller[indexPath.item] {
                cell.configure(data: dataBest)
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            collectionView.visibleCells.forEach { cell in
                if let cel = cell as? CategoryCollectionViewCell {
                    cel.simpleView.backgroundColor = .white
                    cel.titleLabel.textColor = .darkBlueColor
                    cel.photoImageView.tintColor = UIColor(hex: "#B3B3C3")
                }
            }
            if let cell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell {
                cell.simpleView.backgroundColor = .orangeColor
                cell.titleLabel.textColor = .orangeColor
                cell.photoImageView.tintColor = .white
            }
        case 1:
            print(indexPath.item)
        case 2:
            print(indexPath.item)
            let vc = ProductViewController()
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        default:
            print(indexPath.item)
            
            let vc = ProductViewController()
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}


extension MainViewController {
    private func setupSubviews() {
        view.addSubviews(headerView, collectionView)
        headerView.addSubviews(topLocImageView, topTextLabel, topUnImageView, topFilterImageView)
        configureConstraints()
    }
    
    private func configureConstraints() {
        
        headerView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor,
                          height: 50)
        
        topLocImageView.centerY(inView: headerView)
        topTextLabel.centerY(inView: headerView)
        topUnImageView.centerY(inView: headerView)
        topFilterImageView.centerY(inView: headerView)
        
        topTextLabel.centerX(inView: headerView)
        topLocImageView.anchor(right: topTextLabel.leftAnchor, paddingRight: 11)
        topLocImageView.setDimensions(width: 12, height: 16)
        topUnImageView.anchor(left: topTextLabel.rightAnchor, paddingLeft: 8)
        topUnImageView.setDimensions(width: 10, height: 5)
        topFilterImageView.anchor(right: headerView.rightAnchor, paddingRight: 35)
        topFilterImageView.setDimensions(width: 15, height: 18)
        
        collectionView.anchor(top: headerView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
}

