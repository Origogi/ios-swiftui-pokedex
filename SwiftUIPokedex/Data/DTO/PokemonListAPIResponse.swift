//
//  PokemonListItemData.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 5/8/24.
//

import Foundation


// API 응답 전체 구조를 위한 구조체
struct PokemonListAPIResponse: Decodable {
  let count: Int
  let next: String?
  let previous: String?
  let results: [Pokemon]
}

struct Pokemon: Decodable {
  let name: String
  let url: String
}

