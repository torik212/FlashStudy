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
    var wordset: Wordsets
    @State private var showFavoritesOnly = false

    
    var cardsetIndex: Int {
        modelData.cardsets.firstIndex(where: {$0.id == cardset.id})!
    }
    var filteredCardsets: [Cardset] {
        modelData.cardsets.filter { cardset in
            (!showFavoritesOnly || cardset.isFavorite)
        }
    }
//    var wordsetIndex: Int {
//        modelData.cardset.wordset.firstIndex(where: {$0.id == wordset.id})!
////        modelData.cardsets.wordset.firstIndex(where:{$0.id == wordset.id})!
//    }
    
//    var bothIndex: (outer: Int?, inner: Int?) {
//        guard let outerIndex: Int = arr.firstIndex(where: { $0.contains(where: { $0.0 == "dd"}) }) else {
//            assertionFailure()
//            return (nil,nil)
//        }
//
//        let innerIndex: Int? = arr[outerIndex].firstIndex(where: { $0.0 == "dd"})
//        return (outerIndex, innerIndex)
//    }
    
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
                    //Text(cardset.park)
                        //.font(.subheadline)
                    Spacer()
                    //Text(cardset.state)
                      //  .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()

                //Text("About \(cardset.name)")
                  //  .font(.title2)
                Text(cardset.description)
                Text("About \(cardset.coordinates.latitude)")
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
        WordsetDetail(cardset: modelData.cardsets[0], wordset: modelData.cardsets[0].wordset[0])
            .environmentObject(modelData)
    }
}
