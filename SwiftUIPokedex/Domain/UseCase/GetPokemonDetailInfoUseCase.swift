//
//  GetPokemonDetailInfoUseCase.swift
//  SwiftUIPokedex
//
//  Created by 김정태 on 3/31/24.
//

import Foundation

class GetPokemonDetailInfoUseCase {
    private let pokemonDetailDataRepository: PokemonDetailDataRepository = .init()
    private let pokemonSpeciesDataRepository: PokemonSpeciesDataRepository = .init()
    private let pokemonTypeDataRepository: PokemonTypeDataRepository = .init()
    private let pokemonEvolutionChainDataRepository: PokemonEvolutionChainDataRepository = .init()
    private let pokemonWeaknessDataRepository: PokemonWeaknessTypesRepository = .shared

    func execute(id: Int) async -> PokemonDetailInfo {
        let detailData = await pokemonDetailDataRepository.get(id: id)!
        let speciesData = await pokemonSpeciesDataRepository.get(id: id)

        let mainType = PokemonTypeInfo(rawValue: detailData.types[0].type.name.capitalized)!

        var weaknessTypes = pokemonWeaknessDataRepository.get(from: mainType)
        if weaknessTypes == nil {
            let typeData = await pokemonTypeDataRepository.get(type: mainType.name.lowercased())
            weaknessTypes = typeData.damageRelations.doubleDamageFrom.map { PokemonTypeInfo(rawValue: $0.name.capitalized)! }
            pokemonWeaknessDataRepository.set(weaknesses: weaknessTypes!, for: mainType)
        } else {
            print("Weaknesses loaded from cache")
        }

        let evolutionChainData = await pokemonEvolutionChainDataRepository.get(from: speciesData.evolutionChain.url)

        let evolutionChain =
            (await extractEvolutions(from: evolutionChainData.chain)) ??
            EvolutionChain(
                cardInfo: PokemonCardInfo(
                    id: id, name: detailData.name.capitalized,
                    imagePath: detailData.sprites.versions.generationVII.icons.frontDefault,
                    types: detailData.types.map {
                        PokemonTypeInfo(rawValue: $0.type.name.capitalized) ?? .normal
                    }
                )
            )

        return PokemonDetailInfo(
            id: detailData.id,
            name: detailData.name.capitalized,
            weight: detailData.weight / 10.0,
            height: detailData.height / 10.0,
            category: extractPokemonPrefix(from: speciesData.englishGenus),
            abilities: detailData.abilities.map { $0.ability.name.capitalized },
            description: speciesData.englishFlavorText.replacingOccurrences(of: "\n", with: " "),
            types: detailData.types.map {
                PokemonTypeInfo(rawValue: $0.type.name.capitalized) ?? .normal
            },
            genderRatio: speciesData.genderRateFraction,
            weaknesses: weaknessTypes ?? [],
            evolutionChain: evolutionChain,
            animatedImageUrl: detailData.sprites.other.showdown.frontDefault
        )
    }

    private func extractEvolutions(from chain: ChainData?) async -> EvolutionChain? {
        var evolutionChain: EvolutionChain?

        if let chain = chain {
            if let id = extractId(from: chain.species.url) {
                let pokemonDetailData = await pokemonDetailDataRepository.get(id: id)

                let pokemonCardInfo = PokemonCardInfo(
                    id: id,
                    name: pokemonDetailData?.name.capitalized ?? "",
                    imagePath: pokemonDetailData?.sprites.versions.generationVII.icons.frontDefault ?? "",
                    types: pokemonDetailData?.types.map { PokemonTypeInfo(rawValue: $0.type.name.capitalized) ?? .normal } ?? []
                )
                let nextChain = await extractEvolutions(from: chain.evolvesTo.first)

                evolutionChain = EvolutionChain(cardInfo: pokemonCardInfo, next: nextChain)
            }
        }

        return evolutionChain
    }

    private func extractPokemonPrefix(from text: String) -> String {
        let pattern = "^(.+) Pokémon$"
        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        let matches = regex?.matches(in: text, options: [], range: NSRange(location: 0, length: text.utf16.count))

        if let match = matches?.first {
            if let range = Range(match.range(at: 1), in: text) {
                return String(text[range])
            }
        }

        return ""
    }

    func extractId(from urlString: String) -> Int? {
        let pattern = "/(\\d+)/?$"
        guard let regex = try? NSRegularExpression(pattern: pattern) else {
            return nil
        }

        let nsString = urlString as NSString
        let results = regex.matches(in: urlString, range: NSRange(location: 0, length: nsString.length))

        if let match = results.last, // 가장 마지막 결과를 사용
           let range = Range(match.range(at: 1), in: urlString)
        {
            return Int(urlString[range])
        }
        return nil
    }
}
