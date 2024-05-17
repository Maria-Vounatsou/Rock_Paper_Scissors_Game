//
//  ContentView.swift
//  Challenge_R.P.S
//
//  Created by Maria Vounatsou on 23/4/24.
//

import SwiftUI

struct ContentView: View {
    
   // @State private var options = ["rockP", "paperP", "scissorP"]
    @State private var options = ["rock", "paper", "scissors"]
    @State private var userChoise = 0
    @State private var computerChoise = 0
    @State private var score = 0
    @State private var drawCount = 0
    @State private var result = ""
    @State private var showComputerChoice = false
    @State private var tappedTimes = 0
    @State private var boolAlert = false
    
    func duel(_ userChoise: Int, _ computerChoise: Int ) -> String {
        
        switch (userChoise, computerChoise) {
        case (0,0): result = "Draw"
            drawCount += 1
        case (0,1): result = "You lost"
            score -= 1
        case (0,2): result = "You won"
            score += 1
        case(1,0): result = "You won"
            score += 1
        case(1,1): result = "Draw"
            drawCount += 1
        case(1,2): result = "You lost"
            score -= 1
        case(2,0): result = "You lost"
            score -= 1
        case(2,1): result = "You won"
            score += 1
        case(2,2): result = "Draw"
            drawCount += 1
        default:
            return ""
        }
        return result
    }
    
    
    var body: some View {
        ZStack {
            Image("cloredRoom")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Spacer()
                
                Text("Try Your Luck")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(Color("ColorB"))
                Spacer()
                
                HStack {
                    Spacer()
                    ForEach(0..<3) { option in
                        Button() {
                            imageTapped(option)
                            
                        } label: {
                            Choices(choice: options[option])
                        }
                    }
                    Spacer()
                }
                Spacer()
                
                Text("System's Choice : ")
                if showComputerChoice {
                    Choices(choice: options[computerChoise])
                }
                Spacer()
                Text("""
                        Result: \(result)
                        Score: \(score)
                        Draws: \(drawCount)
                    """)
                Spacer()
            }
            .foregroundColor(Color("ColorG"))
            .fontWeight(.heavy)
            
        }
        .alert("The game is over", isPresented: $boolAlert) {
            Button("Restart", action: endGame)
        } message: {
            Text("Your final score is \(score)")
                .fontWeight(.bold)
        }
    }
    
    func imageTapped(_ option: Int) {
        showComputerChoice = true
        userChoise = option
        computerChoise = Int.random(in: 0..<3)
        duel(userChoise, computerChoise)
        tappedTimes += 1
        
        if tappedTimes == 10 {
            boolAlert = true
        }
    }
    
    func endGame () {
        tappedTimes = 0
        score = 0
        drawCount = 0
        userChoise = 0
        showComputerChoice = false
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
