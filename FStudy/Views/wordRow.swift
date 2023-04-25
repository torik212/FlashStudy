//
//  wordRow.swift
//  FStudy
//
//  Created by Tori Kestel on 3/20/23.
//

import SwiftUI

struct WordRow: View {
    var cardset: Cardset
    var body: some View {
        HStack {
            Text(cardset.name)
            Spacer()
        }
    }
}


struct WordRow_Previews: PreviewProvider {
    static var cardsets = ModelData().cardsets
    static var previews: some View {
        WordRow(cardset:cardsets[0])
    }
}
