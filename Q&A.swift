//
//  Q&A.swift
//  DecisionTree
//
//  Created by Mohamad Khadra on 1/18/20.
//  Copyright © 2020 Mohamad Khadra. All rights reserved.
//

import SwiftUI
var newNodeID2 : BinaryTree?
var root = makeThisTree()
struct Q_A: View {
    @State var showGameOver = false
    //@State var root = makeThisTree()
     var temp = root
    @State var temp3 = root
    @State var tryView : Bool = false
    @State var guessQ : String = startGame()
    @State var timeToGuess : Bool = false
    @State var newNodeID : BinaryTree?
    @State var temp2 : Bool = true
    var body: some View {
        ZStack{
            Color.yellow
            VStack{
                Text(guessQ)
                    .offset(y: -250)
                .font(.largeTitle)
            }
            VStack(spacing : 50.0){
                
                Button(action:
                    {
                        let result = self.switchTextYes()
                        if(result) {
                        self.showGameOver.toggle()
                        }
                })
                {
                    Text("Yes")
                    .fontWeight(.bold)
                        .font(.title)
                                           .padding()
                                           .background(Color.green)
                                           .cornerRadius(360)
                                           .foregroundColor(.black)
                                           .padding(10)
                                    
                    
                    
                        //.position(CGPoint(x:200,y:250))
                }
                .alert(isPresented: $showGameOver, content: { self.alert })
                Button(action:
                {
                    let reslt = self.switchTextNo()
                    if(reslt)
                    {
                        self.tryView.toggle()
                    }
                })
                {
                   Text("No")
                    .fontWeight(.bold)
                        .font(.title)
                                           .padding()
                                           .background(Color.red)
                                           .cornerRadius(360)
                                           .foregroundColor(.black)
                                           .padding(10)
                                    
                    .mask(Circle())
                    //.position(CGPoint(x:200,y:50))
                }.sheet(isPresented: $tryView, onDismiss:
                    {
                        //root = self.temp
                        self.temp3 = self.temp
                        self.guessQ = self.temp3!.question
                },
                    content: {
                    newObject()
                })
                
                //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }.navigationBarTitle("Animal Game")
        }.edgesIgnoringSafeArea(.all)
        
    }
    var alert: Alert {
        Alert(title: Text("I win!"), message: Text("Game Over"), dismissButton: .default(Text("Dismiss"), action: {
           // self.root = makeThisTree()
            //root = self.temp
            self.temp3 = self.temp
            self.guessQ = self.temp3!.question
        }))
       }
    func switchTextYes() -> Bool
    {
        if(temp3!.question == "")
        {
            return true
        }
        temp3 = temp3!.yesAns
        if(temp3!.question == "")
        {
            guessQ = temp3!.guess
        }
        else
        {
            guessQ = temp3!.question
        }
        return false
    }
    func switchTextNo() -> Bool
    {
        if(temp3!.question == "")
        {
            newNodeID2 = temp3
            return true
        }
        temp3 = temp3!.noAns
        if(temp3!.question == "")
        {
            guessQ = temp3!.guess
        }
        else
        {
            guessQ = temp3!.question
        }
        return false
    }
}

struct Q_A_Previews: PreviewProvider {
    static var previews: some View {
        Q_A()
    }
}
