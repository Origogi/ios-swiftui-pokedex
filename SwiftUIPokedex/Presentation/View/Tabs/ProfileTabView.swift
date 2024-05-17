//
//  ProfileTabView.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/23/24.
//

import SwiftUI

struct ProfileTabView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Image("Profile")
                    .resizable()
                    .frame(width: 44, height: 44)
                Text("Anonymous")
                    .customTextStyle(font: .title2)
                Spacer()
            }
            .padding(.vertical, 12)

            Divider()
                .padding(.bottom, 24)

            Text("Account Information")
                .customTextStyle(font: .title3, color: .black)
                .padding(.bottom, 16)

            Text("Name")
                .customTextStyle(font: .caption3, color: gray800)
            Text("Anonymous")
                .customTextStyle(font: .desc, color: gray700)
                .padding(.bottom, 12)

            Text("Email")
                .customTextStyle(font: .caption3, color: gray800)
            Text(verbatim: "anonymous@test.com")
                .customTextStyle(font: .desc, color: gray700)
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    ProfileTabView()
}
