//
//  CommonData.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 5/12/24.
//

import Foundation

struct UrlData : Decodable {
  let url : String
}

struct NameUrlData : Decodable {
  let name : String
  let url : String
}
