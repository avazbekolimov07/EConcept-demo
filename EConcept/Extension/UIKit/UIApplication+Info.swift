//
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import UIKit

extension UIApplication {

    var installIdentity: String {
        return UUID().uuidString
    }

    var shortVersion: String {
        guard let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else { return "" }
        return version
    }

    var buildVersion: String {
        guard let version = Bundle.main.infoDictionary?["CFBundleVersion"] as? String else { return "" }
        return version
    }

    var bundleName: String {
        guard let name = Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String else { return "" }
        return name
    }

    var bundleLocale: String {
        guard let locale = Bundle.main.preferredLocalizations.first else { return "" }
        return locale
    }

}
