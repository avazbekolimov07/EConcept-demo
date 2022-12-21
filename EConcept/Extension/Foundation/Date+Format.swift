//
//  DateFormatter+Extensions.swift
//  EConcept
//
//  Created by AvazbekOS on 18/12/22.
//

import Foundation

enum DateFormat: String {
    case HHmm = "HH:mm"
    case yyyyMMdd = "yyyy-MM-dd"
    case ddMMMMyyyy = "dd MMMM yyyy"
    case ddMMMMyyyyHHmm = "dd MMMM yyyy HH:mm"
    case ddE = "dd E"
    case yyyyMMddHHmmss = "yyyy-MM-dd HH:mm:ss"
    case yyyyMMddHHmmssZ = "yyyy-MM-dd HH:mm:ss Z"
    case ddMMMM = "dd MMMM"
	case ddMMM = "dd MMM"
    case MMMMyyyy = "MMMM yyyy"
	case ddMMMMMyyyy·HHmm = "dd MMMM yyyy '·' HH:mm"
	case ddMMM·HHmm = "dd MMM '·' HH:mm"
    case z = "Z"
	case ddMMyyyyWithDots = "dd.MM.yyyy"
	case ddMMyyWithDots = "dd.MM.yy"
    case MMM
    case dMMMMEEEE = "d MMMM, EEEE"
    case EEEEEE
    case d
    case yyyy
}

