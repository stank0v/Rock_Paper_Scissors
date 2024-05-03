//
//  ContentView.swift
//  Game
//
//  Created by Hristo Stankov on 2.05.24.
//

import SwiftUI

struct ContentView: View {
    @State var move = ["Rock", "Paper", "Scissors"]
    @State var winningArray = ["paper", "scissors", "rock"]
    @State var loosingArray = ["scissors","rock", "paper"]
    @State var shouldWin = false
    @State var possibleMove = Int.random(in: 0...2)
    @State var result = "Rock, Paper, Scissors?"
    @State var textResult = "Let's play a game"
    @State var score = 0
    @State var counter = 1
    @State var showingScore = false
    @State var scoreTitle = ""
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.green.opacity(0.7),.red.opacity(0.5)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack{
                
                Text("Rock, Paper, Scissors?")
                    .font(.largeTitle)
                    .foregroundStyle(.primary)
                
                
                VStack(spacing: 50){
                    
                    Text(textResult)
                        .font(.title)
                    
                    Image(result)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .scaledToFit()
                        .foregroundStyle(.secondary)
                        .clipShape(.rect(cornerRadius: 20))
                    
                    
                    VStack(spacing: 30){
                        ForEach(0..<3){ number in
                            Button{
                                shouldWin = Bool.random()
                                if shouldWin {
                                    result = winningArray[number]
                                    score += 1
                                    textResult = "Another point to Griffindor"
                                    counter += 1
                                } else {
                                    result = loosingArray[number]
                                    score -= 1
                                    textResult = "-1 points from Griffindor"
                                    counter += 1
                                    
                                }
                                if counter == 10 {
                                    showingScore = true
                                }
                            } label: {
                                Text("\(move[number])")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue)
                                    .foregroundStyle(.white)
                                    .clipShape(Capsule())
                            }
                        }
                        
                    }
                    
                    .padding()
                }
                .frame(maxHeight: .infinity)
                .background(.ultraThinMaterial)
                .clipShape(.rect(cornerRadius: 20))
                .padding()
                Spacer()
                Text("Result: \(score)")
                    .font(.title.bold())
                
                Spacer()
                
                
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Restart", action: restartGame)
        } message: {
            Text("You ended the game with score \(score). Press restart for new game")
        }
    }
    func restartGame() {
        
        counter = 1
        score = 0
    }
}

#Preview {
    ContentView()
}
