//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by simge on 4.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    //Total score-Challange
    @State private var totalScore = 0
    
    @State private var countries = ["Estonia","France","Germany","Ireland","Italy","Nigeria","Poland","Russia","Spain","UK","US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2) //0,1,2
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack{
            
            //BACKGROUND
            LinearGradient(gradient: Gradient(colors: [.indigo, .black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            
            VStack (spacing:30){
                
                Spacer()
                //Title
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                
                VStack(spacing : 30){
                    VStack{
                        Text("Tap the flag of")
                            .foregroundStyle(.white)
                            .font(.subheadline.weight(.heavy))
                        //Country Name
                        Text(countries[correctAnswer])
                            .foregroundStyle(.white)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3){number in
                        Button{
                            //flag was tapped
                            flagTapped(number)
                        }label:{
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                }
                
                Spacer()
                Spacer()
                Text("Score: \(totalScore)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue" , action : askQuestion)
        }message: {
            Text("Your score is \(totalScore)")
        }
    }
    
    //FUNC
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            totalScore += 1
            if totalScore == 8 {
                scoreTitle = "You won! your score: \(totalScore) and score has been reset"
                totalScore = 0 //reset() ??
            }
        } else {
            scoreTitle = "Wrong That's flag of \(countries[number])"
            totalScore -= 1
        }

        showingScore = true
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
