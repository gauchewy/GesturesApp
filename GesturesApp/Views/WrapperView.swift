//
//  WrapperView.swift
//  GesturesApp
//
//  Created by Qiwei on 1/23/23.
//

import SwiftUI

struct WrapperView : View {
    
    @State var isPressed = false
    
    var body: some View {
        ZStack {
            
            Image("frog")
                .resizable()
                .scaledToFit()
            
            Rectangle()
                .fill(Color.blue)
                .opacity(self.isPressed ? 0 : 0.5)
            
            CrossButtonsView()
            
        }
    }
}

struct WrapperView_Previews: PreviewProvider {

    static var previews: some View {

        Group{
            WrapperView()
        }
    }
}
