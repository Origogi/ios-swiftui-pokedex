//
//  IntExt.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/3/24.
//

import Foundation

extension Int {
    func pokemonNum() -> String {
        return String(format: "Nº%03d", self)
    }
}
