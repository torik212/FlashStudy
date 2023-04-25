//
//  WordsDetail.swift
//  FStudy
//
//  Created by Tori Kestel on 3/7/23.
//

import SwiftUI

struct WordsetDetail: View {
    @EnvironmentObject var modelData: ModelData
    var cardset: Cardset
    @State private var showFavoritesOnly = false

    
    var cardsetIndex: Int {
        modelData.cardsets.firstIndex(where: {$0.id == cardset.id})!
    }
    var filteredCardsets: [Cardset] {
        modelData.cardsets.filter { cardset in
            (!showFavoritesOnly || cardset.isFavorite)
        }
    }
    var body: some View {
        ScrollView {
            NavigationView {
                List {
                        ForEach(filteredCardsets) { cardset in
                            NavigationLink {
                            } label: {
                                CardsetRow(cardset: cardset)
                            }
                        }
                }
                .navigationTitle("Cardsets")
            }
            VStack(alignment: .leading) {
                HStack {
                    Text(cardset.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.cardsets[cardsetIndex].isFavorite)
                }
                HStack {
                    Spacer()
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                Text(cardset.description)

            }
            .padding()
        }
        .navigationTitle(cardset.name)
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
}

struct WordsetDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        WordsetDetail(cardset: modelData.cardsets[0])
    }
}
