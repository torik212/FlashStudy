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
    let studySet: String
    var cardsetData: [Cardset] {
        if studySet == "English Test 1" {
            return load("cardData2.json")
        } else if studySet == "Biology 1"{
            return load("cardData.json")
        } else if studySet == "Spanish Test3"{
            return load("cardData3.json")
        } else if studySet == "Cards 4"{
            return load("cardData.json")
        }else{
            return load("cardData.json")
        }
    }

    var filteredCardsets: [Cardset] {
           cardsetData.filter { cardset in
               (!showFavoritesOnly || cardset.isFavorite)
           }
       }

    var body: some View {
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
            .navigationTitle(studySet)
    }
}

struct CardsetList_Previews: PreviewProvider {
    static var previews: some View {
        CardsetList(studySet: "English Test 1")
            .environmentObject(ModelData())
    }
}


