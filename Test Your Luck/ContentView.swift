//
//  ContentView.swift
//  Test Your Luck
//
//  Created by Swapnil Bhattacharya on 27/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var guess = ""
    @State private var result = ""
    @State private var randomNumber = Int.random(in: 1...100)
    var body: some View {
        ZStack {
            Color(UIColor(red: 1.0, green: 0.75, blue: 0.8, alpha: 1.0))
                .ignoresSafeArea(.all)
            
            VStack (alignment: .center){
                Text("Guess the Number!")
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(Color.mint)
                
                TextField("Enter your guess", text: $guess)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .keyboardType(.numberPad)
                
                HStack {
                    Button(action: checkGuess) {
                        Text("Submit")
                            .padding()
                            .background(Color.mint)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    }
                    
                    Button(action: playAgain) {
                        Text("Play Again")
                            .padding()
                            .background(Color.mint)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    
                    
                    
                }
                
                
                
                Text(result)
                    .padding()
                    .foregroundColor(result == "Congratulations! You guessed correctly." ? Color.mint : Color.red)
                
                
            }
            .padding()
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("Created with love by")
                        .foregroundStyle(Color.pink)
                    Text("Swapnil Bhattacharya")
                        .padding()
                        .fontWeight(.bold)
                        .foregroundColor(.mint)
                }
            }
        }
        
    }
    func checkGuess() {
        if let userGuess = Int(guess) {
            if userGuess == randomNumber {
                result = "Congratulations! You guessed correctly."
            } else if userGuess < randomNumber {
                result = "Too Low! Try Again."
            } else {
                result = "Too High! Try Again."
            }
        } else {
            result = "Please enter a valid number."
        }
    }
    
    func playAgain() {
        guess = ""
        result = ""
        randomNumber = Int.random(in: 1...100)
    }
    
    
}

#Preview {
    ContentView()
}
