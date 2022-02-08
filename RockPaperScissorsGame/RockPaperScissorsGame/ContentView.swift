//
//  ContentView.swift
//  RockPaperScissorsGame
//
//  Created by simge on 8.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    private var moves : [String] = ["Rock  🪨","Paper  📃","Scissors  ✂️"]
        
    
    @State var score: Int = 0
    @State var currentMove: Int = Int.random(in: 0...2)
    @State var Win: Bool =  false
    
    
    var body: some View {
        
        ZStack{
            
            LinearGradient(gradient: Gradient(colors:[.black,.purple]), startPoint: .top, endPoint: .trailing)
                .ignoresSafeArea()
            
            VStack{
                
                //Title
                Text("Rock Paper Scissors Game")
                    .font(.title.weight(.bold))
                    .foregroundColor(.white)
                    .padding()
                
                
                VStack (spacing:20){
                    
                    Text("Computer move :\(moves[currentMove])")
                        .foregroundColor(.white)
                        .font(.subheadline.weight(.bold))
                    
                    Text("Choose your move")
                        .foregroundColor(.white)
                        .font(.subheadline.weight(.bold))
                        .padding()
                    
                    if Win {
                        Text("WIN")
                            .foregroundColor(.white)
                            .bold()
                    }else{
                        Text("LOSE")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
                
                VStack{
                    ForEach(0..<moves.count){move in
                        Button(moves[move]){
                            Results(move: move)
                        }
                        .padding()
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        
                    }
                }
            }
        }
     
    }
    
    
    
    func appsTurn() {
            currentMove = Int.random(in: 0...2)
            Win = Bool.random()
            
    }
        
    func Results(move: Int){
        
            if (currentMove == 2 && move == 0){
                Win = true
            
            }else if (currentMove + 1 == move){
                Win = true
            }
            
            appsTurn()
             
        }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


