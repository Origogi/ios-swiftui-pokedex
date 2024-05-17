//
//  PokemonDetailScreen.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 2/29/24.
//

import SwiftUI

struct PokemonDetailScreen: View {
    let pokemonId: Int
    @StateObject private var viewModel: PokemonDetailViewModel = .init()

    var body: some View {
        ZStack {
            if let pokemonInfo = viewModel.pokemonDetailInfo {
                ScrollView {
                    VStack(alignment: .leading) {
                        ZStack(alignment: .top) {
                            PartialCircle()
                                .frame(height: 280)

                            Image(pokemonInfo.mainType.smallImagePath)
                                .resizable()
                                .renderingMode(.template)
                                .foregroundStyle(
                                    LinearGradient(
                                        gradient: Gradient(colors: [.white, .white.opacity(0)]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .scaledToFit()
                                .padding(.top, 80)
                                .frame(width: 220, height: 250)

                            // 움직이는 이미지
                            VStack(alignment: .center) {
                                Spacer()
                                PokemonDetailImageView(
                                    imageUrl: pokemonInfo.animatedImageUrl,
                                    maxWidth: 400,
                                    maxHeight: 250
                                )
                                .padding(.top, 60)
                            }

                            // 탑 버튼
                            VStack {
                                HStack {
                                    BackButton(type: .v1)
                                    Spacer()
                                    BigFavButton(viewModel: FavoriteButtonViewModel(id: pokemonInfo.id))
                                }
                                .padding(.top, 60)
                                .padding(.horizontal, 16)
                                Spacer()
                            }
                        }
                        .foregroundColor(pokemonInfo.mainType.primaryColor)

                        VStack(alignment: .leading) {
                            Text(pokemonInfo.name)
                                .customTextStyle(font: .caption1)
                            Text(pokemonInfo.id.pokemonNum())
                                .customTextStyle(font: .caption2)
                            HStack(spacing: 7) {
                                ForEach(pokemonInfo.types, id: \.self) { type in
                                    PokemonTypeMediumChip(type: type, fontSize: 14, iconSize: 28, innerHPadding: 14, innerVPadding: 4)
                                }
                            }
                            Spacer()
                                .frame(height: 24)
                            Text(pokemonInfo.description)
                                .customTextStyle(font: .desc, color: gray800.opacity(0.8))
                            Divider()
                                .padding(.vertical, 16)
                            StatusGroupView(
                                weight: pokemonInfo.weight,
                                height: pokemonInfo.height,
                                category: pokemonInfo.category,
                                abilities: pokemonInfo.abilities
                            )
                            .padding(.bottom, 19)
                            GenderRatioView(ratio: pokemonInfo.genderRatio)
                                .padding(.bottom, 40)
                            WeaknessesView(types: pokemonInfo.weaknesses)
                                .padding(.bottom, 40)
                            EvolutionsInfoView(
                                evolutionChain: pokemonInfo.evolutionChain
                            )
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 10)
                        Spacer()
                    }
                }
                .transition(.opacity)
            } else {
                PlaceHolderView()
                    .transition(.opacity)
            }
        }
        .ignoresSafeArea(edges: .top)
        .animation(.easeInOut, value: viewModel.pokemonDetailInfo == nil)
        .navigationBarHidden(true)
        .onAppear {
            viewModel.load(pokemonId: pokemonId)
        }
    }
}

struct PartialCircle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let radius = rect.width * 0.7
        let center = CGPoint(x: rect.midX, y: rect.maxY - radius)

        path.addArc(center: center, radius: radius, startAngle: .degrees(0), endAngle: .degrees(180), clockwise: false)
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.closeSubpath()

        return path
    }
}

private struct PlaceHolderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .top) {
                PartialCircle()
                    .frame(height: 280)
                    .foregroundColor(.gray.opacity(0.5))
                    .shimmer()
                    .edgesIgnoringSafeArea(.top)
                // 탑 버튼
                VStack {
                    HStack {
                        BackButton(type: .v1)
                        Spacer()
                    }
                    .padding(.top, 60)
                    .padding(.horizontal, 16)
                }
            }
            VStack(alignment: .leading) {
                ShimmerView()
                    .frame(width: 120, height: 48)
                    .cornerRadius(8)
                ShimmerView()
                    .frame(width: 70, height: 22)
                    .cornerRadius(8)
                    .padding(.bottom, 24)
                ShimmerView()
                    .frame(width: 130, height: 36)
                    .cornerRadius(67)
                    .padding(.bottom, 24)
                ShimmerView()
                    .frame(height: 60)
                    .cornerRadius(8)
                Spacer()
            }
            .padding(.horizontal, 16)
            Spacer()
        }
    }
}

#Preview {
    VStack(alignment: .leading) {
        PlaceHolderView()
        Spacer()
    }
}

#Preview {
    PokemonDetailScreen(
        pokemonId: 1
    )
}
