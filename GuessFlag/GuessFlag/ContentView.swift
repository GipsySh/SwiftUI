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
    @State private var score: Int = 0
    
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)],
                           center: .top,
                           startRadius: 200.0,
                           endRadius: 700.0)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .foregroundColor(.white)
                    .font(.largeTitle.weight(.bold))
                
                VStack(spacing: 15.0) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text("\(countries[correctAnswer])")
                            .foregroundStyle(.secondary)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach ((0..<3), content: { number in
                        Button {
                            flagButtonTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .cornerRadius(12.0)
                                .shadow(radius: 10.0)
                        }
                    })
                }
                .frame(maxWidth: .infinity)
                .padding(20.0)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20.0))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showScore) {
            Button("Continue", action: generateQuestion)
        } message: {
            Text("Your score is \(score)")
        }
    }
    
    func flagButtonTapped(_ number: Int) {
        scoreTitle = (number == correctAnswer) ? "Correct" : "Wrong! That's the flag of \(countries[number])"
        score += (number == correctAnswer) ? 1 : 0
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
