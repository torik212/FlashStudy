//
//  StudyChoice.swift
//  FStudy
//
//  Created by Tori Kestel on 5/9/23.
//

import SwiftUI


struct StudyChoice: View {
    @EnvironmentObject var modelData: ModelData
    let studyMethods = ["Multiple Choice", "Flashcards", "Memory"]
    
    var body: some View {
        NavigationView {
            VStack {
                ForEach(studyMethods, id: \.self) { method in
                    if method == "Flashcards" {
                        NavigationLink(destination: NoteCardFlip()) {
                            Text(method)
                                .font(.headline)
                                .foregroundColor(Color.black)
                                .padding()
                        }
                    } else if method == "Multiple Choice" {
                        NavigationLink(destination: GuessingGame()) {
                            Text(method)
                                .font(.headline)
                                .foregroundColor(Color.black)
                                .padding()
                        }
                    } else if method == "Memory" {
                        NavigationLink(destination: Studying()) {
                            Text(method)
                                .font(.headline)
                                .foregroundColor(Color.black)
                                .padding()
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hue: 0.733, saturation: 0.074, brightness: 0.935))
            .navigationTitle("Choose Study Method")
        }
    }
    
    
}

struct StudyChoice_Preview: PreviewProvider{
    static var cardsets = ModelData().cardsets
    static var counter = 0
    static var previews: some View {
        StudyChoice()
        .environmentObject(ModelData())
        .onAppear {
            counter = 0
            
        }
    }
}
