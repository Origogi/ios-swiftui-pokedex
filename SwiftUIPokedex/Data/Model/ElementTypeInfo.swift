//
//  ElementTypeInfo.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/23/24.
//

import Foundation
import SwiftUI

enum ElementTypeInfo : CaseIterable {
  case normal
  case fire
  case water
  case electric
  case grass
  case ice
  case fighting
  case poison
  case ground
  case flying
  case psychic
  case bug
  case rock
  case ghost
  case dragon
  case dark
  case steel
  case fairy
  
  var textColorOnPrimaryColorBg : Color {
    switch self {
    case .normal: return Color.black
    case .fire: return Color.white
    case .water: return Color.white
    case .electric: return Color.black
    case .grass: return Color.black
    case .ice: return Color.black
    case .fighting: return Color.white
    case .poison: return Color.white
    case .ground: return Color.black
    case .flying: return Color.black
    case .psychic: return Color.white
    case .bug: return Color.black
    case .rock: return Color.black
    case .ghost: return Color.white
    case .dragon: return Color.white
    case .dark: return Color.white
    case .steel: return Color.black
    case .fairy: return Color.black
    }
  }
  

  
  var primaryColorHexCode: String {
    switch self {
    case .normal: return "#919AA2"
    case .fire: return "#FF9D55"
    case .water: return "#5090D6"
    case .electric: return "#F4D23C"
    case .grass: return "#63BC5A"
    case .ice: return "#73CEC0"
    case .fighting: return "#CE416B"
    case .poison: return "#B567CE"
    case .ground: return "#D97845"
    case .flying: return "#89AAE3"
    case .psychic: return "#FA7179"
    case .bug: return "#91C12F"
    case .rock: return "#C5B78C"
    case .ghost: return "#5269AD"
    case .dragon: return "#0B6DC3"
    case .dark: return "#5A5465"
    case .steel: return "#5A8EA2"
    case .fairy: return "#EC8FE6"
    }
  }
  
  var primaryColor: Color {
    return Color(hex: primaryColorHexCode)
  }
  
  
  var secondColorHexCode: String {
    switch self {
    case .normal: return "#F1F2F3"
    case .fire: return "#FCF3EB"
    case .water: return "#EBF1F8"
    case .electric: return "#FBF8E9"
    case .grass: return "#EDF6EC"
    case .ice: return "#F1FBF9"
    case .fighting: return "#F8E9EE"
    case .poison: return "#F5EDF8"
    case .ground: return "#F9EFEA"
    case .flying: return "#F1F4FA"
    case .psychic: return "#FCEEEF"
    case .bug: return "#F1F6E8"
    case .rock: return "#F7F5F1"
    case .ghost: return "#EBEDF4"
    case .dragon: return "#E4EEF6"
    case .dark: return "#ECEBED"
    case .steel: return "#ECF1F3"
    case .fairy: return "#FBF1FA"
    }
  }
  
  var name: String {
    switch self {
    case .normal: return "Normal"
    case .fire: return "Fire"
    case .water: return "Water"
    case .electric: return "Electric"
    case .grass: return "Grass"
    case .ice: return "Ice"
    case .fighting: return "Fighting"
    case .poison: return "Poison"
    case .ground: return "Ground"
    case .flying: return "Flying"
    case .psychic: return "Psychic"
    case .bug: return "Bug"
    case .rock: return "Rock"
    case .ghost: return "Ghost"
    case .dragon: return "Dragon"
    case .dark: return "Dark"
    case .steel: return "Steel"
    case .fairy: return "Fairy"
    }
  }
  
  var secondaryColor: Color {
    return Color(hex: secondColorHexCode)
  }
  
  var bigImagePath : String {
    return self.name + "Big"
  }
  
  var smallImagePath : String {
    return self.name + "Small"
  }
}
