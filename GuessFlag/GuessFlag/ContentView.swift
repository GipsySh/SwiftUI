//
//  ContentView.swift
//  GuessFlag
//
//  Created by Yulia on 10.02.2022.
//

import SwiftUI

struct ContentView: View {
    let countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack(spacing: 30.0) {
                VStack {
                    Text("Select the flag of")
                        .foregroundColor(.white)
                    Text("\(countries[correctAnswer])")
                        .foregroundColor(.white)
                }
                
                ForEach ((0..<3), content: { number in
                    Button {
                        // buton was tapped
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                    }
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
