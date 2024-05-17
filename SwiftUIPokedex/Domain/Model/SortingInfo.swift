//
//  SortingInfo.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 4/30/24.
//

import Foundation

enum SortingInfo: CaseIterable {
    case idAscending
    case idDescending
    case nameAscending
    case nameDescending

    var title: String {
        switch self {
        case .idDescending: return "Largest number"
        case .idAscending: return "Smallest number"
        case .nameDescending: return "Z-A"
        case .nameAscending: return "A-Z"
        }
    }
}
