//
//  ClassIdentifiable.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

protocol ClassIdentifiable {
    static var reuseId: String { get }
}

extension ClassIdentifiable {

    static var reuseId: String {
        return String(describing: self)
    }

}
