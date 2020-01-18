//
//  ContentView.swift
//  DecisionTree
//
//  Created by Mohamad Khadra on 1/18/20.
//  Copyright © 2020 Mohamad Khadra. All rights reserved.
//

import SwiftUI

struct ContentView: View {
   var body: some View
      {
          NavigationView {
                    
                     // Color.orange
                  NavigationLink(destination : Q_A())
                      {
                          Text("Play")
                             
                              .font(.largeTitle)
                              .multilineTextAlignment(.center)
                            .padding()
                              .background(Color.pink)
                                     .cornerRadius(360)
                                     .foregroundColor(.black)
                            .padding(.horizontal, 150.0)
                  }
              .navigationBarTitle("Guessing Game")
          .navigationBarBackButtonHidden(true)
          }
      }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
