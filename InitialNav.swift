//
//  InitialNav.swift
//  DecisionTree
//
//  Created by Mohamad Khadra on 1/18/20.
//  Copyright © 2020 Mohamad Khadra. All rights reserved.
//

import SwiftUI
var gameType : String = ""
struct InitialNav: View {
    
      let gameTypes = ["Animal Game", "Movie Game", "Song Game"]
      
      var body: some View {
          NavigationView {
              List {
                  VStack(alignment: .center){
                    NavigationLink(destination: Q_A())
                      {
                          Text("Animal Game")
                              .font(.largeTitle)
                          .gesture(TapGesture()
                              .onEnded({ _ in
                                  
                                  gameType = "Animal"
                              }))
                      }

                  }
                  VStack{
                      NavigationLink(destination: Q_A())
                      {
                          Text("Movie Game")
                              .font(.largeTitle)
                          .gesture(TapGesture()
                                                    .onEnded({ _ in
                                                        
                                                        gameType = "Movie"
                                                    }))
                      }
                    
                  }
                  VStack{
                      NavigationLink(destination: Q_A())
                      {
                          Text("Music Game")
                              .font(.largeTitle)
                          .gesture(TapGesture()
                                                    .onEnded({ _ in
                                                        
                                                        gameType = "Music"
                                                    }))
                    }
                  }
              }
              .navigationBarTitle("Game Types")
          .navigationBarBackButtonHidden(true)
              
          }
                  
                  
      }
}

struct InitialNav_Previews: PreviewProvider {
    static var previews: some View {
        InitialNav()
    }
}
