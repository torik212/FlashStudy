//
//  WordsList.swift
//  FStudy
//
//  Created by Tori Kestel on 3/20/23.
//

import SwiftUI

struct WordsList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    var filteredCardsets: [Cardset] {
        modelData.cardsets.filter { cardset in
            (!showFavoritesOnly || cardset.isFavorite)
        }
    }
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredCardsets) { cardset in
                    NavigationLink {
                    } label: {
                        CardsetRow(cardset: cardset)
                    }
                }
            }
            .navigationTitle("Words")
        }
    }
}

struct WordsList_Previews: PreviewProvider {
    static var previews: some View {
        WordsList()
            .environmentObject(ModelData())
    }
}
