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
        CardsetRow(cardset: cardsets[0])
    }
}
