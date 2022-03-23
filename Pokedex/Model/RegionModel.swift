//
//  RegionModel.swift
//  Pokedex
//
//  Created by Deraldo on 15/03/22.
//

import SwiftUI

struct Region: Codable {
    let id: Int
    let main_region: regionMain
    let pokemon_species: [regionPokemon]
    let version_groups: [regionGroups]
}

struct regionMain: Codable {
    let name: String
    let url: String
}

struct regionPokemon: Codable {
    let name: String
    let url: String
}

struct regionGroups: Codable {
    let name: String
    let url: String
}

//HOW TO DO BETTER?
class ApiRegion {
    func getRegionPokemon(completion: @escaping (regionMain) -> ()) async {
        guard let url = URL(string: "https://pokeapi.co/api/v2/generation/3") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
        
        if let decodedResponse = try? JSONDecoder().decode(Region.self, from: data) {
                completion(decodedResponse.main_region)
            }
        } catch {
           return
        }
    }
    
    func getRegionPokemon(completion: @escaping ([regionPokemon]) -> ()) async {
        guard let url = URL(string: "https://pokeapi.co/api/v2/generation/3") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
        
        if let decodedResponse = try? JSONDecoder().decode(Region.self, from: data) {
                completion(decodedResponse.pokemon_species)
            }
        } catch {
           return
        }
    }
    
    func getRegionGroups(completion: @escaping ([regionGroups]) -> ()) async {
        guard let url = URL(string: "https://pokeapi.co/api/v2/generation/3") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
        
        if let decodedResponse = try? JSONDecoder().decode(Region.self, from: data) {
                completion(decodedResponse.version_groups)
            }
        } catch {
           return
        }
    }
}
