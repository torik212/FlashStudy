//
//  NoteCardFlip.swift
//  FStudy
//
//  Created by Tori Kestel on 2/13/23.
//

import SwiftUI

struct NoteCardFlip: View {
    @State private var showDetails = false
    var cardset: Cardset
    @State var counter = 0

    var body: some View {
        ZStack(alignment: .top) { // << made explicit alignment to top
            HStack { // << moved this up to ZStack
                Text("Click on word to see definition")
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .frame(minWidth: 10, maxWidth: .infinity, minHeight: 150)
                    .font(.body)
            }
            .frame(minWidth: 0, maxHeight: 400, alignment: .topLeading)
            VStack(spacing: 0) {
                // let y = cardset.name
                VStack {
                    Button(cardset.name) {
                        showDetails.toggle()
                    }
                    .fontWeight(.light)
                    .font(.title)
                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 50)
                    .padding(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                    
                    
                    if showDetails {
                        Text(cardset.description)
                            .font(.largeTitle)
                            .fontWeight(.light)
                            .font(.title)
                            .foregroundColor(Color.black)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 50)
                    }
                    
                }
                
                VStack {
                    //Text("Counter value: \(self.counter)")
                        //.foregroundColor(.blue)
                    //NoteCardFlip(cardsets[4])
                    Button(action: {
                        self.counter += 1
                    }) {
                        HStack {
                            Image(systemName: "")
                            Text("Next Word")
                        }
                        .padding(10.0)
                        .overlay(
                        RoundedRectangle(cornerRadius: 10.0)
                            .stroke(lineWidth: 2.0)
                        )
                    }
                    
                }
               //UIrec Corner
            }
            .foregroundColor(Color.black.opacity(0.7))
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
            .offset(x: 0, y: 0)
        
        }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
            .background(Color.purple.opacity(0.09))
            .edgesIgnoringSafeArea(.all)
            }

}



struct NoteCardFlip_Previews: PreviewProvider {
    static var cardsets = ModelData().cardsets
    static var previews: some View {
        Group{
            NoteCardFlip(cardset: cardsets[0])
            NoteCardFlip(cardset: cardsets[1])
        }
    }
}
func NextWord(){
    
}

