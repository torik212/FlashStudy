//
//  StudyList.swift
//  FStudy
//
//  Created by Tori Kestel on 4/23/23.
//

import SwiftUI

struct StudyList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var studySets = ["Biology 1", "English Test 1", "Spanish Test3", "Cards 4"]

    var body: some View {
        NavigationView {
            List {
                ForEach(studySets, id: \.self) { studySet in
                    NavigationLink(destination: CardsetList(studySet: studySet)) {
                        Text(studySet)
                    }
                }
                .onDelete { offsets in
                    studySets.remove(atOffsets: offsets)
                }
            }
            .navigationTitle("Study Sets")
        }
    }
}

struct StudyList_Previews: PreviewProvider {
    static var previews: some View {
        StudyList()
    }
}
