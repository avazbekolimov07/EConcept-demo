//
//  MainViewController+Layout.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import UIKit

extension MainViewController {
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] section, _ -> NSCollectionLayoutSection? in
            switch section {
            case 0:
                return self?.createCategoryLayout()
            case 1:
                return self?.createSearchBarLayout()
            case 2:
                return self?.createImageLayout()
            default:
                return self?.createHotOffersLayout()
            }
        }
        return layout
    }
    
    
    private func createCategoryLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(96)))
        item.contentInsets = .init(top: .zero, leading: 6, bottom: .zero, trailing: 6)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(96), heightDimension: .absolute(96)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(top: 11, leading: 10, bottom: 20, trailing: 10)
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(30 + 22)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.SupplymentaryViewKind.header.identifier,
            alignment: .topLeading
        )

        section.boundarySupplementaryItems = [header]
        section.supplementariesFollowContentInsets = false
        
        return section
    }
    
    private func createSearchBarLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 10, leading: .zero, bottom: 20, trailing: .zero)
        return section
    }
    
    private func createImageLayout() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        item.contentInsets = .init(top: .zero, leading: 16, bottom: .zero, trailing: 16)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(182)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets.top = 16
        section.contentInsets.bottom = 12
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(30)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.SupplymentaryViewKind.header.identifier,
            alignment: .topLeading
        )
        section.boundarySupplementaryItems = [header]
        section.supplementariesFollowContentInsets = false
        
        return section
    }
 
    
    private func createHotOffersLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: .zero, leading: .zero, bottom: 12, trailing: 8)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(230))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 16, leading: 16, bottom: .zero, trailing: 8)
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(30)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.SupplymentaryViewKind.header.identifier,
            alignment: .topLeading
        )
        section.boundarySupplementaryItems = [header]
        section.supplementariesFollowContentInsets = false
        return section
    }
}
