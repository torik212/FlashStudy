//
//  CardsRow.swift
//  FStudy
//
//  Created by Tori Kestel on 2/12/23.
//

import SwiftUI

struct CardsetRow: View {
    var cardset: Cardset
    
    var body: some View {
        HStack {
            Text(cardset.name)
            Spacer()
            if cardset.isFavorite{
                Image(systemName:"star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}


struct CardsetRow_Previews: PreviewProvider {
    static var cardsets = ModelData().cardsets
    static var previews: some View {
//        Group {
//            CardsetRow(cardset: cardsets[0])
//            CardsetRow(cardset: cardsets[1])
//            CardsetRow(cardset: cardsets[2])
//        }
        CardsetRow(cardset: cardsets[0])
           // .environmentObject(ModelData())
           // .previewLayout(.fixed(width:300, height: 70))
    }
}
