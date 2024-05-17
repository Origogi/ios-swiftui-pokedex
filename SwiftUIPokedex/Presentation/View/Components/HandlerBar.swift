//
//  HandlerBar.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 4/29/24.
//

import SwiftUI

struct HandlerBar: View {
    var body: some View {
        Rectangle()
            .fill(gray100)
            .frame(width: 38, height: 4)
            .cornerRadius(20)
            .padding(.top, 12)
            .padding(.bottom, 9)
    }
}

#Preview {
    HandlerBar()
}
