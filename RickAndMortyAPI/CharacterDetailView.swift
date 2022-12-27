//
//  CharacterDetailView.swift
//  RickAndMortyAPI
//
//  Created by Justin Cabral on 12/27/22.
//

import SwiftUI

struct CharacterDetailView: View {
        
    let character: Character
    
    var body: some View {
        
        VStack {
            ZStack(alignment: .bottomTrailing) {
                AsyncImage(url: URL(string: character.image)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .mask(LinearGradient(gradient: Gradient(stops: [
                                .init(color: .black, location: 0),
                                .init(color: .clear, location: 1),
                                .init(color: .black, location: 1),
                                .init(color: .clear, location: 1)
                            ]), startPoint: .top, endPoint: .bottom))
                    }
                }
                
                InfoBar(character: character)
            }
            
            Form {
                Section("Details") {
                    
                    HStack {
                        Text("Episodes: ")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("\(character.episode.count)")
                    }
                    
                    HStack {
                        Text("Location: ")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("\(character.location.name)")
                    }
                    
                    HStack {
                        Text("Origin: ")
                            .fontWeight(.semibold)
                        Spacer()
                        Text("\(character.origin.name)")
                    }
                    
                    HStack {
                        Text("Type: ")
                            .fontWeight(.semibold)
                        Spacer()
                        Text(character.type != "" ? "\(character.type)" : "none")
                    }
                    
                }
            }
            
           
        }
        .ignoresSafeArea()
        
    }
    
    @ViewBuilder
    func InfoBar(character: Character) -> some View {
        HStack {
            Text(character.name)
                .padding(6)
                .background(.black)
                .font(.caption)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .foregroundColor(.white)
                .offset(x: -5, y: -5)
                .fontWeight(.bold)
                
                                
            Text(character.status)
                .padding(6)
                .background(character.status == "Alive" ? .green : .red)
                .font(.caption)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .foregroundColor(.white)
                .offset(x: -5, y: -5)
                .fontWeight(.semibold)
            
            Text(character.species)
                .padding(6)
                .background(.blue)
                .font(.caption)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .foregroundColor(.white)
                .offset(x: -5, y: -5)
                .fontWeight(.semibold)
            
            Text(character.gender)
                .padding(6)
                .background(.gray)
                .font(.caption)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .foregroundColor(.white)
                .offset(x: -5, y: -5)
                .fontWeight(.semibold)
            
            Spacer()
        }
        .padding(20)
        .offset(y: 24)
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(character: Character(id: 1, name: "RICKY", image: "https://rickandmortyapi.com/api/character/avatar/361.jpeg", status: "Alive", type: "huh", species: "Human", gender: "Male", episode: ["test episode 1", "test episode 2"], location: Location(name: "Earth", url: ""), origin: Origin(name: "Episode 1", url: "")))
    }
}
