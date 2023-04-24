//
//  StudyList.swift
//  FStudy
//
//  Created by Tori Kestel on 4/23/23.
//

import SwiftUI

struct StudyList: View {
    @EnvironmentObject var modelData: ModelData
    var [studySet] string
    var body: some View {
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
            //Text("About \(cardset.coordinates.latitude)")
            //Text("\(cardset.wordset.debugDescription)")
            //Text("\(cardset.wordset[0].word1)")
        }
        
        .padding()
    }
    .navigationTitle(cardset.name)
    .navigationBarTitleDisplayMode(.inline)
}
    }
}

struct StudyList_Previews: PreviewProvider {
    static var previews: some View {
        StudyList()
    }
}
