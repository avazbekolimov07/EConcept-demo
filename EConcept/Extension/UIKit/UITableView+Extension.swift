//
//  UITableView+Extension.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import UIKit

extension UITableView {

    func setupSeparator(separatorStyle: UITableViewCell.SeparatorStyle, reference: UITableView.SeparatorInsetReference = .fromCellEdges, insets: UIEdgeInsets = .zero, color: UIColor = .lightGray) {
        self.separatorStyle = separatorStyle
        separatorInsetReference = reference
        separatorInset = insets
        separatorColor = color

        if separatorStyle != .none {
            tableFooterView = UIView(frame: .zero)
        }
    }

//    func setNoDataPlaceholder(_ attributedMessage: NSAttributedString) {
//        let view = UIView(frame: .init(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height))
//        view.backgroundColor = .clear
//
//        let label = UILabel(frame: .zero)
//
//        label.numberOfLines = 0
//        label.attributedText = attributedMessage
//        label.sizeToFit()
//        view.addSubview(label)
//
//        label.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(40)
//            $0.leading.trailing.equalToSuperview().inset(20)
//        }
//
//        isScrollEnabled = false
//        backgroundView = view
//    }
//
//    func removeNoDataPlaceholder() {
//        isScrollEnabled = true
//        backgroundView = nil
//    }

}
