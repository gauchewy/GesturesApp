//
//  SpotlightView2.swift
//  GesturesApp
//
//  Created by Qiwei on 1/23/23.
// Sanity check for Group in Previews working


import SwiftUI

struct SpotlightView2: ViewModifier {
    
    @State private var isPressed = false
    
    func body(content:Content) -> some View {
        ZStack{
            content
            Rectangle()
                .fill(Color.red)
                .opacity(isPressed ? 0.2 : 1)
                .gesture(
                    LongPressGesture(minimumDuration: 0.1)
                        .onEnded{ _ in
                            self.isPressed.toggle()
                        }
                )
        }
    }
    
}
