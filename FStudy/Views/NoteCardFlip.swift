//
//  NoteCardFlip.swift
//  FStudy
//
//  Created by Tori Kestel on 2/13/23.
//

import SwiftUI

struct NoteCardFlip: View  {
    static var cardsets = ModelData().cardsets
    @EnvironmentObject var modelData: ModelData
    @State private var showDetails = false
    @State private var counter = 0 // << declare counter as a State variable
    @State private var cardsetData: [Cardset] = NoteCardFlip.cardsets
    var cardset: Cardset {
        return cardsetData[counter % cardsetData.count]
    } // << access the next cardset using the counter
    
    let menuItems = ["Biology 1", "English Test 1", "Spanish Test3", "Cards 4"]
        @State private var selectedMenuItem = "Biology 1" // default selected menu item
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment: .center, spacing: 0.0) {
                HStack(alignment:.top){
                    Menu {
                        Text("Select Cardset")
                        ForEach(menuItems, id: \.self) { item in
                            Button(item) {
                                self.selectedMenuItem = item
                                if (item == "English Test 1"){
                                    cardsetData = load("cardData2.json")
                                    counter = 0 // reset the counter to start from the beginning of the new cardset
                                    showDetails = false
                                }else if (item == "Spanish Test3"){
                                    cardsetData = load("cardData3.json")
                                    counter = 0
                                    showDetails = false
                                }else if (item == "Biology 1"){
                                    cardsetData = load("cardData.json")
                                    counter = 0
                                    showDetails = false
                                }
                            }
                        }
                        
                    } label: {
                        Text(selectedMenuItem)
                    }
                    .font(.title2)
                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 50)
                    .padding(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                    
                }
                .padding(.top, -300.0)
                
                Button(cardset.name) {
                    showDetails.toggle()
                }
                .fontWeight(.light)
                .font(.title)
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 50)
                .padding(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                if showDetails {
                    Text(cardset.description)
                        //.font(.title3)
                        .fontWeight(.light)
                        .font(.body)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: 420)
                }
                
            }
            .padding(-80.0)
        }
        .foregroundColor(Color.black)
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
        .offset(x: 0, y: 0)
        .background(Color(hue: 0.733, saturation: 0.074, brightness: 0.935))
        .gesture(DragGesture(minimumDistance: 10, coordinateSpace: .global)
                    .onEnded({ value in
                        if value.translation.width < 0 { // swipe left
                            if counter < NoteCardFlip.cardsets.count - 1 {
                                counter += 1
                                showDetails = false
                            }
                        } else if value.translation.width > 0 { // swipe right
                            if counter > 0 {
                                counter -= 1
                                showDetails = false
                            }
                        }
                    }) )
        
    }
}
struct NoteCardFlip_Previews: PreviewProvider {
    static var cardsets = ModelData().cardsets
    static var counter = 0
    static var previews: some View {
        NoteCardFlip()
            .environmentObject(ModelData())
            .onAppear {
                counter = 0
            }
    }
}

