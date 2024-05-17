//
//  StatusGroupView.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/5/24.
//

import SwiftUI

struct StatusGroupView: View {
    let weight: Double
    let height: Double
    let category: String
    let abilities: [String]

    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                StatusView(
                    statusName: "Weight",
                    value: "\(weight) kg",
                    iconPath: "Weight"
                )

                StatusView(
                    statusName: "Height",
                    value: "\(height) m",
                    iconPath: "Height"
                )
            }

            HStack(alignment: .top, spacing: 20) {
                StatusView(
                    statusName: "Category",
                    value: category,
                    iconPath: "Category"
                )

                StatusView(
                    statusName: "Abilities",
                    value: abilities.joined(separator: " "),
                    iconPath: "Abilities"
                )
            }
        }
    }
}

#Preview {
    StatusGroupView(
        weight: 12.5,
        height: 0.6,
        category: "Seed",
        abilities: ["Overgrow", "Chlorophyll"]
    )
}

private struct StatusView: View {
    let statusName: String
    let value: String
    let iconPath: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 6) {
                Image(iconPath)
                    .resizable()
                    .frame(width: 20, height: 20)
                Text(statusName)
                    .customTextStyle(font: .caption4, color: gray800)
            }
            HStack {
                Spacer()
                Text(value)
                    .customTextStyle(
                        font: .caption2,
                        color: Color.black.opacity(0.9)
                    )
                    .padding(.vertical, 8)

                Spacer()

            }.overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.black.opacity(0.1), lineWidth: 1)
            )
        }
    }
}
