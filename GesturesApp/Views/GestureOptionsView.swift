//
//  GestureOptionsView.swift
//  GesturesApp
//
//  Created by Qiwei on 1/19/23.
//

import SwiftUI

struct GestureOptionsView: View {
    
    @State private var gestureChoice = ""
    @State private var gestureOptions = [
        "Cross-Buttons",
        "Three-Tap",
        "SpotLight",
        "Face ID"
    ]
    
    @State private var gestureViews = [
        CrossButtonsView(),
        CrossButtonsView(),
        CrossButtonsView(),
        CrossButtonsView()
    ]
    
    var body: some View {
        
        NavigationStack{
            VStack{
                
                Title()
                
                VStack{
                    ForEach(0..<4) { num in
                        NavigationLink{
                            WrapperView(content: gestureViews[num])
                        }label: {
                            Text("\(gestureOptions[num])")
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
}

struct GestureOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        GestureOptionsView()
    }
}
