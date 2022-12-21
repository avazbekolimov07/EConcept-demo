//
//  Data+Extensions.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import Foundation

extension Data {

    var prettyPrintedJSONString: String? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted, .withoutEscapingSlashes]),
              let prettyPrintedString = String(data: data, encoding: .utf8) else { return nil }

        return prettyPrintedString
    }

}
