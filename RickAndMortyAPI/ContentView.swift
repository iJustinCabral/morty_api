//
//  ContentView.swift
//  RickAndMortyAPI
//
//  Created by Justin Cabral on 12/27/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = CharacterViewModel(service: CharacterService())
    
    var body: some View {
        NavigationStack {
            switch vm.state {
            case .success(let data):
                List {
                    ForEach(data, id: \.id) { item in
                        NavigationLink(value: item) {
                            HStack {
                                AsyncImage(url: URL(string: item.image)) { phase in
                                    if let image = phase.image {
                                        image
                                            .resizable()
                                            .scaledToFit()
                                    }
                                }
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .fontWeight(.black)
                                    Text(item.status)
                                        .font(.caption)
                                        .fontWeight(.light)
                                }
                                
                            }
                        }
                    }
                }
                .navigationTitle("Characters")
            case .loading:
                ProgressView()
            default:
                EmptyView()
            }
        }
        .task {
            await vm.getCharacters()
        }
        .alert("Error", isPresented: $vm.hasError, presenting: vm.state) { detail in
            Button("Retry") {
                Task {
                    await vm.getCharacters()
                }
            }
        } message: { detail in
            if case let .failed(error) = detail {
                Text(error.localizedDescription)
            }
        }
        .navigationDestination(for: Character.self) { character in
            Text(character.name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
