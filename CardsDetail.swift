//
//  CardsDetail.swift
//  FStudy
//
//  Created by Tori Kestel on 2/12/23.
//

import SwiftUI

struct CardsetDetail: View {
    @EnvironmentObject var modelData: ModelData
    var cardset: Cardset
    
    var cardsetIndex: Int {
        modelData.cardsets.firstIndex(where: {$0.id == cardset.id})!
    }
    
    var body: some View {
        ScrollView {
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
            }
            .padding()
        }
        .navigationTitle(cardset.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CardsetDetail_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        CardsetDetail(cardset: modelData.cardsets[0])
            .environmentObject(modelData)
    }
}
