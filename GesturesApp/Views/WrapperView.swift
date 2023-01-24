//
//  WrapperView.swift
//  GesturesApp
//
//  Created by Qiwei on 1/23/23.
//

import SwiftUI

//struct WrapperView<Content: View>: View {   //CHANGED TO HARDCODE CROSSBUTTONS IN WRAPPERVIEW
struct WrapperView : View {
    
    //@State private var isPressed2 = false
    var isPressed2: Bool
    
    var body: some View {
        ZStack {
            
            Image("frog")
                .resizable()
                .scaledToFit()
            
            Rectangle()
                .fill(Color.blue)
                .opacity(isPressed2 ? 0 : 0.5)
            
            CrossButtonsView()
            
        }
    }
}

struct WrapperView_Previews: PreviewProvider {

    static var previews: some View {

        Group{
            WrapperView(isPressed2: true)
        }
    }
}
