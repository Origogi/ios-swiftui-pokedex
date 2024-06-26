//
//  Fonts.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 4/28/24.
//

import Foundation
import SwiftUI

enum CustomFont {
    case title1
    case title2
    case title3
    case title4
    case caption1
    case caption2
    case caption3
    case caption4
    case desc

    var font: Font {
        switch self {
        case .title1:
            return Font.custom("Poppins-Semibold", size: 20)
        case .title2:
            return Font.custom("Poppins-Semibold", size: 18)
        case .title3:
            return Font.custom("Poppins-Semibold", size: 16)
        case .title4:
            return Font.custom("Poppins-Semibold", size: 12)
        case .caption1:
            return Font.custom("Poppins-Medium", size: 32)
        case .caption2:
            return Font.custom("Poppins-Medium", size: 16)
        case .caption3:
            return Font.custom("Poppins-Semibold", size: 14)
        case .caption4:
            return Font.custom("Poppins-Medium", size: 12)
        case .desc:
            return Font.custom("Poppins-Regular", size: 14)
        }
    }

    var defaultColr: Color {
        switch self {
        case .title1:
            return gray800
        case .title2:
            return gray800
        case .title3:
            return gray800
        case .title4:
            return gray800
        case .caption1:
            return Color.black
        case .caption2:
            return gray800
        case .caption3:
            return Color.black
        case .caption4:
            return Color.black
        case .desc:
            return gray700
        }
    }
}

struct CustomTextStyle: ViewModifier {
    let font: Font
    let color: Color

    func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundColor(color)
    }
}

extension View {
    func customTextStyle(font: CustomFont, color: Color? = nil) -> some View {
        let fontColor = color ?? font.defaultColr
        return modifier(CustomTextStyle(font: font.font, color: fontColor))
    }
}
