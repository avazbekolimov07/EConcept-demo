//
//  ScrollView.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import UIKit

final class ScrollView: UIScrollView {

    private(set) lazy var contentView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubviews(contentView)
        
        
        contentView.fillSuperview()
        contentView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension UISearchBar
{
    func setPlaceholderTextColorTo(color: UIColor)
    {
        let textFieldInsideSearchBar = self.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = color
        let textFieldInsideSearchBarLabel = textFieldInsideSearchBar!.value(forKey: "placeholderLabel") as? UILabel
        textFieldInsideSearchBarLabel?.textColor = color
    }

    func setMagnifyingGlassColorTo(color: UIColor)
    {
        let textFieldInsideSearchBar = self.value(forKey: "searchField") as? UITextField
        let glassIconView = textFieldInsideSearchBar?.leftView as? UIImageView
        glassIconView?.image = glassIconView?.image?.withRenderingMode(.alwaysTemplate)
        glassIconView?.tintColor = color
    }
}
