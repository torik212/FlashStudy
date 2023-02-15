//
//  CardsList.swift
//  FStudy
//
//  Created by Tori Kestel on 2/12/23.
//

import SwiftUI

struct CardsetList: View {
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
                        CardsetDetail(cardset: cardset)
                    } label: {
                        CardsetRow(cardset: cardset)
                    }
                }
            }
            .navigationTitle("Cardsets")
        }
    }
}

struct CardsetList_Previews: PreviewProvider {
    static var previews: some View {
        CardsetList()
            .environmentObject(ModelData())
    }
}

