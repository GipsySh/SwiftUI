//
//  ContentView.swift
//  GuessFlag
//
//  Created by Yulia on 10.02.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var scoreTitle = ""
    @State private var showScore = false
    
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    
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
                        flagButtonTapped(number)
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                    }
                })
            }
        }
        .alert(scoreTitle, isPresented: $showScore) {
            Button("Continue", action: generateQuestion)
        } message: {
            Text("Your score is ???")
        }
    }
    
    func flagButtonTapped(_ number: Int) {
        scoreTitle = (number == correctAnswer) ? "Correct" : "Wrong"
        showScore = true
    }
    
    func generateQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
