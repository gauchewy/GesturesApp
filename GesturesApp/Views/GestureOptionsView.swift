//
//  GestureOptionsView.swift
//  GesturesApp
//
//  Created by Qiwei on 1/19/23.
//

import SwiftUI

struct GestureOptionsView: View {
    
    @State private var gestureChoice = ""
    @State private var gestureOptions = ["Cross-Buttons", "Three-Tap", "Face ID", "Hold Till Buzz"]
    
    var body: some View {
        VStack{
            
            Title()
            
            VStack{
                ForEach(gestureOptions, id: \.self){ num in
                    Button(action: {
                        gestureChoice = num
                    }){
                        Text("\(num)")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
}

struct GestureOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        GestureOptionsView()
    }
}
